begin {
    # NB: Each cmdlet invocation can silentlyContinue since the cmdlets will log their success or failure, and
    # this script should never abort because of an error.
    $ErrorActionPreference = 'SilentlyContinue'

    Set-Variable -Name ConstAppId -Option Constant -Value "9B27DF2F-5386-41DF-B52B-5DF81914B043"
    Set-Variable -Name ConstSetupUninstallRegKeyPath -Option Constant -Value "Software\Microsoft\Windows\CurrentVersion\Uninstall\$ConstAppId`_is1"
    Set-Variable -Name ConstWindowsAppName -Option Constant -Value "WindowsAdminCenter"
    Set-Variable -Name ConstWindowsServiceName -Option Constant -Value "$ConstWindowsAppName"
    Set-Variable -Name ConstWindowsAdminCenterRegKeyName -Option Constant -Value "$ConstWindowsAppName"
    Set-Variable -Name ConstKeyAllAccess -Option Constant -Value 0xF003F
    Set-Variable -Name ConstScriptName -Option Constant -Value "Update-WACClusterNodeConfiguration.ps1"
    Set-Variable -Name ConstInstallerAppId -Option Constant -Value "9B27DF2F-5386-41DF-B52B-5DF81914B043"
    Set-Variable -Name ConstUninstallRegKeyPath -Option Constant -Value "Software\Microsoft\Windows\CurrentVersion\Uninstall\$ConstInstallerAppId`_is1"
    Set-Variable -Name ConstUninstallRegKey -Option Constant -Value "HKLM:$ConstUninstallRegKeyPath"
    Set-Variable -Name ConstTrustedHostsRegPropertyName -Option Constant -Value "Inno Setup CodeFile: TrustedHostsMode"
    Set-Variable -Name ConstPortMainRegPropertyName -Option Constant -Value "Inno Setup CodeFile: PortMain"
    Set-Variable -Name ConstPortSub1RegPropertyName -Option Constant -Value "Inno Setup CodeFile: PortSub1"
    Set-Variable -Name ConstPortSub2RegPropertyName -Option Constant -Value "Inno Setup CodeFile: PortSub2"
    Set-Variable -Name ConstThumbprintRegPropertyName -Option Constant -Value "Inno Setup CodeFile: Thumbprint"
    Set-Variable -Name ConstTrustedHostsRegPropertyConfiguredValue -Option Constant -Value "ConfigureTrustedHosts"
    Set-Variable -Name ConstTrustedHostsRegPropertyNotConfiguredValue -Option Constant -Value "NotConfigureTrustedHosts"
    Set-Variable -Name REG_OPTION_NON_VOLATILE -Option Constant -Value 0x00000000
    Set-Variable -Name ERROR_FILE_NOT_FOUND -Option Constant -Value 2
    Set-Variable -Name ConstServicePathNameQuery -Option Constant -Value "Select Name, PathName from Win32_Service where Name = '$ConstWindowsServiceName'"
    Set-Variable -Name ConstCimV2NamespaceName -Option Constant -Value "root\CimV2"
    Set-Variable -Name ConstPowerShellConfigurationModuleName -Option Constant -Value "Microsoft.WindowsAdminCenter.Configuration"
    Set-Variable -Name ConstPoweShellModulesFolderName -Option Constant -Value "PowerShellModules"
    
    enum WACNodeConfigurationState {
        Unknown = 0
        NodeConfigured = 1
        NodeNotConfigured = 2
        NodeCleanupNeeded = 3
    }

$clusApi = Add-Type -NameSpace 'Lib.Clusapi' -name clusapiLib -MemberDefinition @"
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=true, ExactSpelling=true)]
public static extern IntPtr OpenCluster(string clusterName);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=true, ExactSpelling=true)]
public static extern IntPtr GetClusterKey(IntPtr hCluster, int samDesired);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=false, ExactSpelling=true)]
public static extern int ClusterRegOpenKey(IntPtr hKey, string lpszSubKey, int samDesired, ref IntPtr phkResult);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=false, ExactSpelling=true)]
public static extern int ClusterRegCreateKey(IntPtr hKey, string lpszSubKey, int options, int samDesired, ref IntPtr lpSecurityAttributes, ref IntPtr phkResult, ref IntPtr lpdwDisposition);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=false, ExactSpelling=true)]
public static extern int ClusterRegDeleteKey(IntPtr hKey, string lpszSubKey);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=false, ExactSpelling=true)]
public static extern int ClusterRegCloseKey(IntPtr hKey);
[DllImport("clusapi.dll", CharSet = CharSet.Unicode, SetLastError=false, ExactSpelling=true)]
public static extern bool CloseCluster(IntPtr hCluster);
[DllImport("kernel32.dll")]
public static extern int GetLastError();
"@ -PassThru
}
process {
<#
    .SYNOPSIS
        Test the passed in node name as a key under the WAC key of the cluster registry.
        
    .DESCRIPTION
        When a node becomes configured for WAC the reg key named the same as the node name under the WAC key must be present to prevent
        this scheduled task script from configuring it again.  Not all of the Microsoft.WindowsAdminCenter.Configuration cmdlets
        are idempotent and non-destructive.

    #>
    function TestWACNodeKeyInClusterRegistry {
        [OutputType([Bool])]
        Param()

        $nodeName = (HostName)

        $clusterName = (Get-Cluster -ErrorVariable err).Name
        if (!!$err) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error getting the cluster name for $hostName. Error: $err"
            return $false
        }

        $result = 0
        $hCluster = $clusapi::OpenCluster($nul)
        if ($hCluster -eq $nul) {
            $result = $clusApi::GetLastError()
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 0 `
                -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error getting the cluster handle for $clusterName. Error code: $result"
            return $false
        }

        try {
            $clusterKey = 0
            $clusterKey = $clusapi::GetClusterKey($hCluster, $ConstKeyAllAccess)
            if ($clusterKey -eq $nul) {
                $result = $clusApi::GetLastError()
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error getting the cluster key for $clusterName. Error code: $result"
                return $false
            }

            try {
                $WACRegKey = 0
                $result = $clusapi::ClusterRegOpenKey($clusterKey, $ConstWindowsAdminCenterRegKeyName, $ConstKeyAllAccess, [ref]$WACRegKey)
                if ($result -ne 0) {
                    Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                        -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error getting the cluster key for $clusterName. Error code: $result"
                    return $false
                }
                
                try {
                    $WACNodeKey = 0
                    $result = $clusapi::ClusterRegOpenKey($WACRegKey, $nodeName, $ConstKeyAllAccess, [ref]$WACNodeKey)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error creating the cluster reg key for $nodeName under $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                        return $false
                    }

                    $result = $clusapi::ClusterRegCloseKey($WACNodeKey)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error closing the cluster reg key for $nodeName. Error code: $result"
                    }

                    return $true

                } finally {
                    $result = $clusapi::ClusterRegCloseKey($WACRegKey)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error closing the cluster reg key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                    }
                }
            } finally {
                $result = $clusapi::ClusterRegCloseKey($clusterKey)
                if ($result -ne 0) {
                    Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                        -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error closing the cluster reg key. Error code: $result"
                }
            }
        } finally {
            $result = $clusapi::CloseCluster($hCluster)
            if ($result -ne 0) {
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:TestWACNodeKeyInClusterRegistry: There was an error closing the cluster handle. Error code: $result"
            }
        }
    }

    <#
    .SYNOPSIS
        Add the passed in node name as a new key under the WAC key of the cluster registry.
        
    .DESCRIPTION
        When a node becomes configured for WAC the reg key named the same as the node name under the WAC key must be added to prevent
        this scheduled task script from configuring it again.  Not all of the Microsoft.WindowsAdminCenter.Configuration cmdlets
        are idempotent and non-destructive.

    #>
    function AddWACNodeKeyToClusterRegistry {
        $nodeName = (HostName)

        $clusterName = (Get-Cluster -ErrorVariable err).Name
        if (!!$err) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error getting the cluster name for $nodeName. Error: $err"
            return
        }

        $result = 0
        $hCluster = $clusapi::OpenCluster($nul)
        if ($hCluster -eq $nul) {
            $result = $clusApi::GetLastError()
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 0 `
                -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error getting the cluster handle for $clusterName. Error code: $result"
            return
        }

        try {
            $clusterKey = 0
            $clusterKey = $clusapi::GetClusterKey($hCluster, $ConstKeyAllAccess)
            if ($clusterKey -eq $nul) {
                $result = $clusApi::GetLastError()
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error getting the cluster key for $clusterName. Error code: $result"
                return
            }

            try {
                $WACRegKey = 0
                $result = $clusapi::ClusterRegOpenKey($clusterKey, $ConstWindowsAdminCenterRegKeyName, $ConstKeyAllAccess, [ref]$WACRegKey)
                if ($result -ne 0) {
                    if ($result -eq $ERROR_FILE_NOT_FOUND) {
                        $lpSecurityAttributes = 0
                        $phkResult = 0
                        $lpdwDisposition = 0
                                $result = $clusapi::ClusterRegCreateKey($clusterKey, $ConstWindowsAdminCenterRegKeyName, $REG_OPTION_NON_VOLATILE, $ConstKeyAllAccess, [ref]$lpSecurityAttributes, [ref]$phkResult, [ref]$lpdwDisposition)
                        if ($result -ne 0) {
                            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                                -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error creating the cluster key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                            return
                        }

                        $result = $clusapi::ClusterRegOpenKey($clusterKey, $ConstWindowsAdminCenterRegKeyName, $ConstKeyAllAccess, [ref]$WACRegKey)
                        if ($result -ne 0) {
                            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                                -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error getting the cluster key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                            return
                        }

                    } else {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error getting the cluster key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                        return
                    }
                }
                
                try {
                    # These must be 0 for each call to ClusterRegCreateKey
                    $lpSecurityAttributes = 0
                    $phkResult = 0
                    $lpdwDisposition = 0
                    $result = $clusapi::ClusterRegCreateKey($WACRegKey, $nodeName, $REG_OPTION_NON_VOLATILE, $ConstKeyAllAccess, [ref]$lpSecurityAttributes, [ref]$phkResult, [ref]$lpdwDisposition)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error creating the cluster reg key for $nodeName under $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                        return
                    }
                } finally {
                    $result = $clusapi::ClusterRegCloseKey($WACRegKey)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error closing the cluster reg key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                    }
                }
            } finally {
                $result = $clusapi::ClusterRegCloseKey($clusterKey)
                if ($result -ne 0) {
                    Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                        -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error closing the cluster reg key. Error code: $result"
                }
            }
        } finally {
            $result = $clusapi::CloseCluster($hCluster)
            if ($result -ne 0) {
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:AddWACNodeKeyToClusterRegistry: There was an error closing the cluster handle. Error code: $result"
            }
        }
    }

    <#
    .SYNOPSIS
        Remove the passed in node name key from the WAC key of the cluster registry.
        
    .DESCRIPTION
        When a node becomes not configured for WAC the reg key named the same as the node name under the WAC key must be removed.

    #>
    function RemoveWACNodeKeyFromClusterRegistry {
        $nodeName = (HostName)

        $clusterName = (Get-Cluster -ErrorVariable err).Name
        if (!!$err) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error getting the cluster name for $nodeName. Error: $err"
            return
        }

        $result = 0
        $hCluster = $clusapi::OpenCluster($null)
        if ($hCluster -eq $nul) {
            $result = $clusApi::GetLastError()
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 0 `
                -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error getting the cluster handle for $clusterName. Error code: $result"
            return
        }

        try {
            $clusterKey = 0
            $clusterKey = $clusapi::GetClusterKey($hCluster, $ConstKeyAllAccess)
            if ($clusterKey -eq $nul) {
                $result = $clusApi::GetLastError()
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error getting the cluster key for $clusterName. Error code: $result"
                return
            }
        
            try {
                $WACRegKey = 0
                $result = $clusapi::ClusterRegOpenKey($clusterKey, $ConstWindowsAdminCenterRegKeyName, $ConstKeyAllAccess, [ref]$WACRegKey)
                if ($result -ne 0) {
                    Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                        -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error getting the cluster key for $clusterName. Error code: $result"
                    return
                }
                
                try {
                    $result = $clusapi::ClusterRegDeleteKey($WACRegKey, $nodeName)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error removing the cluster reg key for $nodeName under $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                        return
                    }
                } finally {
                    $result = $clusapi::ClusterRegCloseKey($WACRegKey)
                    if ($result -ne 0) {
                        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                            -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error closing the cluster reg key for $ConstWindowsAdminCenterRegKeyName. Error code: $result"
                    }
                }
            } finally {
                $clusapi::ClusterRegCloseKey($clusterKey)
                if ($result -ne 0) {
                    Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                        -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error closing the cluster reg key. Error code: $result"
                }
            }
        } finally {
            $result = $clusapi::CloseCluster($hCluster)
            if ($result -ne 0) {
                Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                    -Message "$ConstScriptName`:RemoveWACNodeKeyFromClusterRegistry: There was an error closing the cluster handle. Error code: $result"
            }
       }
    }

    function UpdateWACRegistryKey {
        $keyFound = TestWACNodeKeyInClusterRegistry
        if (!$keyFound) {
            AddWACNodeKeyToClusterRegistry
        }
    }

    function GetNodeConfigurationState {
        [OutputType([WACNodeConfigurationState])]
        Param(
        )
        
        $serviceFound = Microsoft.WindowsAdminCenter.Configuration\Test-WACService
        $roleFound = Microsoft.WindowsAdminCenter.Configuration\Test-WACClusterRole

        if ($serviceFound -and $roleFound) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
                -Message "$ConstScriptName`:GetNodeConfigurationState: This node has been configured to run the WAC HA GW service."
            return [WACNodeConfigurationState]::NodeConfigured
        }

        if (!$serviceFound -and $roleFound) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
                -Message "$ConstScriptName`:GetNodeConfigurationState: This node has not been configured to run the WAC HA GW service."
            return [WACNodeConfigurationState]::NodeNotConfigured
        }

        if ($serviceFound -and !$roleFound) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
                -Message "$ConstScriptName`:GetNodeConfigurationState: This node needs to be cleaned up since the WAC HA GW has been uninstalled."
            return [WACNodeConfigurationState]::NodeCleanupNeeded
        }

        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
            -Message "$ConstScriptName`:GetNodeConfigurationState: The HA GW role has been uninstalled and this node has been cleaned up."
        return [WACNodeConfigurationState]::Unknown
    }

    function GetPowerShellModulesPathSpec {
        $nodeName = (HostName)
        $service = Get-CimInstance -Namespace $ConstCimV2NamespaceName -Query $ConstServicePathNameQuery -ErrorVariable error
        if (!!$err) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:GetPowerShellModulesPathSpec: There was an error getting the GW service on node $nodeName. Error: $err"
        
            return $null
        }

        $programFilesPathSpec = Split-Path -Path $service.PathName -Parent  | Split-Path -Parent
        $pathSpec = Join-Path -Path $programFilesPathSpec -ChildPath $ConstPoweShellModulesFolderName

        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
            -Message "$ConstScriptName`:GetPowerShellModulesPathSpec: The PowerShell modules pathspec is $pathSpec"

        return $pathSpec
    }

    function GetUninstallRegistryKey {
        $regValue = Get-ItemProperty -Path $ConstUninstallRegKey -ErrorAction SilentlyContinue -ErrorVariable err
    
        if (!!$err) {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:GetUninstallRegistryKey: The registry key $ConstUninstallRegKey was not found. Error: $err"

            return $null
        }
    
        return $regValue
    }
    
    function ConfigureTrustedHosts {
        $regKey = GetUninstallRegistryKey
        if (!!$regKey) {
            $propertyValue = $regKey.$ConstTrustedHostsRegPropertyName
            if ($propertyValue -eq $ConstTrustedHostsRegPropertyConfiguredValue) {
                Microsoft.WindowsAdminCenter.Configuration\Set-WACWinRmTrustedHosts -TrustAll

                return
            }

            if ($propertyValue -eq $ConstTrustedHostsRegPropertyNotConfiguredValue) {
                # Not sure what to do here...
                # If trusted hosts is not '*' then the list of trusted hosts needs to be saved
                # somewhere so it can be applied to the other nodes of the cluster.
            }
        }
    }

    function ConfigureHttpsPorts {
        $params = @{}

        $regKey = GetUninstallRegistryKey
        if (!!$regKey) {
            $port = $regKey.$ConstPortMainRegPropertyName
            $params += @{"Port" = $port}

            $thumbprint = $regKey.$ConstThumbprintRegPropertyName
            if (!!$thumbprint) {
                $params += @{"Thumbprint" = $thumbprint}
            }

            Microsoft.WindowsAdminCenter.Configuration\Register-WACHttpSys @params
        }
    }

    function ConfigureFirewallRule {
        $regKey = GetUninstallRegistryKey
        if (!!$regKey) {
            $port = $regKey.$ConstPortMainRegPropertyName

            Microsoft.WindowsAdminCenter.Configuration\Register-WACFirewallRule -Port $port
        }
    }

    function ConfigureNode {
        try {
            $nodeName = (HostName)
            Microsoft.WindowsAdminCenter.Configuration\Register-WACConfigurationApplicationEventLogSource
            Microsoft.WindowsAdminCenter.Configuration\New-WACEventLog

            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
                -Message "$ConstScriptName`:ConfigureNode: Configuring node $nodeName so that it can host the HA WAC GW."
    
            Microsoft.WindowsAdminCenter.Configuration\Import-WACBuildSignerCertificate
            Microsoft.WindowsAdminCenter.Configuration\Update-WACPSModulePath -Operation Add
            Microsoft.WindowsAdminCenter.Configuration\Remove-WACSelfSignedCertificates

            # This will read from appsettings.json and install all of the .cer files found there.
            #Microsoft.WindowsAdminCenter.Configuration\Add-WACClusterCertificates
                
            Microsoft.WindowsAdminCenter.Configuration\Enable-WACPSRemoting
            Microsoft.WindowsAdminCenter.Configuration\Register-WACUpdaterScheduledTask
            Microsoft.WindowsAdminCenter.Configuration\Register-WACService 
            Microsoft.WindowsAdminCenter.Configuration\Register-WACAccountManagementService
            Microsoft.WindowsAdminCenter.Configuration\Set-WACCertificateAcl

            ConfigureTrustedHosts
            ConfigureHttpsPorts
            ConfigureFirewallRule

            Microsoft.WindowsAdminCenter.Configuration\Register-WACLocalCredSSP

            AddWACNodeKeyToClusterRegistry
        } catch {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:ConfigureNode: There was an error configuring node $nodeName so that it can host the HA WAC GW. Error: $_"
        }
    }

    function CleanupNode {
        $nodeName = (HostName)
        Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level INFO -ExitCode 0 `
            -Message "$ConstScriptName`:CleanupNode: Cleaning up node $nodeName as the the HA WAC GW has been uninstalled from this cluster."

        try {
            # This will read from appsettings.json and remove all of the .cer files found there.
            #Microsoft.WindowsAdminCenter.Configuration\Remove-WACClusterCertifactes

            Microsoft.WindowsAdminCenter.Configuration\Remove-WACSelfSignedCertificates 
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACHttpSys 
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACService 
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACAccountManagementService
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACUpdaterScheduledTask
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACLocalCredSsp
            Microsoft.WindowsAdminCenter.Configuration\Unregister-WACFirewallRule
            Microsoft.WindowsAdminCenter.Configuration\Update-WACPSModulePath -Operation Remove
            Microsoft.WindowsAdminCenter.Configuration\Remove-WACEventLog -ClusterDetected

            RemoveWACNodeKeyFromClusterRegistry
        } catch {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:CleanupNode There was an error Cleaning up node $nodeName as the the HA WAC GW has been uninstalled from this cluster. Error: $_"
        }
    }

    function main {
        $modulePathSpec = Join-Path -Path (GetPowerShellModulesPathSpec) -ChildPath $ConstPowerShellConfigurationModuleName
        if (!!$modulePathSpec) {
            Import-Module $modulePathSpec -ErrorVariable err
            if (!$err) {
                # NB: Since this script in running in a task then this cluster has/had WAC installed...
                $configurationState = GetNodeConfigurationState
                switch ($configurationState) {
                    NodeNotConfigured { ConfigureNode }
                    NodeCleanupNeeded { CleanupNode }
                    NodeConfigured { UpdateWACRegistryKey }
                }

                # Check the WAC key in the cluster registry, and when there are no entries this task can be stopped.
                # and a run once task to delete the Microsoft.WindowsAdminCenter.Configuration PS module can be 
                # spun up.
            }
        } else {
            Microsoft.WindowsAdminCenter.Configuration\Write-Log -Level ERROR -ExitCode 1 `
                -Message "$ConstScriptName`:main: The PowerShell configuration module $ConstPowerShellConfigurationModuleName was not found!"
        }
    }

    return main
}
end {
}

# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBmdTZag0xW2SKk
# eNK5bSL3x+8p/BIM3+c1x8TeXBZaVKCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
# Bv9XKydyAAAAAAQEMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQwOTEyMjAxMTE0WhcNMjUwOTExMjAxMTE0WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQC0KDfaY50MDqsEGdlIzDHBd6CqIMRQWW9Af1LHDDTuFjfDsvna0nEuDSYJmNyz
# NB10jpbg0lhvkT1AzfX2TLITSXwS8D+mBzGCWMM/wTpciWBV/pbjSazbzoKvRrNo
# DV/u9omOM2Eawyo5JJJdNkM2d8qzkQ0bRuRd4HarmGunSouyb9NY7egWN5E5lUc3
# a2AROzAdHdYpObpCOdeAY2P5XqtJkk79aROpzw16wCjdSn8qMzCBzR7rvH2WVkvF
# HLIxZQET1yhPb6lRmpgBQNnzidHV2Ocxjc8wNiIDzgbDkmlx54QPfw7RwQi8p1fy
# 4byhBrTjv568x8NGv3gwb0RbAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU8huhNbETDU+ZWllL4DNMPCijEU4w
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMjkyMzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAIjmD9IpQVvfB1QehvpC
# Ge7QeTQkKQ7j3bmDMjwSqFL4ri6ae9IFTdpywn5smmtSIyKYDn3/nHtaEn0X1NBj
# L5oP0BjAy1sqxD+uy35B+V8wv5GrxhMDJP8l2QjLtH/UglSTIhLqyt8bUAqVfyfp
# h4COMRvwwjTvChtCnUXXACuCXYHWalOoc0OU2oGN+mPJIJJxaNQc1sjBsMbGIWv3
# cmgSHkCEmrMv7yaidpePt6V+yPMik+eXw3IfZ5eNOiNgL1rZzgSJfTnvUqiaEQ0X
# dG1HbkDv9fv6CTq6m4Ty3IzLiwGSXYxRIXTxT4TYs5VxHy2uFjFXWVSL0J2ARTYL
# E4Oyl1wXDF1PX4bxg1yDMfKPHcE1Ijic5lx1KdK1SkaEJdto4hd++05J9Bf9TAmi
# u6EK6C9Oe5vRadroJCK26uCUI4zIjL/qG7mswW+qT0CW0gnR9JHkXCWNbo8ccMk1
# sJatmRoSAifbgzaYbUz8+lv+IXy5GFuAmLnNbGjacB3IMGpa+lbFgih57/fIhamq
# 5VhxgaEmn/UjWyr+cPiAFWuTVIpfsOjbEAww75wURNM1Imp9NJKye1O24EspEHmb
# DmqCUcq7NqkOKIG4PVm3hDDED/WQpzJDkvu4FrIbvyTGVU01vKsg4UfcdiZ0fQ+/
# V0hf8yrtq9CkB8iIuk5bBxuPMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGiYwghoiAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAQEbHQG/1crJ3IAAAAABAQwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIEvkZhtC9ZIf7UoPxrEjtO/u
# N2vHII3WkboGw4TW2JmkMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAkK0axnsfn7PDzde+PmJ3Euj8T8d3sBFg+OMwTdVsh9FJZIcinasS8299
# +QFFs97RQAgt1Q4faGV2ORiPiqxEGs8yMiK0xkh3hJzE1TuoWEojFf6AqzEB1Nl4
# Ya798dXvzfNjIWpo/7YY1MXBmXWyjFdpiiY6fq7775s6th0Wv6cO1oST/NUvKJax
# UOwlsXuU0MNyZDsZgHnQIHqw8AA5KY2mCZ1g/CKOnrt+LYK3rKGBBHUXuu2NwpSv
# F2A8A5AguZ8l5L/MYTzr3v0+N7KlXsB0MgfmhO8gMlhmiDshDM+stUJ2KA3mcOLr
# PhKJvxQrvhJ0cx6VCSnv6tbZc8p7iaGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCC
# F5gGCSqGSIb3DQEHAqCCF4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsq
# hkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCAveR0uxUOLxltukes4eCnIwmsiMQfnLaIQIDEL24yhXQIGZ0pe0/0S
# GBMyMDI0MTIwOTE4Mjk1Ni44NjlaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# Tjo2NTFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaCCEf4wggcoMIIFEKADAgECAhMzAAAB9ZkJlLzxxlCMAAEAAAH1MA0G
# CSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0
# MDcyNTE4MzEwMVoXDTI1MTAyMjE4MzEwMVowgdMxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9w
# ZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjY1MUEt
# MDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAzO90cFQTWd/WP84IT7JM
# IW1fQL61sdfgmhlfT0nvYEb2kvkNF073ZwjveuSWot387LjE0TCiG93e6I0HzIFQ
# BnbxGP/WPBUirFq7WE5RAsuhNfYUL+PIb9jJq3CwWxICfw5t/pTyIOHjKvo1lQOT
# WZypir/psZwEE7y2uWAPbZJTFrKen5R73x2Hbxy4eW1DcmXjym2wFWv10sBH40aj
# Jfe+OkwcTdoYrY3KkpN/RQSjeycK0bhjo0CGYIYa+ZMAao0SNR/R1J1Y6sLkiCJO
# 3aQrbS1Sz7l+/qJgy8fyEZMND5Ms7C0sEaOvoBHiWSpTM4vc0xDLCmc6PGv03CtW
# u2KiyqrL8BAB1EYyOShI3IT79arDIDrL+de91FfjmSbBY5j+HvS0l3dXkjP3Hon8
# b74lWwikF0rzErF0n3khVAusx7Sm1oGG+06hz9XAy3Wou+T6Se6oa5LDiQgPTfWR
# /j9FNk8Ju06oSfTh6c03V0ulla0Iwy+HzUl+WmYxFLU0PiaXsmgudNwVqn51zr+B
# i3XPJ85wWuy6GGT7nBDmXNzTNkzK98DBQjTOabQXUZ884Yb9DFNcigmeVTYkyUXZ
# 6hscd8Nyq45A3D3bk+nXnsogK1Z7zZj6XbGft7xgOYvveU6p0+frthbF7MXv+i5q
# cD9HfFmOq4VYHevVesYb6P0CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRV4Hxb9Uo0
# oHDwJZJe22ixe2B1ATAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBf
# BgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmww
# bAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0El
# MjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUF
# BwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAcwxmVPaA9xHf
# fuom0TOSp2hspuf1G0cHW/KXHAuhnpW8/Svlq5j9aKI/8/G6fGIQMr0zlpau8jy8
# 3I4zclGdJjl5S02SxDlUKawtWvgf7ida06PgjeQM1eX4Lut4bbPfT0FEp77G76hh
# ysXxTJNHv5y+fwThUeiiclihZwqcZMpa46m+oV6igTU6I0EnneotMqFs0Q3zHgVV
# r4WXjnG2Bcnkip42edyg/9iXczqTBrEkvTz0UlltpFGaQnLzq+No8VEgq0UG7W1E
# LZGhmmxFmHABwTT6sPJFV68DfLoC0iB9Qbb9VZ8mvbTV5JtISBklTuVAlEkzXi9L
# IjNmx+kndBfKP8dxG/xbRXptQDQDaCsS6ogLkwLgH6zSs+ul9WmzI0F8zImbhnZh
# UziIHheFo4H+ZoojPYcgTK6/3bkSbOabmQFf95B8B6e5WqXbS5s9OdMdUlW1gTI1
# r5u+WAwH2KG7dxneoTbf/jYl3TUtP7AHpyck2c0nun/Q0Cycpa9QUH/Dy01k6tQo
# mNXGjivg2/BGcgZJ0Hw8C6KVelEJ31xLoE21m9+NEgSKCRoFE1Lkma31SyIaynbd
# YEb8sOlZynMdm8yPldDwuF54vJiEArjrcDNXe6BobZUiTWSKvv1DJadR1SUCO/Od
# 21GgU+hZqu+dKgjKAYdeTIvi9R2rtLYwggdxMIIFWaADAgECAhMzAAAAFcXna54C
# m0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZp
# Y2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMy
# MjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51
# yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY
# 6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9
# cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN
# 7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDua
# Rr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74
# kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2
# K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5
# TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZk
# i1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9Q
# BXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3Pmri
# Lq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUC
# BBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9y
# eS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUA
# YgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU
# 1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2Ny
# bC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIw
# MTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0w
# Ni0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/yp
# b+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulm
# ZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM
# 9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECW
# OKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4
# FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3Uw
# xTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPX
# fx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVX
# VAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGC
# onsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU
# 5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEG
# ahC0HVUzWLOhcGbyoYIDWTCCAkECAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# Tjo2NTFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaIjCgEBMAcGBSsOAwIaAxUAJsAKu48NbR5YRg3WSBQCyjzdkvaggYMw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsF
# AAIFAOsBYyEwIhgPMjAyNDEyMDkxMjM3NTNaGA8yMDI0MTIxMDEyMzc1M1owdzA9
# BgorBgEEAYRZCgQBMS8wLTAKAgUA6wFjIQIBADAKAgEAAgIdUQIB/zAHAgEAAgIT
# BjAKAgUA6wK0oQIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAow
# CAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQCJGv6+Pxur
# v2lKoiposomJKuzWThoAJP8UCnoItcQrvVgoDoeDcQE4PClYEAZGqe6M8xGSxlA/
# zc1+GnNvBQzaLVc+dv4sm1//7dSnGOEiwbkDikCT/XsTYuJuYIzAkCEddZs6HFYU
# g+xBGHmbpcUE0B3YKDZ3owJEtqFU2oWQuwrMiSwVOj26fFkc2sxr2uD46F9OGb8E
# yoV8PU5hP7e90xwsL0Dsc7aXsSqnDRlhn8eWabBmgJeLrAY1KZS43T/m42YOvpAI
# wA3hPwkB3oweIPBWohOqcD+2IewcRzMbBlQguegrTHE4V5Roa+mh+S1Wvmbf7TgT
# gBe/+EoJW8TBMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAH1mQmUvPHGUIwAAQAAAfUwDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgj4kRv0WJ
# EYRhwLRMRN0//TSpuJUX3XLREcO6j4QlijQwgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCDB1vLSFwh09ISu4kdEv4/tg9eR1Yk8w5x7j5GThqaPNTCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB9ZkJlLzxxlCMAAEA
# AAH1MCIEIMzidVz5M4qisa5WSlIFSz4OgVT54pW2Qfd0XWvIHNAnMA0GCSqGSIb3
# DQEBCwUABIICAIN819iqwF+hfZ80Yjllm20ToM7+E/23Ge8f8pMZGmOrNKgGjUAo
# ZCaY16fA9zhFA6c5IRsNp98u3tyOg3hJ0zOE3tdf89ekwimKfIjMa1EgM03oB4r1
# f23a/ppGXOisscLmC/SByiEVKsl4EKBZsrpNAk767IqZL5e9sPPUbrU8ztOQnEIP
# zK1em7Id5vvTc1kVzpBofoHPG7A2uUSiMrcP9/KfmylvOykqzKp7MQOCwdRqT4wU
# iPsRWhVKFYnfU6Eyj4Ca0cVeiUrA28e6i/tOFMA6xlzgJyZg92GskMsEp1D1djAj
# 3vCHCr3mCqavBPg5ZuySJom927wMvUVhdPa3kzIZcT+wvNKc2iTGPSWn3Q3vuic3
# e7OSYRV+930FgbKJiOVbXc2Y0rU9WP/Y0FKq5LrMdLhziRnQoGVTwnSbPF2lC8fw
# CTYqP5X1IISDdo29KpstqWCp3Z/ORFDGcfzO1eDW1UM9rDB7ERMLmiV5fERaQa8d
# HMtHfk+4kuMt/6JZ6LP8APTvODE25vauE+MzjLdmbwW8pLQbC6Ui5mig8Qf/aP0V
# Mr/TZ3R2zaFj6AU8v/m61JizzC6JLBRZJI0h1aJrprZ5kyFvSRLqCQYXWVf7rw4K
# gTDk1TFULXPXdnI+bsr2dV/6Ya9yJEdZRWVVicbSsmxduu/Zv1EOWw9E
# SIG # End signature block
