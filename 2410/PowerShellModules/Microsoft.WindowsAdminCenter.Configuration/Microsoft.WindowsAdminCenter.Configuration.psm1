Set-Variable -Name ConstNetShCommand -Option Constant -Value "netsh.exe"
Set-Variable -Name ConstWevutilCommand -Option Constant -Value "wevtutil.exe"
Set-Variable -Name ConstServiceController -Option Constant -Value "sc.exe"
Set-Variable -Name ConstServiceName -Option Constant -Value "WindowsAdminCenter"
Set-Variable -Name ConstAccountManagementServiceName -Option Constant -Value "WindowsAdminCenterAccountManagement"
Set-Variable -Name ConstUpdaterScheduledTaskName -Option Constant -Value "WindowsAdminCenterUpdater"
Set-Variable -Name ConstLauncherName -Option Constant -Value "WindowsAdminCenterLauncher"
Set-Variable -Name ConstEventLogName -Option Constant -Value "WindowsAdminCenter"
Set-Variable -Name ConstDisplayName -Option Constant -Value "Windows Admin Center"
Set-Variable -Name ConstAccountManagementServiceDisplayName -Option Constant -Value "Windows Admin Center Account Management"
Set-Variable -Name ConstUpdaterServiceDisplayName -Option Constant -Value "Windows Admin Center Updater"
Set-Variable -Name ConstServiceDescription -Option Constant -Value "Manage remote Windows computers from web service."
Set-Variable -Name ConstAccountManagementServiceDescription -Option Constant -Value "Manage AAD token and account for Windows Admin Center."
Set-Variable -Name ConstUpdaterServiceDescription -Option Constant -Value "Install updates for Windows Admin Center."
Set-Variable -Name ConstExecutableName -Option Constant -Value "WindowsAdminCenter.exe"
Set-Variable -Name ConstLauncherExecutableName -Option Constant -Value "WindowsAdminCenterLauncher.exe"
Set-Variable -Name ConstAccoutManagementExecutableName -Option Constant -Value "WindowsAdminCenterAccountManagement.exe"
Set-Variable -Name ConstUpdaterExecutableName -Option Constant -Value "WindowsAdminCenterUpdater.exe"
Set-Variable -Name ConstAppConfigJsonName -Option Constant -Value "appsettings.json"
Set-Variable -Name ConstTokenAuthenticationModeTag -Option Constant -Value """TokenAuthenticationMode"":"
Set-Variable -Name ConstSubjectTag -Option Constant -Value """Subject"":" 
Set-Variable -Name ConstDefaultProgramFilesFolderPath -Option Constant -Value "${env:ProgramFiles}\WindowsAdminCenter"
Set-Variable -Name ConstDefaultProgramDataFolderPath -Option Constant -Value "${env:ProgramData}\WindowsAdminCenter"
Set-Variable -Name ConstInstallerAppId -Option Constant -Value "9B27DF2F-5386-41DF-B52B-5DF81914B043"
Set-Variable -Name ConstUninstallRegKeyPath -Option Constant -Value "Software\Microsoft\Windows\CurrentVersion\Uninstall\$ConstInstallerAppId`_is1"
Set-Variable -Name ConstUninstallRegKey -Option Constant -Value "HKLM:$ConstUninstallRegKeyPath"
Set-Variable -Name ConstSetupRegInstallLocationPropertyName -Option Constant -Value "InstallLocation"
Set-Variable -Name ConstSetupRegInstallionModePropertyName -Option Constant -Value "Inno Setup CodeFile: InstallationMode"
Set-Variable -Name ConstSetupRegInstallionModePropertyValueFailoverCluster -Option Constant -Value "FailoverCluster"
Set-Variable -Name ConstAppId -Option Constant -Value "{13EF9EED-B613-4D2D-8B82-7E5B90BE4990}"
Set-Variable -Name ConstDefaultPort -Option Constant -Value "6600"
Set-Variable -Name ConstUsersSecurityDescriptor -Option Constant -Value "D:(A;;GX;;;AU)(A;;GX;;;NS)"
Set-Variable -Name ConstNetworkServiceSecurityDescriptor -Option Constant -Value "D:(A;;GX;;;NS)"
Set-Variable -Name ConstCertificateKeySecurityDescriptor -Option Constant -Value "O:SYG:SYD:AI(A;;GAGR;;;SY)(A;;GAGR;;;NS)(A;;GAGR;;;BA)(A;;GR;;;BU)"
Set-Variable -Name ConstAccountManagementSecurityDescriptor -Option Constant -Value "D:(A;;CCLCSWRPWPLO;;;NS)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)"
Set-Variable -Name ConstUpdaterScheduledTaskSecurityDescriptor -Option Constant -Value "O:BAD:AI(A;;FR;;;SY)(A;;0x1200a9;;;NS)(A;ID;0x1f019f;;;BA)(A;ID;0x1f019f;;;SY)(A;ID;FA;;;BA)"
Set-Variable -Name ConstSSLCertificateFriendlyName -Option Constant -Value "Windows Admin Center Self-Signed Certificate"
Set-Variable -Name ConstSSLCertificateSubjectName -Option Constant -Value "WindowsAdminCenterSelfSigned"
Set-Variable -Name ConstSSLCertificateSubjectCN -Option Constant -Value "CN=WindowsAdminCenterSelfSigned"
Set-Variable -Name ConstRootCACertificateSubjectName -Option Constant -Value "WindowsAdminCenterSelfSignedRootCA"
Set-Variable -Name ConstInboundOpenException -Option Constant -Value "WacInboundOpenException";
Set-Variable -Name ConstCredSspName -Option Constant -Value "Microsoft.WindowsAdminCenter.Credssp"
Set-Variable -Name ConstCredSspGroupName -Option Constant -Value "Windows Admin Center CredSSP"
Set-Variable -Name ConstCredSspGroupDescription -Option Constant -Value "Members of CredSSP operations"
Set-Variable -Name ConstCredSspRoleName -Option Constant -Value "MS-CredSSP-Admin"
Set-Variable -Name ConstShellModuleName -Option Constant -Value "Microsoft.SME.Shell"
Set-Variable -Name ConstRoleCapabilitiesName -Option Constant -Value "Microsoft.WindowsAdminCenter.CredSspPolicy"
Set-Variable -Name ConstCredSspAdmin -Option Constant -Value "MS-CredSSP-Admin"
Set-Variable -Name ConstPolicyFolderPath -Option Constant -Value "${env:ProgramFiles}\WindowsPowerShell\Modules\Microsoft.WindowsAdminCenter.CredSspPolicy"
Set-Variable -Name ConstExtensionsConfigFileName -Option Constant -Value "extensions.config"
Set-Variable -Name ConstExtensionManifestFileName -Option Constant -Value "manifest.json"
Set-Variable -Name ConstExtensionSettingsFileName -Option Constant -Value "settings.json"
Set-Variable -Name ConstExtensionUxFolderName -Option Constant -Value "Ux"
Set-Variable -Name ConstExtensionGatewayFolderName -Option Constant -Value "gateway"
Set-Variable -Name ConstExtensionCatalogsFolderName -Option Constant -Value "Catalogs"
Set-Variable -Name ConstExtensionPackagesFolderName -Option Constant -Value "Packages"
Set-Variable -Name ConstExtensionIndexFileName -Option Constant -Value "index.html"
Set-Variable -Name ConstRoleCapabilities -Option Constant -Value "RoleCapabilities"
Set-Variable -Name ConstWinRmCommand -Option Constant -Value "winrm.cmd"
Set-Variable -Name ConstLogFileName -Option Constant -Value "Configuration.log"
Set-Variable -Name ConstEntityFrameworkBundleFileName -Option Constant -Value "efbundle.exe"
Set-Variable -Name ConstCoreDllFileName -Option Constant -Value "Microsoft.WindowsAdminCenter.Core.dll"
Set-Variable -Name ConstMachineKeyRootPath -Option Constant -Value "${env:ProgramData}\Microsoft\Crypto\RSA\MachineKeys"
Set-Variable -Name ConstSystemObject -Option Constant -Value "SYSTEM"
Set-Variable -Name ConstNetworkServiceSid -Option Constant -Value "S-1-5-20"
Set-Variable -Name ConstNetworkServiceName -Option Constant -Value "NT Authority\NetworkService"
Set-Variable -Name ConstBuiltInAdministratorsSid -Option Constant -Value "S-1-5-32-544"
Set-Variable -Name ConstBuiltInTrustedInstallerSid -Option Constant -Value "S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464"
Set-Variable -Name ConstBuiltInSystemSid -Option Constant -Value "S-1-5-18"
Set-Variable -Name ConstFullControlPermissions -Option Constant -Value "FullControl"
Set-Variable -Name ConstNuGetVersioningDllName -Option Constant -Value "NuGet.Versioning.dll"
Set-Variable -Name ConstApplicationEventLogName -Option Constant -Value "Application"
Set-Variable -Name ConstLogSourceWACConfiguration -Option Constant -Value "WAC-Configuration"
Set-Variable -Name ConstCategoryInstaller -Option Constant -Value 1001
Set-Variable -Name ConstWorkStationSkuType -Option Constant -Value "WorkStation"
Set-Variable -Name ConstServerSkuType -Option Constant -Value "Server"
Set-Variable -Name ConstGenericServiceResourceTypeName -Option Constant -Value "Generic Service"
Set-Variable -Name ConstGenericServiceNameParameterName -Option Constant -Value "ServiceName"
Set-Variable -Name ConstGWv1ServiceName -Option Constant -Value "ServerManagementGateway"
Set-Variable -Name ConstGWv1RegistryPath -Option Constant -Value "HKLM:\SOFTWARE\Microsoft\ServerManagementGateway"
Set-Variable -Name ConstGWv1MinimumMigrationVersion -Option Constant -Value "1.2.17537.0"
Set-Variable -Name ConstGWv1ExtensionConfigPath -Option Constant -Value "${env:ProgramData}\Server Management Experience\Extensions\extensions.config"
Set-Variable -Name ConstAppSettingsIniSectionName -Option Constant -Value "AppSettings"
Set-Variable -Name ConstConfigurationPowerShellModuleName -Option Constant -Value "Microsoft.WindowsAdminCenter.Configuration"
Set-Variable -Name ConstClusterNodeConfigurationScriptFileName -Option Constant -Value "Update-WACClusterNodeConfiguration.ps1"
Set-Variable -Name ConstLoginMode -Option Constant -Value "LoginMode"
Set-Variable -Name ConstOperationMode -Option Constant -Value "OperationMode"
Set-Variable -Name ConstNetworkAccessMode -Option Constant -Value "NetworkAccessMode"
Set-Variable -Name ConstNetworkAccessRemote -Option Constant -Value "NetworkAccessRemote"
Set-Variable -Name ConstNetworkAccessLocal -Option Constant -Value "NetworkAccessLocal"
Set-Variable -Name ConstTlsCertificateMode -Option Constant -Value "TlsCertificateMode"
Set-Variable -Name ConstSelfSignMode -Option Constant -Value "SelfSignMode"
Set-Variable -Name ConstUserSuppliedMode -Option Constant -Value "UserSuppliedMode"
Set-Variable -Name ConstThumbprint -Option Constant -Value "Thumbprint"
Set-Variable -Name ConstTrustedHostsMode -Option Constant -Value "TrustedHostsMode"
Set-Variable -Name ConstConfigureTrustedHosts -Option Constant -Value "ConfigureTrustedHosts"
Set-Variable -Name ConstNotConfigureTrustedHosts -Option Constant -Value "NotConfigureTrustedHosts"
Set-Variable -Name ConstWinRMOverHttpsMode -Option Constant -Value "WinRMOverHttpsMode"
Set-Variable -Name ConstEnable -Option Constant -Value "Enable"
Set-Variable -Name ConstDisable -Option Constant -Value "Disable"
Set-Variable -Name ConstSoftwareUpdateMode -Option Constant -Value "SoftwareUpdateMode"
Set-Variable -Name ConstTelemetryMode -Option Constant -Value "TelemetryMode"
Set-Variable -Name ConstWacPort -Option Constant -Value "WacPort"
Set-Variable -Name ConstServicePortRangeStart -Option Constant -Value "ServicePortRangeStart"
Set-Variable -Name ConstServicePortRangeEnd -Option Constant -Value "ServicePortRangeEnd"
Set-Variable -Name ConstFqdn -Option Constant -Value "Fqdn"
Set-Variable -Name ConstClusterNodeScheduledTaskName -Option Constant -Value "WAClusterNodeConfiguration"
Set-Variable -Name ConstTlsList -Option Constant -Value "TlsList"

#Requires -RunAsAdministrator

enum ExtensionStatus {
    None = 0
    Available = 1
    Installed = 2
    InstallPending = 3
    UnInstallPending = 4
    UpdatePending = 5
}

enum SetupType {
    Unknown = 0
    WorkStation = 1
    Server = 2
    Cluster = 3
}

enum MigrateFromV1Status {
    Ready = 0
    AlreadyMigrated = 1
    V1NotInstalled = 2
    V1VersionTooOld = 3
    V1NotInitialized = 4
    Unknown = 5
}

<#
.SYNOPSIS
    Gets the Windows Admin Center proxy setting.

.DESCRIPTION
    Gets the Windows Admin Center proxy setting.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACProxy
    It will return the proxy setting if it is configured, otherwise it will return $null.

#>
function Get-WACProxy {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $result = GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "Proxy"
        if ($null -ne $result -and -not [string]::IsNullOrEmpty($result.Address)) {
            [PSCustomObject]@{ Address = $result.Address; BypassOnLocal = $result.BypassOnLocal; BypassList = $result.BypassList }
        }
        else {
            $null
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACProxy: Successfully get WAC proxy."
        ExitWithErrorCode 0
    }
    catch {
        Write-Log -Level WARN -ExitCode 1 -Message "Get-WACProxy: Couldn't get WAC proxy. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Sets the Windows Admin Center proxy setting.

.DESCRIPTION
    Sets the Windows Admin Center proxy setting and possibly restarts the Windows Admin Center service.

.PARAMETER Address
    The address of the proxy server.

.PARAMETER BypassOnLocal
    Indicates whether or not to use the proxy server when accessing local internet resources.

.PARAMETER BypassList
    The list of URIs that can be accessed directly instead of through the proxy server.

.PARAMETER Credentials
    The credentials used to authenticate a user agent to the proxy server.

.PARAMETER RestartWacService
    Restart the Windows Admin Center service after setting the proxy. This is necessary when RawCredentials is provided.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACProxy -Address "https://my.test.proxy.address" -BypassOnLocal $true -BypassList @("https://bypass.this.address")
    Configure the proxy with the address, bypass on local, and bypass list.

.EXAMPLE
    Set-WACProxy -Address "https://my.test.proxy.address" -BypassOnLocal $true -BypassList @("https://bypass.this.address") -Credentials (Get-Credential) -RestartWacService
    Configure the proxy with the address, bypass on local, bypass list, and credentials. The Windows Admin Center service will be restarted.

.EXAMPLE
    Set-WACProxy $null
    Resets the proxy. The proxy will be disabled.
#>
function Set-WACProxy {
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        [AllowEmptyString()]
        [string]$Address,
        [Parameter(Mandatory = $false)]
        [bool]$BypassOnLocal,
        [Parameter(Mandatory = $false)]
        [string[]]$BypassList,
        [Parameter(Mandatory = $false)]
        [System.Management.Automation.PSCredential]$Credentials,
        [Parameter(Mandatory = $false)]
        [switch]$RestartWacService,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $proxySetting = $null
        if (-not [string]::IsNullOrEmpty($Address)) {
            $data = ""
            if ($null -ne $Credentials) {
                if (-not $RestartWacService) {
                    $message = "Couldn't configure the credentials if it's not associated with an immediate restart of WindowsAdminCenter service. Please specify -RestartWacService parameter."
                    Write-Error $message
                    throw $message
                }

                $networkCredentials = $Credentials.GetNetworkCredential();
                $bytes = [System.Text.UTF32Encoding]::UTF8.GetBytes("$($networkCredentials.UserName):$($networkCredentials.Password)")
                $encoded = [System.Convert]::ToBase64String($bytes);
                $data = "plaintext:$encoded"
            }

            $proxySetting = [PSCustomObject]@{
                Address       = $Address
                BypassOnLocal = $BypassOnLocal
                BypassList    = $BypassList
                ProtectedData = ""
                Credentials   = $data
            }
        }

        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "Proxy" -Value $proxySetting
        if ($RestartWacService) {
            Restart-WACService
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACProxy: Successfully set WAC proxy."
        ExitWithErrorCode 0
    }
    catch {
        Write-Log -Level WARN -ExitCode 1 -Message "Set-WACProxy: Failed to set WAC proxy. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Imports the build signer certificate.

.DESCRIPTION
    Imports the build signer certificate to the TrustedPublisher store.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Import-WACBuildSignerCertificate
#>
function Import-WACBuildSignerCertificate {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $moduleFiles = Get-ChildItem -Path "$PSScriptRoot\..\.." -Include @('*.psm1', '*.psd1', '*.ps1') -Recurse
        $importedThumbprints = @{}
        foreach ($moduleFile in $moduleFiles) {
            $moduleAuthenticodeSignature = Get-AuthenticodeSignature -FilePath $moduleFile.FullName
            if ($moduleAuthenticodeSignature.Status -ne "Valid") {
                continue
            }

            if (-not $importedThumbprints.Contains($moduleAuthenticodeSignature.SignerCertificate.Thumbprint) -and
                -not (Test-Path -Path (Join-Path -Path 'Cert:\LocalMachine\TrustedPublisher' -ChildPath $moduleAuthenticodeSignature.SignerCertificate.Thumbprint))) {
                $store = New-Object System.Security.Cryptography.X509Certificates.X509Store -ArgumentList ([System.Security.Cryptography.X509Certificates.StoreName]::TrustedPublisher),
                    ([System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine)
                $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite -bor [System.Security.Cryptography.X509Certificates.OpenFlags]::MaxAllowed)
                $store.Add($moduleAuthenticodeSignature.SignerCertificate)
                $store.Close()
                $importedThumbprints.Add($moduleAuthenticodeSignature.SignerCertificate.Thumbprint, $true)
            }
        }

        if ($importedThumbprints.Count -gt 0) {
            Write-Log -Level INFO -ExitCode 0 -Message "Import-WACBuildSignerCertificate: Successfully imported the build signer certificate(s)."
        }
        else {
            Write-Log -Level WARN -ExitCode 0 -Message "Import-WACBuildSignerCertificate: The configuration modules are not signed, cannot import the build signer certificate(s)."
        }
        ExitWithErrorCode 0
    }
    catch {
        Write-Log -Level WARN -ExitCode 1 -Message "Import-WACBuildSignerCertificate: Failed to import the build signer certificate(s). Error: $_"
        ExitWithErrorCode 1
        throw
    }
    finally {
        if ($null -ne $chain) {
            $chain.Dispose()
            $chain = $null
        }

        if ($null -ne $store) {
            $store.Dispose()
            $store = $null
        }
    }
}

<#
.SYNOPSIS
    Get the setup type for this computer.  Tracks closely with SKU type.

.PARAMETER ExitWithErrorCode
    Exit the script with the setup type of this computer, or 0 for failure/unknown.
#>
function Get-WACSetupType {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    function GetComputerSetupType {
        [OutputType([SetupType])]
        Param()
    
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACSetupType: Starting..."
        $currentComputer = (hostname)
        $err = $null
        $sku = Get-ComputerInfo -Property "OsProductType" -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: Get-ComputerInfo CmdLet failed. $currentComputer is not considered being a a Windows computer.  Error: $err"
            return [SetupType]::Unknown
        }
    
        $skuString = $sku.OsProductType.ToString()
        if ($skuString -ne $ConstWorkStationSkuType -and $skuString -ne $ConstServerSkuType) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: Unsupported SKU type. $currentComputer is not considered being a a Windows computer.  Error: $err"
            return [SetupType]::Unknown
        }
    
        if ($skuString -eq $ConstWorkStationSkuType) {
            Write-Log -Level INFO -ExitCode 1 -Message "Get-WACSetupType: $currentComputer is a Client/Workstation SKU."
            return [SetupType]::WorkStation
        }
    
        Import-Module CimCmdlets -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: The required module CimCmdlets is not available. $currentComputer is not considered being a a Windows computer.  Error: $err"
            return [SetupType]::Server
        }
    
        Import-Module FailoverClusters -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level INFO -ExitCode 1 -Message "Get-WACSetupType: The required module FailoverClusters is not available. $currentComputer is not a failover cluster node.  Error: $err"
            return [SetupType]::Server
        }
    
        enum NodeClusterState {
            NotInstalled = 0
            NotConfigured = 1
            NotRunning = 3
            Running = 19
        }
    
        $mscluster = Get-CimInstance -Namespace "root\mscluster" -ClassName "MSCluster_Cluster" -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: Could not get the MSCluster_Cluster CIM instance. $currentComputer is not a failover cluster node.  Error: $err"
            return [SetupType]::Server
        }
    
        $nodeClusterState = Invoke-CimMethod -InputObject $mscluster -MethodName "GetNodeClusterState" -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: There was an error calling MSCluster_Cluster.GetNodeClusterState(). $currentComputer is not a failover cluster node.  Error: $err"
            return [SetupType]::Server
        }
    
        if (-not ($nodeClusterState.ReturnValue)) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: MSCluster_Cluster.GetNodeClusterState() did not succeed. $currentComputer is not a failover cluster node."
            return [SetupType]::Server
        }
    
        if ($nodeClusterState.ClusterState -ne [NodeClusterState]::Running) {
            Write-Log -Level WARN -ExitCode 1 -Message "Get-WACSetupType: $currentComputer is not a properly configured failover cluster node. NodeClusterState: $($nodeClusterState.ClusterState)"
            return [SetupType]::Server
        }
    
        $cluster = Get-Cluster -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSetupType: There was an error getting the cluster in PowerShell. $currentComputer is not a failover cluster node.  Error: $err"
            return [SetupType]::Server
        }
    
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACSetupType: $currentComputer is a failover cluster node and is a member of $($cluster.Domain).$($cluster.Name)."
        return [SetupType]::Cluster
    }
    
    SetExitWithErrorCode $ExitWithErrorCode
    $setupType = GetComputerSetupType
    ExitWithErrorCode $setupType
    return $setupType
}

<#
.SYNOPSIS
    Gets the status of a Windows Admin Center v1 HA installation.

.DESCRIPTION
    Used by the installer to determine whether Windows Admin Center v1 was installed as HA.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 if no v1 HA version was found, otherwise 1.

.EXAMPLE
    Get-WACv1HAInstalled
#>
function Get-WACv1HAInstalled {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACv1HAInstalled: Starting..."

    SetExitWithErrorCode $ExitWithErrorCode

    $v1HARegistryPath = "$ConstGWv1RegistryPath\ha"
    
    if (Test-Path $v1HARegistryPath) {
        Write-Log -Level INFO -ExitCode 1 -Message "Get-WACv1HAInstalled: A previous version of Windows Admin Center is already installed as HA."
        ExitWithErrorCode 1
    } else {
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACv1HAInstalled: A previous version of Windows Admin Center installed as HA was not found."
        ExitWithErrorCode 0
    }
}

<#
.SYNOPSIS
    Get the status of the migration from V1.

.DESCRIPTION
    Used by the installer to determine if it will migrate from V1 after installation.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is ready to migrate from V1, otherwise 1.

.EXAMPLE
    Get-MigrateFromV1Status
#>
function Get-WACMigrateFromV1Status {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    function TestMigrationStatus {
        if (Test-Path -Path (GetMigrationStatusFilePath)) 
        {
            Write-Log -Level INFO -ExitCode 0 -Message "TestMigrationStatus: Already migrated from V1."
            return [MigrateFromV1Status]::AlreadyMigrated
        }
    
        if (-not (Test-Path -Path $ConstGWv1RegistryPath)) {
            Write-Log -Level INFO -ExitCode 0 -Message "TestMigrationStatus: V1 not installed."
            return [MigrateFromV1Status]::V1NotInstalled
        }
    
        try {
            [Version]$v1Version = Get-ItemPropertyValue -Path $ConstGWv1RegistryPath -Name Version
            if ($v1Version -lt [Version]$ConstGWv1MinimumMigrationVersion) {
                Write-Log -Level INFO -ExitCode 0 -Message "TestMigrationStatus: V1 version too old. V1 version: $v1Version"
                return [MigrateFromV1Status]::V1VersionTooOld
            }
    
            if (-not (Test-Path -Path $ConstGWv1ExtensionConfigPath)) {
                Write-Log -Level INFO -ExitCode 0 -Message "TestMigrationStatus: V1 not initialized."
            }
        }
        catch {
            Write-Log -Level ERROR -ExitCode 1 -Message "TestMigrationStatus: Error checking V1 migration status. Error: $_"
            return [MigrateFromV1Status]::Unknown
        }
    
        return [MigrateFromV1Status]::Ready
    }

    $migrationStatus = TestMigrationStatus
    if ($migrationStatus -eq [MigrateFromV1Status]::Ready) {
        Write-Log -Level INFO -ExitCode 0 -Message "Get-MigrateFromV1Status: Ready to migrate from V1."
        ExitWithErrorCode 0
        return $migrationStatus
    }
    elseif ($migrationStatus -eq [MigrateFromV1Status]::V1VersionTooOld) {
        ExitWithErrorCode 2
        return $migrationStatus
    }

    ExitWithErrorCode 1
    return $migrationStatus
}

<#
.SYNOPSIS
    Exports the Windows Admin Center installer settings to an INI file.

.DESCRIPTION
    Used by the installer to restore the settings for reinstallation.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.PARAMETER Path
    The path to export the settings to.

.EXAMPLE
    Export-WACInstallerSettings -Path "C:\temp\settings.ini"
#>
function Export-WACInstallerSettings {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    function FindFreePortRange([int]$FindStart, [int]$FindEnd, [int]$RangeSize) {
        # make sure WAC service is stopped so it doesn't use assigned ports.
        $defaultRange = @{ StartPort = $FindStart; EndPort = $FindStart + $RangeSize - 1; Valid = $false; }
        $ipAddress = [System.Net.IPAddress]::Parse("127.0.0.1")
        $nextPort = $FindEnd
        for ($start = $FindStart; $start -le $FindEnd; $start = $nextPort) {
            $found = $true
            Write-Verbose "FindFreePortRange - Start testing from port: $start"
            for ($port = $start; $port -lt $start + $RangeSize; $port++) {
                try {
                    # try listening the port if it's available. it will throw an error if it's not available.
                    $tcpListener = new-object System.Net.Sockets.TcpListener -ArgumentList $ipAddress, $port
                    $tcpListener.Start()
                    $tcpListener.Stop()
                    Write-Verbose "FindFreePortRange - OK: $port"
                }
                catch {
                    Write-Verbose "FindFreePortRange - NG: $port"
                    if ($port -ge $FindEnd - $RangeSize) {
                        Write-Verbose "FindFreePortRange - Not found a range (use default range, user must adjust it manually later)"
                        return $defaultRange
                    }
    
                    # restart testing from the next port number.
                    $nextPort = $port + 1
                    $found = $false
                    break
                }
            }
    
            if ($found) {
                Write-Log -Level INFO -ExitCode 0 -Message  "FindFreePortRange - Found the range: $start-$($start + $RangeSize - 1)"
                Write-Log -Level INFO -ExitCode 0 -Message  "FindFreePortRange - RangeSize ($RangeSize)."
                return @{ StartPort = $start; EndPort = $start + $RangeSize - 1; Valid = $true; }
            }
        }
    
        Write-Log -Level INFO -ExitCode 0 -Message "FindFreePortRange - Not found a range (use default range, user must adjust it manually later)"
        return $defaultRange
    }

    function ListTlsCertificate {
        $items = Get-ChildItem -Path 'cert:\localmachine\my'
        $now = Get-Date
        $output = foreach ($item in $items) {
            if ($item.NotAfter -lt $now) {
                continue
            }
    
            if ($null -eq $item.EnhancedKeyUsageList.ObjectId) {
                continue
            }
    
            if (-not ($item.EnhancedKeyUsageList.ObjectId.Contains("1.3.6.1.5.5.7.3.1") -and $item.HasPrivateKey)) {
                continue
            }
    
            if ($item.PublicKey.Key.KeySize -lt 2048 -or ($null -eq $item.Extensions)) {
                continue
            }

            $extension = $item.Extensions | Where-Object { $_.Oid.Value -eq '2.5.29.15' -and $_.KeyUsages -like '*KeyEncipherment*' -and $_.KeyUsages -like '*DigitalSignature*' }
            if ($null -eq $extension) {
                continue
            }
            
            if (-not $item.HasPrivateKey) {
                continue
            }

            [PSCustomObject]@{
                Subject      = $item.Subject
                Issuer       = $item.Issuer
                FriendlyName = $item.FriendlyName
                DnsNameList  = $item.DnsNameList.UniCode
                Thumbprint   = $item.Thumbprint
                NotAfter     = $item.NotAfter
                Valid        = $item.Verify()
                KeyCanAccess = ($null -ne $item.PrivateKey)
            }
        }
    
        # "|" is line delimiter.
        # "\" is certificate delimiter.
        $outputText = ""
        $output | ForEach-Object {
            $outputText += '{0}|' -f $_.Thumbprint
            $outputText += 'Subject: {0}|' -f $_.Subject
            $outputText += 'Issuer: {0}|' -f $_.Issuer
            if ($_.FriendlyName) {
                $outputText += 'Friendly: {0}|' -f $_.FriendlyName
            }
    
            if ($_.DnsNameList.Count -gt 0) {
                $outputText += 'DnsNameList:|'
                $_.DnsNameList | ForEach-Object {
                    $outputText += '  {0}|' -f $_
                }
            }
    
            $outputText += 'NotAfter: {0}|' -f $_.NotAfter
            $status = if ($_.Valid) { 'Valid' } else { 'Invalid' }
            $outputText += 'Status: {0}|' -f $status

            # Private key of certificate must be configured for Network Service to allow readable. Container of Private key have multiple types, the installer
            # script will try auto configuring Network Service access only if the private key is accessible.
            $privateKeyState = if ($_.KeyCanAccess) { "AutoConfigured" } else { "PreConfigurationRequired" }
            $outputText += 'Private Key Access Control: {0}|' -f $privateKeyState
            $outputText += '\'
        }
    
        return $outputText
    }

    try {
        $ini = @{}
        $ini[$ConstAppSettingsIniSectionName] = @{}

        # Export settings from AppSettings.json only if WAC is installed
        if (Get-WACInstallationStatus) {
            # Export WAC LoginMode
            $ini[$ConstAppSettingsIniSectionName][$ConstLoginMode] = (Get-WACLoginMode)

            # Export WAC OperationMode
            $ini[$ConstAppSettingsIniSectionName][$ConstOperationMode] = (Get-WACOperationMode)

            # Export WAC NetworkAccessMode
            if (Get-WACFirewallRule) {
                $ini[$ConstAppSettingsIniSectionName][$ConstNetworkAccessMode] = $ConstNetworkAccessRemote
            }
            else {
                $ini[$ConstAppSettingsIniSectionName][$ConstNetworkAccessMode] = $ConstNetworkAccessLocal
            }

            # Export WAC TlsCertificateMode and Thumbprint
            $subjectName = Get-WACCertificateSubjectName
            $cert = Get-ChildItem -Path "Cert:\LocalMachine\My" | Where-Object { $_.Subject -like "*$subjectName*" } | Select-Object -First 1
            if ($subjectName -eq $ConstSSLCertificateSubjectName) {
                $ini[$ConstAppSettingsIniSectionName][$ConstTlsCertificateMode] = $ConstSelfSignMode
            }
            else {
                $ini[$ConstAppSettingsIniSectionName][$ConstTlsCertificateMode] = $ConstUserSuppliedMode
                if ($cert) {
                    $ini[$ConstAppSettingsIniSectionName][$ConstThumbprint] = $cert.Thumbprint
                }
            }

            # Export WAC TrustedHostsMode
            $trustedHostsString = (Get-WACWinRmTrustedHosts).Value
            if ($trustedHostsString -eq "*") {
                $ini[$ConstAppSettingsIniSectionName][$ConstTrustedHostsMode] = $ConstConfigureTrustedHosts
            }
            else {
                $ini[$ConstAppSettingsIniSectionName][$ConstTrustedHostsMode] = $ConstNotConfigureTrustedHosts
            }

            # Export WAC WinRMOverHttpsMode
            if (Get-WACWinRmOverHttps) {
                $ini[$ConstAppSettingsIniSectionName][$ConstWinRMOverHttpsMode] = $ConstEnable
            }
            else {
                $ini[$ConstAppSettingsIniSectionName][$ConstWinRMOverHttpsMode] = $ConstDisable
            }

            # Export WAC SoftwareUpdateMode
            $ini[$ConstAppSettingsIniSectionName][$ConstSoftwareUpdateMode] = Get-WACSoftwareUpdateMode

            # Export WAC TelemetryMode
            $ini[$ConstAppSettingsIniSectionName][$ConstTelemetryMode] = Get-WACTelemetryPrivacy

            # Export WAC Ports
            $ports = Get-WACHttpsPorts
            $ini[$ConstAppSettingsIniSectionName][$ConstWacPort] = $ports.WacPort
            $ini[$ConstAppSettingsIniSectionName][$ConstServicePortRangeStart] = $ports.ServicePortRangeStart
            $ini[$ConstAppSettingsIniSectionName][$ConstServicePortRangeEnd] = $ports.ServicePortRangeEnd
            $ini[$ConstAppSettingsIniSectionName][$ConstTlsList] = ListTlsCertificate

            # Export WAC FQDN
            # Get the current endpoint FQDN
            $Fqdn = (Get-WACEndpointFqdn).EndpointFqdn
            if ($Fqdn) {
                $ini[$ConstAppSettingsIniSectionName][$ConstFqdn] = $Fqdn
            }
            else {
                # Get the FQDN from DNS records
                $ini[$ConstAppSettingsIniSectionName][$ConstFqdn] = [System.Net.Dns]::GetHostEntry([System.Net.Dns]::GetHostName()).HostName
            }
            Write-Log -Level INFO -ExitCode 0 -Message "Export-WACInstallerSettings: Successfully exported the installer settings from AppSettings.json."
        }
        else {
            # Export useful settings even if WAC is not installed
            # Export WAC Default FQDN
            $ini[$ConstAppSettingsIniSectionName][$ConstFqdn] = [System.Net.Dns]::GetHostEntry([System.Net.Dns]::GetHostName()).HostName
            $range = FindFreePortRange -FindStart 6601 -FindEnd 6990 -RangeSize 10
            $ini[$ConstAppSettingsIniSectionName][$ConstServicePortRangeStart] = $range.StartPort
            $ini[$ConstAppSettingsIniSectionName][$ConstServicePortRangeEnd] = $range.EndPort
            $ini[$ConstAppSettingsIniSectionName][$ConstTlsList] = ListTlsCertificate
            Write-Log -Level INFO -ExitCode 0 -Message "Export-WACInstallerSettings: Successfully exported the installer settings when WAC is not installed."
        }

        OutIniFile -InputObject $ini -FilePath $Path
        ExitWithErrorCode 0
    }
    catch {
        Write-Error -Message "Export-WACInstallerSettings: Failed to export the installer settings. Error: $_"
        Write-Log -Level ERROR -ExitCode 1 -Message "Export-WACInstallerSettings: Failed to export the installer settings. Error: $_"
        ExitWithErrorCode 1
    }
}

<#
.SYNOPSIS
    Tests that the Windows Admin Center service is registered.

.DESCRIPTION
    Is the Windows Admin Center service registered on this computer?

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Test-WACService

.EXAMPLE
    Test-WACService
#>
function Test-WACService {
    [OutputType([Bool])]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $service = GetGatewayService
    if (!!$service) {
        Write-Log -Level INFO -ExitCode 0 -Message "Test-WACService: Windows Admin Center service is registered on this computer."
        ExitWithErrorCode 0
        return $true
    } else {
        Write-Log -Level INFO -ExitCode 1 -Message "Test-WACService: Windows Admin Center service is not registered on this computer."
        ExitWithErrorCode 1
        return $false
    }
}

<#
.SYNOPSIS
    Registers the Windows Admin Center service.

.DESCRIPTION
    Registers the Windows Admin Center service. Unregisters the service first if it is already registered.

.PARAMETER Automatic
    Automatically start the service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACService

.EXAMPLE
    Register-WACService -Automatic
#>
function Register-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$Automatic,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $service = Get-Service -Name $ConstServiceName -ErrorAction SilentlyContinue
    if ($service.Length -gt 0) {
        # If WAC service already exists, the security descriptor will be restored to avoid users losing permission.
        $wacServiceSecurityDescriptor = (Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdshow", $ConstServiceName -ReturnObject).StdOut.Trim()
        Unregister-WACService -ExitWithErrorCode:$false
    }

    $basePath = GetServicePath
    $path = Join-Path -Path $basePath -ChildPath $ConstExecutableName
    $path = [System.IO.Path]::GetFullPath($path)
    $startMode = if ($Automatic) { "auto" } else { "demand" }
    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "create", $ConstServiceName, "type=", "own", "start=", $startMode, "depend=", "winrm", "obj=", """$ConstNetworkServiceName""", "binpath=", """$path""", "displayname=", """$ConstDisplayName"""
    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "description", $ConstServiceName, """$ConstServiceDescription"""
    
    if ($null -ne $wacServiceSecurityDescriptor) {
        Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdset", $ConstServiceName, $wacServiceSecurityDescriptor
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACService: Successfully registered Windows Admin Center service."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Registers the Windows Admin Center Account Management service.

.DESCRIPTION
    Registers the Windows Admin Center Account Management service. Unregisters the service first if it is already registered.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACAccountManagementService
#>
function Register-WACAccountManagementService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $service = Get-Service -Name $ConstAccountManagementServiceName -ErrorAction SilentlyContinue
    if ($service.Length -gt 0) {
        Unregister-WACAccountManagementService -ExitWithErrorCode:$false
    }

    $path = Join-Path -Path (GetServicePath) -ChildPath $ConstAccoutManagementExecutableName
    $path = [System.IO.Path]::GetFullPath($path)

    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "create", $ConstAccountManagementServiceName, "type=", "own", "start=", "demand", "binpath=", """$path""", "displayname=", """$ConstAccountManagementServiceDisplayName"""
    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "description", $ConstAccountManagementServiceName, """$ConstAccountManagementServiceDescription"""
    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdset", $ConstAccountManagementServiceName, $ConstAccountManagementSecurityDescriptor

    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACAccountManagementService: Successfully registered Windows Admin Center Account Management service."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Registers the Windows Admin Center Updater scheduled task.

.DESCRIPTION
    Registers the Windows Admin Center Updater scheduled task. Returns early if the scheduled task is already registered unless Force flag is set.

.PARAMETER Force
    Force the registration of the service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACUpdaterScheduledTask

.EXAMPLE
    Register-WACUpdaterScheduledTask -Force
#>
function Register-WACUpdaterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $service = Get-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -ErrorAction SilentlyContinue
    if ($service.Length -gt 0) {
        if ($Force -eq $false) {
            Write-Log -Level INFO -ExitCode 0 -Message "Register-WACUpdaterScheduledTask: Windows Admin Center Updater scheduled task is already registered, returning early."
            ExitWithErrorCode 0
            return
        }

        Unregister-WACUpdaterScheduledTask -ExitWithErrorCode:$false
    }

    $path = Join-Path -Path (GetUpdaterPath) -ChildPath $ConstUpdaterExecutableName
    $path = [System.IO.Path]::GetFullPath($path)

    try {
        $action = New-ScheduledTaskAction -Execute $path
        Register-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -Action $action -User $ConstSystemObject -RunLevel Highest -Force

        $scheduler = New-Object -ComObject Schedule.Service
        $scheduler.Connect()
        $task = $scheduler.GetFolder("\").GetTask($ConstUpdaterScheduledTaskName)
        $task.SetSecurityDescriptor($ConstUpdaterScheduledTaskSecurityDescriptor, 0)
    }
    catch {
        Write-Log -Level ERROR -ExitCode 1 -Message "Register-WACUpdaterScheduledTask: Failed to register Windows Admin Center Updater scheduled task."
        Write-Error $_
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACUpdaterScheduledTask: Successfully registered Windows Admin Center Updater scheduled task."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Restarts the Windows Admin Center service.

.DESCRIPTION
    Restarts the Windows Admin Center service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Restart-WACService
#>
function Restart-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Restart-Service -Name $ConstServiceName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Restart-WACService: Successfully restarted Windows Admin Center service."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Restart-WACService: Failed to restart Windows Admin Center service. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Restarts the Windows Admin Center Account Management service.

.DESCRIPTION
    Restarts the Windows Admin Center Account Management service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Restart-WACAccountManagementService
#>
function Restart-WACAccountManagementService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Restart-Service -Name $ConstAccountManagementServiceName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Restart-WACAccountManagementService: Successfully restarted Windows Admin Center Account Management service."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Restart-WACService: Failed to restart Windows Admin Center Account Management service. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Sets Network Service account access.

.DESCRIPTION
    Sets Network Service account access to Full on %ProgramData%\WindowsAdminCenter folder and %ProgramFiles%\WindowsAdminCenter\Service\appsettings.json with inherited state.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACNetworkServiceAccess
#>
function Set-WACNetworkServiceAccess {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $networkServiceSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstNetworkServiceSid
        $programDataPath = GetProgramDataAppPath
        $acl = Get-Acl -Path $programDataPath
        $networkService = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $networkServiceSid, $ConstFullControlPermissions, 3, "None", "Allow"
        $acl.SetAccessRule($networkService)
        Set-Acl -Path $programDataPath -AclObject $acl

        $appSettingsPath = GetAppSettingsPath
        $acl = Get-Acl -Path $appSettingsPath
        $appSettings = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $networkServiceSid, $ConstFullControlPermissions, "Allow"
        $acl.SetAccessRule($appSettings)
        Set-Acl -Path $appSettingsPath -AclObject $acl

        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACNetworkServiceAccess: Configured access for Network Service to the data folder and the configuration file."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACNetworkServiceAccess: Failed to configure access for Network Service to the data folder and the configuration file. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Sets the access on the program files on a cluster shared volume to match %PROGRAMFILES%

.DESCRIPTION
    Sets the security descriptor to the folder on the cluster shared volume that holds the service binaries to proxy for %PROGRAMFILES%.
    The main consideration is that per machine SIDs will not work since the service can be hosted on any cluster node.  Only well-known
    and BUILTIN SIDs should be used.  BUILTIN\Administrators, TrustedPublisher, and BUILTIN\Network Service are the three most likley
    needed SIDs.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACHAProgramFilesAccess
#>
function Set-WACHAProgramFilesAccess {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    Write-Log -Level INFO -ExitCode 0 -Message "Starting Set-WACHAProgramFilesAccess..."

    SetExitWithErrorCode $ExitWithErrorCode

    $programFilesPath = GetProgramFilesPath
    
    $acl = Get-Acl -Path $programFilesPath -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to get the ACL for program files folder $programFilesPath. Error: $err"
        ExitWithErrorCode 1
        return
    }

    try {
        $networkServiceSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstNetworkServiceSid -ErrorAction Stop
        $networkService = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $networkServiceSid,$ConstFullControlPermissions,3,"None","Allow" -ErrorAction Stop
        $acl.SetAccessRule($networkService)

        $builtInAdministratorsSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstBuiltInAdministratorsSid -ErrorAction Stop
        $builtInAdministrators = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $builtInAdministratorsSid,$ConstFullControlPermissions,3,"None","Allow" -ErrorAction Stop
        $acl.SetAccessRule($builtInAdministrators)

        $builtInTrustedInstallerSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstBuiltInTrustedInstallerSid -ErrorAction Stop
        $builtInTrustedInstaller = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $builtInTrustedInstallerSid,$ConstFullControlPermissions,3,"None","Allow" -ErrorAction Stop
        $acl.SetAccessRule($builtInTrustedInstaller)

        $systemSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstBuiltInSystemSid -ErrorAction Stop
        $system = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $systemSid,$ConstFullControlPermissions,3,"None","Allow" -ErrorAction Stop
        $acl.SetAccessRule($system)
    } catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to add built in accounts to the acl for $programFilesPath. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Set-Acl -Path $programFilesPath -AclObject $acl -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to set the ACL for program files folder $programFilesPath. Error: $err"
        ExitWithErrorCode 1
        return
    }

    $folders = Get-ChildItem -Path $programFilesPath -Directory -Recurse -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to set the subfolders of program files folder $programFilesPath. Error: $err"
        ExitWithErrorCode 1
        return
    }

    # Set the subfolders to inherit from their "program files" parent folder...
    foreach ($folder in $folders) {
        $folderName = $folder.FullName

        $folderAcl = Get-Acl -Path $folderName -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to get the ACL for program files subfolder $folderName. Error: $err"
            ExitWithErrorCode 1
            return
        }

        try {
            $folderAcl.SetAccessRuleProtection($false, $true) 
        } catch {
            Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed SetAccessRuleProtection() for program files subfolder $folderName. Error: $_"
            ExitWithErrorCode 1
            return
        }

        Set-Acl -Path $folderName -AclObject $folderAcl -ErrorAction SilentlyContinue -ErrorVariable err
        if (!!$err) {
            Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHAProgramFilesAccess: Failed to set the ACL for program files subfolder $folderName. Error: $err"
            ExitWithErrorCode 1
            return
        }
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Set-WACHAProgramFilesAccess: Successfully configured access for the program files folder $programFilesPath."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets if the current OS has a desktop.

.DESCRIPTION
    Gets if the current operating system has a desktop (e.g., Windows Client SKUs, non-core Windows Server SKUs, etc.).

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, 1 is error, 2 is early exit.

.EXAMPLE
    Get-WACHasDesktop
#>
function Get-WACHasDesktop {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $productType = (Get-CimInstance -ClassName Win32_OperatingSystem).ProductType
        # check if it's Windows Workstation such as Windows Client ("1")
        if ($productType -ne 1) {
            # check if explorer.exe exists in the system root; if not, it's a server core SKU
            $foundDesktop = Test-Path -Path "$env:SystemRoot\explorer.exe"
            if (-not $foundDesktop) {
                Write-Log -Level INFO -ExitCode 2 -Message "Get-WACHasDesktop: Current OS does not have desktop."
                ExitWithErrorCode 2
                return $false
            }
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACHasDesktop: Current OS does have desktop."
        ExitWithErrorCode 0
        return $true
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACHasDesktop: Failed to determine if current OS has desktop. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Starts the Windows Admin Center service.

.DESCRIPTION
    Starts the Windows Admin Center service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Start-WACService
#>
function Start-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Start-Service -Name $ConstServiceName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Start-WACService: Successfully started Windows Admin Center service."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Start-WACService: Failed to start Windows Admin Center service. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Starts Windows Admin Center through launcher.

.DESCRIPTION
    Starts Windows Admin Center through launcher if the current operating system has a desktop (e.g., Windows Client SKUs, non-core Windows Server SKUs, etc.). Otherwise returns early.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, 1 is error, 2 is early exit.

.EXAMPLE
    Start-WACLauncher
#>
function Start-WACLauncher {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $hasDesktop = Get-WACHasDesktop
        if (-not $hasDesktop) {
            Write-Log -Level INFO -ExitCode 2 -Message "Start-WACLauncher: Current OS does not have desktop. Exiting early."
            ExitWithErrorCode 2
            return
        }

        Start-Process -FilePath $ConstLauncherExecutableName -WorkingDirectory (GetServicePath)
        Write-Log -Level INFO -ExitCode 0 -Message "Start-WACLauncher: Successfully started Windows Admin Center launcher."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Start-WACLauncher: Failed to start Windows Admin Center launcher. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets the status of the Windows Admin Center service.

.DESCRIPTION
    Gets the status of the Windows Admin Center service and processes.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACService
#>
function Get-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-Service -Name $ConstServiceName -ErrorAction Stop
        Get-Process -Name $ConstServiceName -ErrorAction SilentlyContinue
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACService: Successfully got Windows Admin Center service status."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACService: Failed to get Windows Admin Center service status. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets the status of the Windows Admin Center Account Management service.

.DESCRIPTION
    Gets the status of the Windows Admin Center Account Management service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACAccountManagementService
#>
function Get-WACAccountManagementService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-Service -Name $ConstAccountManagementServiceName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACAccountManagementService: Successfully got Windows Admin Center Account Management service status."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACAccountManagementService: Failed to get Windows Admin Center Account Management service status. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets the status of Windows Admin Center Updater scheduled task.

.DESCRIPTION
    Gets the status of Windows Admin Center Updater scheduled task.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACUpdaterScheduledTask
#>
function Get-WACUpdaterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACUpdaterScheduledTask: Successfully got Windows Admin Center Updater scheduled task status."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACUpdaterScheduledTask: Failed to get Windows Admin Center Updater scheduled task status. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Stops the Windows Admin Center service.

.DESCRIPTION
    Stops the Windows Admin Center service if found on the system and is currently in the running state, otherwise returns early.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Stop-WACService
#>
function Stop-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $wacService = Get-Service -Name $ConstServiceName -ErrorAction SilentlyContinue
        if (($null -eq $wacService) -or ($wacService.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running)) {
            Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACService: Windows Admin Center service is already stopped or not available."
        }
        else {
            Stop-Service -Name $ConstServiceName -Force -ErrorAction Stop
            Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACService: Successfully stopped Windows Admin Center service."
        }

        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Stop-WACService: Failed to stop Windows Admin Center. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Stops the Windows Admin Center launcher.

.DESCRIPTION
    Stops the Windows Admin Center launcher if the current operating system has a desktop (e.g., Windows Client SKUs, non-core Windows Server SKUs, etc.) and the launcher process is launching. Otherwise returns early.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, 1 is error, 2 is early exit.

.EXAMPLE
    Stop-WACLauncher
#>
function Stop-WACLauncher {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $hasDesktop = Get-WACHasDesktop
        if (-not $hasDesktop) {
            Write-Log -Level INFO -ExitCode 2 -Message "Stop-WACLauncher: Current OS does not have desktop. Exiting early."
            ExitWithErrorCode 2
            return
        }

        $launcher = Get-Process -Name $ConstLauncherName -ErrorAction SilentlyContinue
        if ($null -ne $launcher) {
            $launcher | Stop-Process -Force
            Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACLauncher: Successfully stopped Windows Admin Center Launcher."
        }
        
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Stop-WACLauncher: Failed to stop Windows Admin Center Launcher. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Stops the Windows Admin Center Account Management service.

.DESCRIPTION
    Stops the Windows Admin Center Account Management service if currently in the running state, otherwise returns early.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Stop-WACAccountManagementService
#>
function Stop-WACAccountManagementService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $wacService = Get-Service -Name $ConstAccountManagementServiceName
        if ($wacService.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {
            Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACAccountManagementService: Windows Admin Center Account Management service is already stopped."
            ExitWithErrorCode 0
            return;
        }

        Stop-Service -Name $ConstAccountManagementServiceName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACAccountManagementService: Successfully stopped Windows Admin Center Account Management service."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Stop-WACAccountManagementService: Failed to stop Windows Admin Center Account Management service. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Stops the Windows Admin Center Updater scheduled task.

.DESCRIPTION
    Stops the Windows Admin Center Updater scheduled task if currently in the running state, otherwise returns early.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Stop-WACUpdaterScheduledTask
#>
function Stop-WACUpdaterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $updaterService = Get-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName
        if ($updaterService.State -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {
            Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACUpdaterScheduledTask: Windows Admin Center Updater scheduled task is already stopped."
            ExitWithErrorCode 0
            return;
        }

        Stop-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Stop-WACUpdaterScheduledTask: Successfully stopped Windows Admin Center Updater scheduled task."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Stop-WACUpdaterScheduledTask: Failed to stop Windows Admin Center Updater scheduled task. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Unregisters the Windows Admin Center service.

.DESCRIPTION
    Stops the Windows Admin Center service if running and then unregisters it.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACService
#>
function Unregister-WACService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    Stop-Service -Name $ConstServiceName -ErrorAction SilentlyContinue

    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "delete", $ConstServiceName
    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACService: Successfully unregistered Windows Admin Center service."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Unregisters the Windows Admin Center Account Management service.

.DESCRIPTION
    Stops the Windows Admin Center Account Management service if running and then unregisters it. If the CheckIfExist flag is used and the service does not exist, returns early.

.PARAMETER CheckIfExist
    Check if the service exists before attempting to unregister it.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACAccountManagementService

.EXAMPLE
    Unregister-WACAccountManagementService -CheckIfExist
#>
function Unregister-WACAccountManagementService {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$CheckIfExist,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    if ($CheckIfExist) {
        $service = Get-Service -Name $ConstAccountManagementServiceName -ErrorAction SilentlyContinue
        if ($service.Length -eq 0) {
            Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACAccountManagementService: Not found Windows Admin Center Account Management service."
            ExitWithErrorCode 0
            return
        }
    }

    Stop-Service -Name $ConstAccountManagementServiceName -ErrorAction SilentlyContinue

    Invoke-WACWinCommand -Command $ConstServiceController -Parameters "delete", $ConstAccountManagementServiceName
    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACAccountManagementService: Successfully unregistered Windows Admin Center Account Management service."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Unregisters the Windows Admin Center Updater scheduled task.

.DESCRIPTION
    Stops the Windows Admin Center Updater scheduled task if running and then unregisters it.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACUpdaterScheduledTask
#>
function Unregister-WACUpdaterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    Stop-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -ErrorAction SilentlyContinue

    Unregister-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -Confirm:$false
    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACUpdaterScheduledTask: Successfully unregistered Windows Admin Center Updater scheduled task."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Copies Windows Admin Center process files from installer from temp location to path to use for service registration.

.DESCRIPTION
    Copies Windows Admin Center Updater process files from installer from temp location to path to use for scheduled task registration.
    If the scheduled task is already registered, this function returns early in case the updater scheduled task is running the installer.
    Setting the Force switch will force the copy to occur.

.PARAMETER Force
    Force the copy to occur.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Copy-WACTempUpdaterProcessFiles

.EXAMPLE
    Copy-WACTempUpdaterProcessFiles -Force
#>
function Copy-WACTempUpdaterProcessFiles {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $scheduledTask = Get-ScheduledTask -TaskName $ConstUpdaterScheduledTaskName -ErrorAction SilentlyContinue
        if ($scheduledTask.Length -gt 0) {
            if ($Force -eq $false) {
                Write-Log -Level INFO -ExitCode 0 -Message "Copy-WACTempUpdaterProcessFiles: Windows Admin Center Updater scheduled task is already registered. Skipping copy."
                ExitWithErrorCode 0
                return
            }

            Stop-WACUpdaterScheduledTask -ExitWithErrorCode:$false
        }

        $updaterPath = GetUpdaterPath
        Copy-Item -Path (Join-Path -Path (GetServicePath) -ChildPath "*") -Destination $updaterPath `
            -Exclude $("$ConstServiceName.*", "$ConstAccountManagementServiceName.*", "$ConstLauncherName.*", $ConstEntityFrameworkBundleFileName) -Recurse -Force
        Copy-Item -Path (Join-Path -Path (GetServicePath) -ChildPath $ConstUpdaterExecutableName) -Destination $updaterPath -Force
        
        Write-Log -Level INFO -ExitCode 0 -Message "Copy-WACTempUpdaterProcessFiles: Successfully copied Windows Admin Center Updater process files."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Copy-WACTempUpdaterProcessFiles: Failed to copy Windows Admin Center Updater process files. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Creates the Windows Admin Center event log and configures it.

.DESCRIPTION
    Creates the Windows Admin Center event log sources underneath the WindowsAdminCenter log name and configures the event logs underneath the log name.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    New-WACEventLog
#>
function New-WACEventLog {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        if (!(AssertEventLogExists($ConstEventLogName))) {
            CreateEventSources
        }   
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "New-WACEventLog: Failed to create Windows Admin Center event log. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    $hundredMegaByte = 100 * 1024 * 1024
    Invoke-WACWinCommand -Command $ConstWevutilCommand -Parameters "set-log $ConstEventLogName /ms:$hundredMegaByte"
    Write-Log -Level INFO -ExitCode 0 -Message "New-WACEventLog: Successfully created Windows Admin Center event log."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    [PLACEHOLDER] Adds the saved certificates used by GW to this server.

.DESCRIPTION
    Add the certficates whose thumprints are saved in appsettings.json to this node. The file paths for the .cer files
    will also be available in settings.json.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Add-WACCertificates -ExitCode
#>
function Add-WACCertificates {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    # TODO: Implement importing of certificates for use in HA installation.
    Write-Log -Level INFO -ExitCode 0 -Message "Starting Add-WACCertificates..."

    SetExitWithErrorCode $ExitWithErrorCode

    Write-Log -Level INFO -ExitCode 0 -Message "Add-WACCertificates: Successfully added the saved certificates to this server."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Updates $env:PSModulePath to include the path to where the module file resides.

.DESCRIPTION
    Idempotentently add the path where this module was installed to the PSModulePath.  This will
    enable easier loading of this module since the user will only need to know its name.

.PARAMETER Operation
    Exit the script with the error code. 0 is success, otherwise error.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Update-WACPSModulePath -Operation Add -ExitCode
#>
function Update-WACPSModulePath {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Add', 'Remove')]
        [String]$Operation,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    Write-Log -Level INFO -ExitCode 0 -Message "Starting Update-WACPSModulePath..."

    SetExitWithErrorCode $ExitWithErrorCode
    
    $envModulePath = $env:PSModulePath
    $psModulePath = GetPowerShellModulesPath
    $containsModulesPath = $envModulePath.ToLower().Contains($psModulePath.ToLower())
    $updateSystemVar = $false

    if ($containsModulesPath -and ($Operation -eq 'Remove')) {
        Write-Log -Level INFO -ExitCode 0 -Message "Update-WACPSModulePath: Removing the module path from PSModulePath."
        $envModulePath = $envModulePath -replace $psModulePath, ''
        $env:PSModulePath = $envModulePath
        $updateSystemVar = $true
    }

    if ((-not $containsModulesPath) -and ($Operation -eq 'Add')) {
        Write-Log -Level INFO -ExitCode 0 -Message "Update-WACPSModulePath: Adding the module path to PSModulePath."
        $envModulePath = $envModulePath + ";$psModulePath"
        $env:PSModulePath = $envModulePath
        $updateSystemVar = $true
    }

    if ($updateSystemVar) {
        try {
            [Environment]::SetEnvironmentVariable('PSModulePath', $envModulePath, 'Machine')
        } catch {
            Write-Log -Level ERROR -ExitCode 1 -Message "Update-WACPSModulePath: Failed to updated system PSModulePath. Error: $_"
            ExitWithErrorCode 1
            throw
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Update-WACPSModulePath: Successfully updated PSModulePath."
    } else {
        Write-Log -Level INFO -ExitCode 0 -Message "Update-WACPSModulePath: PSModulePath did not need to be updated."
    }

    ExitWithErrorCode 0
}

function CreateEventSources {
    $sources = @("Core", "Launcher", "Updater", "AccountManagement", "Plugin")
    $sources += @(GetJsonField -Path  (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Services", 0, "Name")
    $sources += @(GetJsonField -Path  (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Services", 1, "Name")

    foreach ($source in $sources) {
        New-EventLog -Source $source -LogName $ConstEventLogName -ErrorAction Stop
    }

    if ([System.Diagnostics.EventLog]::SourceExists($ConstLogSourceWACConfiguration)) {
        Remove-EventLog -Source $ConstLogSourceWACConfiguration -ErrorAction SilentlyContinue
    }
    New-EventLog -LogName $ConstEventLogName -Source $ConstLogSourceWACConfiguration -ErrorAction SilentlyContinue
}

function AssertEventLogExists {
    Param(
        [string]$EventLogName
    )
    return [System.Diagnostics.EventLog]::Exists($EventLogName)
}

<#
.SYNOPSIS
    Updates the paths stored in appsettings.json to those where the GW is installed in the cluster.

.DESCRIPTION
    Updates the paths stored in appsettings.json to those where the GW is installed in the cluster.
    
.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Update-WACHAAppSettings -ExitCode
#>
function Update-WACHAAppSettings {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    Write-Log -Level INFO -ExitCode 0 -Message "Starting Update-WACHAAppSettings..."

    SetExitWithErrorCode $ExitWithErrorCode

    $appSettingsFile = GetAppSettingsPath
    $programDataPath = GetProgramDataAppPath
    $programFilesPath = GetProgramFilesAppPath
    $controllersPath = GetControllersPath

    UpdateJsonField -Path $appSettingsFile -Sections "WindowsAdminCenter", "FileSystem", "ProgramDataPath" -Value $programDataPath
    UpdateJsonField -Path $appSettingsFile -Sections "WindowsAdminCenter", "FileSystem", "ProgramFilesPath" -Value $programFilesPath
    UpdateJsonField -Path $appSettingsFile -Sections "WindowsAdminCenter", "FailoverCluster", "Certificates", "StorePath" -Value $programFilesPath

    $appSettings = Get-Content -Path $appSettingsFile -Raw | ConvertFrom-Json
    $features = [System.Collections.Generic.List[PSCustomObject]]$appSettings.WindowsAdminCenter.Features

    foreach ($feature in $features) {
        $feature.FullPath = $controllersPath
    }

    $appSettings.WindowsAdminCenter.Features = $features.ToArray()
    $appSettings | ConvertTo-Json -Depth 100 | Out-File -FilePath $appSettingsFile -ErrorAction Stop

    Write-Log -Level INFO -ExitCode 0 -Message "Update-WACHAAppSettings: Successfully updated variables in $appSettingsFile."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Starts the Cluster role for the Gateway Service.

.DESCRIPTION
    Starts the GW HA role (group) on this cluster.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Start-WACHARole -ExitCode
#>
function Start-WACHARole {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Start-WACHARole: RoleName: $RoleName"

    SetExitWithErrorCode $ExitWithErrorCode

    $roleName = ""
    $role = GetGWRole
    if (!$role) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Start-WACHARole: The cluster HA GW role was not found."
        ExitWithErrorCode 1

        return
    }

    $roleName = $role.Name

    $role | Start-clusterGroup -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Start-WACHARole: The cluster HA GW role could not be started. Error: $err"
        ExitWithErrorCode 1

        return
    }
    
    Write-Log -Level INFO -ExitCode 0 -Message "Start-WACHARole: Successfully started HA GW role $roleName."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Creates the Cluster role for the Gateway Service.

.DESCRIPTION
    Creates the highly availabe role for the GW in a failover cluster. This role will have a name and the
    roles common name (CN) and FQDnsName are expected to be in any cert in cert:\LocalMachine\My used by
    the GW.

.PARAMETER RoleName
    The user supplied name for the cluster role.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    New-WACHARole -ExitCode -RoleName "MyClusterRoleName"
#>
function New-WACHARole {
    Param(
        [Parameter(Mandatory = $True)]
        [String]$RoleName,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting New-WACHARole: RoleName: $RoleName"

    SetExitWithErrorCode $ExitWithErrorCode

    Import-Module -Name FailoverClusters -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "New-WACHARole: The Failover Clusters PowerShell module could not be imported. Error: $err"
        ExitWithErrorCode 1

        return
    }

    $service = GetGatewayService -ErrorAction SilentlyContinue
    if (!$service) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "New-WACHARole: The Windows Admin Center Gateway service was not found."
        ExitWithErrorCode 1

        return
    }

    Add-ClusterGenericServiceRole -Name $RoleName -ServiceName $service.Name -CheckpointKey $ConstUninstallRegKeyPath -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "New-WACHARole: There was an error creating the Windows Admin Center Gateway cluster role. Error: $err"
        ExitWithErrorCode 1

        return
    }

    # This cmdlet will inherit the $global exit code setting from this cmdlet -- so there is not need to pass, or not pass,
    # -ExitWithErrorCode here.  When invoked externally then it will use the ExitWithExitCode param with which it was invoked.
    Register-WACClusterScheduledTask

    Write-Log -LEVEL INFO -ExitCode 0 -Message "New-WACHARole: Successfully created the HA role..."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    [PLACEHOLDER] Updates an existing GW role.

.DESCRIPTION
    Upgrades the existing GW HA role whether is be GWv1 to GWv2, or GWv2 to GWv2 because setup was run again.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Update-WACHARole -ExitCode
#>
function Update-WACHARole {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    # TODO: Implement updating HA role for GW for migration from GWv1 to GWv2 and possibly GWv2 update scenario (may not be necessary for regular update).
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Update-WACHARole..."

    SetExitWithErrorCode $ExitWithErrorCode

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Update-WACHARole: Successfully updated the HA role..."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Stops the Cluster generic service resource for the Gateway Service.

.DESCRIPTION
     Find and stop the generic service resource that controls the GW service.  Stopping the service
     when there is an HA role to manage that service will simply cause the cluster to restart
     the service.  In a cluster, if we want to stop the GW service any reason, e.g. upgrade, then you
     must stop either the generic service resource or the HA role.  Stopping the resource will leave
     the network name and IP address resources online.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Stop-WACGenericResource -ExitCode
#>
function Stop-WACGenericResource {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Stop-WACGenericResource..."

    SetExitWithErrorCode $ExitWithErrorCode

    $resource = GetGWGenericServiceResource
    $resourceName = $resource.Name

    $resource | Stop-ClusterResource -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Stop-WACGenericResource: Failed to stop resource $resourceName. Error: $err"
        ExitWithErrorCode 1
    } else {
        Write-Log -LEVEL INFO -ExitCode 0 -Message "Stop-WACGenericResource: Successfully stopped resouce $resourceName..."
        ExitWithErrorCode 0
    }
}

<#
.SYNOPSIS
    Stops the GW HA role in this cluster.

.DESCRIPTION
     Find and stop the cluster group (role) that manages the HA GW on this cluster.  This will stop
     all of resources in the role, including the network nama and IP address resource.  If you 
     only want to stop the GW service then use Stop-WACGenericResource.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Stop-WACHARole -ExitCode
#>
function Stop-WACHARole {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Stop-WACHARole..."

    SetExitWithErrorCode $ExitWithErrorCode

    $role = GetGWRole
    $roleName = $role.Name

    $role | Stop-ClusterGroup -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Stop-WACHARole: Failed to stop role $roleName. Error: $err"
        ExitWithErrorCode 1
    } else {
        Write-Log -LEVEL INFO -ExitCode 0 -Message "Stop-WACHARole: Successfully stopped the HA role $roleName..."
        ExitWithErrorCode 0
    }
}

<#
.SYNOPSIS
    Removes the GW HA role from this cluster.

.DESCRIPTION
     Find, stop, and remove the cluster group (role) that manages the GW service in this cluster.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Remove-WACHARole -ExitCode
#>
function Remove-WACHARole {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Remove-WACHARole..."

    SetExitWithErrorCode $ExitWithErrorCode

    $role = GetGWRole
    if (!$role) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Remove-WACHARole: Failed to get the role group from the cluster."
        ExitWithErrorCode 1
        return
    }

    $roleName = $role.Name

    Stop-ClusterGroup -InputObject $role -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Remove-WACHARole: Failed to stop role $roleName. Error: $err"
        ExitWithErrorCode 1
        return
    }

    $genSvcResource = GetGWGenericServiceResource
    $resourceName = $genSvcResource.Name
    Remove-ClusterCheckpoint -ResourceName $resourceName -RegistryCheckpoint -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Remove-WACHARole: Failed to remove the registry checkpoint for generic service resource $resourceName. Error: $err"
    }

    Remove-ClusterGroup -InputObject $role -RemoveResources -Force -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Remove-WACHARole: Failed to remove role $roleName. Error: $err"
        ExitWithErrorCode 1
        return
    }

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Remove-WACHARole: Successfully removed the HA role $roleName..."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Creates the Cluster scheduled task.

.DESCRIPTION
     This task will run a script that does the per node configuration needed by the GW service.  This script
     will also detect when the GW has been removed from one cluster node and will do the per node cleanup.
     Once all nodes are cleaned up the cluster scheduled task will be removed.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACClusterScheduledTask -ExitCode
#>
function Register-WACClusterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Register-WACClusterScheduledTask..."
    SetExitWithErrorCode $ExitWithErrorCode

    $powerShellModulesPath = GetPowerShellModulesPath
    $scriptFilePath = Join-Path -Path $powerShellModulesPath -ChildPath "$ConstConfigurationPowerShellModuleName\$ConstClusterNodeConfigurationScriptFileName"
    $action = New-ScheduledTaskAction -Execute "PowerShell.exe -File $scriptFilePath" -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Register-WACClusterScheduledTask: Failed to create the scheduled task action. Error: $err"
        ExitWithErrorCode 1
        return
    }

    $trigger = New-ScheduledTaskTrigger -At 12:00 -Daily
    
    Register-ClusteredScheduledTask -TaskName $ConstClusterNodeScheduledTaskName -TaskType ClusterWide -Action $action -Trigger $trigger -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Register-WACClusterScheduledTask: Failed to create the cluster scheduled task $ConstClusterNodeScheduledTaskName. Error: $err"
        ExitWithErrorCode 1
        return
    }

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Register-WACClusterScheduledTask: Successfully created the clustered scheduled task $ConstClusterNodeScheduledTaskName..."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Removes the Cluster scheduled task.

.DESCRIPTION
    Remove the per node configuration task.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACClusterScheduledTask -ExitCode
#>
function Unregister-WACClusterScheduledTask {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Unregister-WACClusterScheduledTask..."
    SetExitWithErrorCode $ExitWithErrorCode

    Unregister-ClusteredScheduledTask -TaskName $ConstClusterNodeScheduledTaskName -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -LEVEL ERROR -ExitCode 1 -Message "Unregister-WACClusterScheduledTask: Failed to remove the cluster scheduled task $ConstClusterNodeScheduledTaskName. Error: $err"
        ExitWithErrorCode 1
        return
    }

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Unregister-WACClusterScheduledTask: Successfully removed the clustered scheduled task $ConstClusterNodeScheduledTaskName..."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Tests whether or not this cluster has an HA GW role.

.DESCRIPTION
     Find the cluster group (role) that manages the GW service in this cluster.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Test-WACClusterRole -ExitCode
#>
function Test-WACClusterRole {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Test-WACClusterRole..."
    SetExitWithErrorCode $ExitWithErrorCode

    $role = GetGWRole
    if (!$role) {
        Write-Log -LEVEL WARN -ExitCode 1 -Message "Test-WACClusterRole: The WAC HA role was not found. Exit code 1"

        ExitWithErrorCode 1
        return $false
    }

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Test-WACClusterRole: The WAC HA role was found..."
    ExitWithErrorCode 0
    return $true
}

<#
.SYNOPSIS
     Tests whether or not the WAC GW is installed on this computer.

.DESCRIPTION
     Tests whether or not the WAC GW is installed on this computer.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Test-WACInstalled -ExitCode
#>
function Test-WACInstalled {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    Write-Log -LEVEL INFO -ExitCode 0 -Message "Starting Test-WACInstalled..."
    SetExitWithErrorCode $ExitWithErrorCode

    $regKey = GetUninstallRegistryKey
    if (!$regKey) {
        Write-Log -LEVEL WARN -ExitCode 1 -Message "Test-WACInstalled: The WAC GW is not installed on this computer. Exit code 1"

        ExitWithErrorCode 1
        return $false
    }

    Write-Log -LEVEL INFO -ExitCode 0 -Message "Test-WACInstalled: There were no installation errors on this computer..."
    ExitWithErrorCode 0
    return $true
}

<#
.SYNOPSIS
    Removes the Windows Admin Center event log.

.DESCRIPTION
    Removes the Windows Admin Center event log.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Remove-WACEventLog
#>
function Remove-WACEventLog {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode,
        [Parameter(Mandatory = $false)]
        [switch]$ClusterDetected
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        if ($ClusterDetected) {
            # NB: The WAC-Configuration event source in the WindowsAdminCenter log must remain after
            # uninstalling.
            RemoveEventSources
            Write-Log -Level INFO -ExitCode 0 -Message "Remove-WACEventLog: Successfully removed Windows Admin Center event log sources."
        } else {
            Remove-EventLog -LogName $ConstEventLogName
            Write-Log -Level INFO -ExitCode 0 -Message "Remove-WACEventLog: Successfully removed Windows Admin Center event log."
        }

        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Remove-WACEventLog: Failed to remove Windows Admin Center event log. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Creates new self signed TLS certificate.

.DESCRIPTION
    Creates new self signed TLS certificate. The certificate is signed by a temporary signer CA certificate.

.PARAMETER Fqdn
    FQDN of host name accessed externally. If not provided, it uses Machine name.

.PARAMETER Trust
    Trusts the self-signed certificate on the local computer. It installs the certificate into the Trusted Root.
    If this option isn't specified, the certificate is added to the certificate store but not to a trusted list.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    New-WACSelfSignedCertificate

.EXAMPLE
    New-WACSelfSignedCertificate -Fqdn "myserver.contoso.com"

.EXAMPLE
    New-WACSelfSignedCertificate -Fqdn "myserver.contoso.com" -Trust

#>
function New-WACSelfSignedCertificate {
    Param( 
        [Parameter(Mandatory = $false)]
        [string]$Fqdn,
        [Parameter(Mandatory = $false)]
        [switch]$Trust,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        if ([string]::IsNullOrEmpty($Fqdn)) {
            $Fqdn = [System.Environment]::MachineName
        }
        
        # Create TLS certificate.
        $fileSecurity = New-Object System.Security.AccessControl.FileSecurity
        $fileSecurity.SetSecurityDescriptorSddlForm($ConstCertificateKeySecurityDescriptor)
        $sslCertExpiryDate = (Get-Date).AddDays(60)
        $sslCertArguments = @{
            Subject            = $ConstSSLCertificateSubjectName
            DnsName            = $Fqdn
            FriendlyName       = $ConstSSLCertificateFriendlyName
            KeyAlgorithm       = "RSA"
            KeyLength          = 2048
            KeyUsage           = "DigitalSignature", "KeyEncipherment"
            TextExtension      = "2.5.29.37={text}1.3.6.1.5.5.7.3.1", "2.5.29.19={text}CA=false"
            HashAlgorithm      = "SHA256"
            Provider           = "Microsoft Enhanced RSA and AES Cryptographic Provider"
            CertStoreLocation  = "Cert:\LocalMachine\My"
            NotAfter           = $sslCertExpiryDate
            SecurityDescriptor = $fileSecurity
        }
        $certificate = New-SelfSignedCertificate @sslCertArguments

        if ($Trust) {
            $path = "$([System.IO.Path]::GetTempFileName()).cer"
            Export-Certificate -Cert $certificate -FilePath $path -Type CERT -ErrorAction Stop | Out-Null
            Import-Certificate -FilePath $path -CertStoreLocation Cert:\LocalMachine\Root -ErrorAction Stop | Out-Null
        }

        $certificate
        Write-Log -Level INFO -ExitCode 0 -Message "New-WACSelfSignedCertificate: Successfully created self signed certificate."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "New-WACSelfSignedCertificate: Failed to create self signed certificate. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets all self signed certificates for Windows Admin Center.

.DESCRIPTION
    Gets all self signed certificates for Windows Admin Center.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACSelfSignedCertificate
#>
function Get-WACSelfSignedCertificate {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-Item -Path Cert:LocalMachine\My\* -ErrorAction Stop | Where-Object { $_.Subject -eq $ConstSSLCertificateSubjectCN }
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACSelfSignedCertificate: Successfully retrieved self signed certificate."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSelfSignedCertificate: Failed to retrieve self signed certificate. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Removes the self signed TLS certificate for Windows Admin Center.

.DESCRIPTION
    Removes the self signed TLS certificate for Windows Admin Center.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Remove-WACSelfSignedCertificate
#>
function Remove-WACSelfSignedCertificate {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-Item Cert:LocalMachine\Root\* | Where-Object { $_.Subject -eq $ConstSSLCertificateSubjectCN } | Remove-Item -ErrorAction SilentlyContinue
        Get-Item Cert:LocalMachine\My\* | Where-Object { $_.Subject -eq $ConstSSLCertificateSubjectCN } | Remove-Item -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Remove-WACSelfSignedCertificate: Successfully removed self signed certificate."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Remove-WACSelfSignedCertificate: Failed to remove self signed certificate. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Registers configuration of HTTP.SYS.

.DESCRIPTION
    Registers configuration of HTTP.SYS with the port and the certificate specified.

.PARAMETER Thumbprint
    The thumbprint of TLS certificate installed on LocalMachine store. (default uses CN=WindowsAdminCenterSelfSigned certificate from local machine store).

.PARAMETER Port
    The port number of HTTPS connection. Default port number is 6600.

.PARAMETER Force
    Force update if there is existing configuration to the port.

.PARAMETER UserMode
    Configure the port for all users on the computer instead of Network Service. This option is not usually required.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACHttpSys

.EXAMPLE
    Register-WACHttpSys -Thumbprint "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -Port 6600 -UserMode
#>
function Register-WACHttpSys {
    Param(
        [Parameter(Mandatory = $false)]
        [string]$Thumbprint,
        [Parameter(Mandatory = $false)]
        [int]$Port = $ConstDefaultPort,
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        [Parameter(Mandatory = $false)]
        [switch]$UserMode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $result = Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "show", "sslcert", "ipport=0.0.0.0:$Port") -NoExit -ReturnObject
    if ($result.ExitCode -eq 0 -and -not $Force) {
        $message = "Register-WACHttpSys: Setting was already applied on the port."
        Write-Host $message
        Write-Log -Level INFO -ExitCode 0 -Message $message
        ExitWithErrorCode 0
        return
    }

    if ([string]::IsNullOrWhiteSpace($Thumbprint)) {
        if ($result.ExitCode -eq 0) {
            $Thumbprint = (($result.StdOut -split '\r?\n') | Where-Object { $_.Contains("Certificate Hash") } ).Split(":")[1].Trim()
            $certificate = Get-Item -Path Cert:\LocalMachine\my\$Thumbprint -ErrorAction SilentlyContinue
            if ($null -eq $certificate) {
                # certificate was removed from the store.
                $Thumbprint = $null
            }
        }
        
        if ([string]::IsNullOrEmpty($Thumbprint)) {
            $certificates = Get-Item Cert:LocalMachine\My\* | Where-Object { $_.Subject -eq 'CN=WindowsAdminCenterSelfSigned' }
            if ($null -eq $certificates) {
                $errorMessage = "Register-WACHttpSys: Couldn't find the certificate to apply. Thumbprint is required or no self-signed certificate exits."
                Write-Error -Message $errorMessage
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                return
            }

            $Thumbprint = @($certificates)[0].Thumbprint
        }
    }

    if ($result.ExitCode -eq 0) {
        Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "delete", "sslcert", "ipport=0.0.0.0:$Port") -NoExit
    }
    
    $securityDescriptor = if ($UserMode) { $ConstUsersSecurityDescriptor } else { $ConstNetworkServiceSecurityDescriptor }
    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "add", "sslcert", "ipport=0.0.0.0:$Port", "certhash=$Thumbprint", "appid=""$ConstAppId""") -NoExit

    $result = Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "show", "urlacl", "url=https://+:$Port/") -NoExit -ReturnObject
    if ($result.StdOut.Contains("https://+:$Port/") -and $Force) {
        Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "delete", "urlacl", "url=https://+:$Port/") -NoExit
    }

    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters @("http", "add", "urlacl", "url=https://+:$Port/", "sddl=`"$securityDescriptor`"") -NoExit
    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACHttpSys: Successfully registered HTTP.SYS configuration."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets configuration of HTTP.SYS.

.DESCRIPTION
    Gets configuration of HTTP.SYS with the port number specified.

.PARAMETER Port
    The port number of HTTPS connection. Default port number is 6600.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACHttpSys

.EXAMPLE
    Get-WACHttpSys -Port 6600
#>
function Get-WACHttpSys {
    Param(
        [Parameter(Mandatory = $false)]
        [int]$Port = $ConstDefaultPort,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters "http", "show", "sslcert", "ipport=0.0.0.0:$port" -NoExit
    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters "http", "show", "urlacl", "url=https://+:$port/" -NoExit
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACHttpSys: Successfully retrieved HTTP.SYS configuration."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Unregisters configuration of HTTP.SYS.

.DESCRIPTION
    Unregisters configuration of HTTP.SYS with the port number specified.

.PARAMETER Port
    The port number of HTTPS connection. Default port number is 6600.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACHttpSys

.EXAMPLE
    Unregister-WACHttpSys -Port 6600
#>
function Unregister-WACHttpSys {
    Param(
        [Parameter(Mandatory = $false)]
        [int]$Port = $ConstDefaultPort,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters "http", "delete", "sslcert", "ipport=0.0.0.0:$port"
    Invoke-WACWinCommand -Command $ConstNetShCommand -Parameters "http", "delete", "urlacl", "url=https://+:$port/" -NoExit
    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACHttpSys: Successfully unregistered HTTP.SYS configuration."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC install date.

.DESCRIPTION
    Sets the WAC install date in appsettings.json under %ProgramFiles%\WindowsAdminCenter to the current date.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACInstallDate
#>
function Set-WACInstallDate {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $currentDate = Get-Date -Format "yyyyMMdd"
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "InstallDate" -Value $currentDate
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACInstallDate: Failed to set WAC install date. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC install date.

.DESCRIPTION
    Gets the WAC install date in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACInstallDate
#>
function Get-WACInstallDate {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "InstallDate"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACInstallDate: Successfully retrieved WAC install date."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC file version.

.DESCRIPTION
    Sets the WAC file version in appsettings.json under %ProgramFiles%\WindowsAdminCenter to the given version.

.PARAMETER FileVersion
    The file version to set.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACFileVersion -FileVersion "1.0.0.0"
#>
function Set-WACFileVersion {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$FileVersion,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "FileVersion" -Value $FileVersion
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACFileVersion: Failed to set WAC file version. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC file version.

.DESCRIPTION
    Gets the WAC file version in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACFileVersion
#>
function Get-WACFileVersion {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "FileVersion"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACFileVersion: Successfully retrieved WAC file version."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC NuGet version.

.DESCRIPTION
    Sets the WAC NuGet version in appsettings.json under %ProgramFiles%\WindowsAdminCenter to the given version.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACNuGetVersion -NuGetVersion "1.0.0-dev.0"
#>
function Set-WACNuGetVersion {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$NuGetVersion,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "NuGetVersion" -Value $NuGetVersion
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACNuGetVersion: Failed to set WAC NuGet version. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC NuGetVersion.

.DESCRIPTION
    Gets the WAC NuGet version in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACNuGetVersion
#>
function Get-WACNuGetVersion {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "NuGetVersion"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACNuGetVersion: Successfully retrieved WAC NuGet version."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Enables PowerShell remoting.

.DESCRIPTION
    Starts and configures PowerShell remoting.
    
.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Enable-WACPSRemoting
#>
function Enable-WACPSRemoting {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Enable-PSRemoting -SkipNetworkProfileCheck -Force -ErrorAction Stop
        Write-Log -Level INFO -ExitCode 0 -Message "Enable-WACPSRemoting: Successfully configured PowerShell Remoting."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Enable-WACPSRemoting: Failed to configure PowerShell Remoting. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Sets WAC WinRM over HTTPS configuration.

.DESCRIPTION
    Sets WinRmOverHttps property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.
    
.PARAMETER Mode
    Enablement or disablement of WinRM over HTTPS.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACWinRmOverHttps -Enabled
#>
function Set-WACWinRmOverHttps {
    Param(
        [Parameter(Mandatory = $true)]
        [switch]$Enabled,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "FeatureParameters", "Base", "WinRmOverHttps" -Value ($Enabled -eq $true)
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACWinRmOverHttps: Successfully set WAC WinRM over HTTPS configuration."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACWinRmOverHttps: Failed to set WAC WinRM over HTTPS configuration. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC WinRM over HTTPS setting.

.DESCRIPTION
    Gets WinRmOverHttps property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACWinRmOverHttps
#>
function Get-WACWinRmOverHttps {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "FeatureParameters", "Base", "WinRmOverHttps"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACWinRmOverHttps: Successfully retrieved WAC WinRM over HTTPS settings."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC software update mode.

.DESCRIPTION
    Sets the SoftwareUpdate property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.
    
.PARAMETER Mode
    The mode of software update, such as Automatic, Manual, or Notification.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACSoftwareUpdateMode -Mode Automatic
#>
function Set-WACSoftwareUpdateMode {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Automatic', 'Manual', 'Notification')]
        [string]$Mode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "SoftwareUpdate" -Value $Mode
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACSoftwareUpdateMode: Successfully set WAC software update mode."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACSoftwareUpdateMode: Failed to set WAC software update mode. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC software update mode.

.DESCRIPTION
    Gets the SoftwareUpdate property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACSoftwareUpdateMode
#>
function Get-WACSoftwareUpdateMode {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "SoftwareUpdate"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACSoftwareUpdateMode: Successfully retrieved WAC software update mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC telemetry privacy mode.

.DESCRIPTION
    Sets the TelemetryPrivacy property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.
    
.PARAMETER Mode
    The mode of telemetry privacy. Can be set to required or optional.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACTelemetryPrivacy -Mode Required
#>
function Set-WACTelemetryPrivacy {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Required', 'Optional')]
        [string]$Mode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "TelemetryPrivacy" -Value $Mode
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACTelemetryPrivacy: Successfully set WAC telemetry privacy mode."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACTelemetryPrivacy: Failed to set WAC telemetry privacy mode. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC telemetry privacy mode.

.DESCRIPTION
    Gets the TelemetryPrivacy property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACTelemetryPrivacy
#>
function Get-WACTelemetryPrivacy {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "TelemetryPrivacy"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACTelemetryPrivacy: Successfully retrieved WAC telemetry privacy mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC runtime mode.

.DESCRIPTION
    Sets the RuntimeMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER Mode
    The mode of runtime, such as Desktop, NonStandardService, or Service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACRuntimeMode -Mode Service
#>
function Set-WACRuntimeMode {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Desktop', 'NonStandardService', 'Service')]
        [string]$Mode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "RuntimeMode" -Value $Mode
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACRuntimeMode: Successfully set WAC runtime mode."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACRuntimeMode: Failed to set WAC runtime mode. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC runtime mode.

.DESCRIPTION
    Gets the RuntimeMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACRuntimeMode
#>
function Get-WACRuntimeMode {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "RuntimeMode"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACRuntimeMode: Successfully retrieved WAC runtime mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC installation type.

.DESCRIPTION
    Sets the InstallationType property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER InstallationType
    The installation type, such as Standard, or AzureVmExtension.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACInstallationType -InstallationType Standard
#>
function Set-WACInstallationType {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Standard', 'AzureVmExtension')]
        [string]$InstallationType,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "InstallationType" -Value $InstallationType
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACInstallationType: Successfully set WAC installation type."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACInstallationType: Failed to set WAC installation type. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC installation type.

.DESCRIPTION
    Gets the InstallationType property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACInstallationType
#>
function Get-WACInstallationType {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "InstallationType"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACInstallationType: Successfully retrieved WAC installation type."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets WAC installation status.

.DESCRIPTION
    Checks if WAC is installed by checking the existence of appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACInstallationStatus
#>
function Get-WACInstallationStatus {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    if (Test-Path -Path (GetAppSettingsPath)) {
        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACInstallationStatus: WAC is installed."
        ExitWithErrorCode 0
        return $true;
    }
    else {
        Write-Log -Level INFO -ExitCode 1 -Message "Get-WACInstallationStatus: WAC is not installed."
        ExitWithErrorCode 1
        return $false;
    }
}

<#
.SYNOPSIS
    Sets WAC CSP frame ancestors.

.DESCRIPTION
    Sets the CSPFrameAncestors property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER CSPFrameAncestors
    The CSP frame ancestors.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACCSPFrameAncestors -CSPFrameAncestors @("https://www.contoso.com", "https://www.fabrikam.com")
#>
function Set-WACCSPFrameAncestors {
    Param(
        [Parameter(Mandatory = $true)]
        [string[]]$CSPFrameAncestors,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors" -Value $CSPFrameAncestors
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACCSPFrameAncestors: Successfully set WAC CSP frame ancestors."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACCSPFrameAncestors: Failed to set WAC CSP frame ancestors. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC CSP frame ancestors.

.DESCRIPTION
    Gets the CSPFrameAncestors property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACCSPFrameAncestors
#>
function Get-WACCSPFrameAncestors {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACCSPFrameAncestors: Successfully retrieved WAC CSP frame ancestors."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC CORS sites.

.DESCRIPTION
    Sets the CorsSites property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER CorsSites
    The CORS sites.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACCorsSites -CorsSites @("https://www.contoso.com", "https://www.fabrikam.com")
#>
function Set-WACCorsSites {
    Param(
        [Parameter(Mandatory = $true)]
        [string[]]$CorsSites,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "CorsSites" -Value $CorsSites
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACCorsSites: Successfully set WAC CORS sites."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACCorsSites: Failed to set WAC CORS sites. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC CORS sites.

.DESCRIPTION
    Gets the CorsSites property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACCorsSites
#>
function Get-WACCorsSites {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Http", "CorsSites"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACCorsSites: Successfully retrieved WAC CORS sites."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC login mode.

.DESCRIPTION
    Sets the TokenAuthenticationMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER Mode
    The mode of login, such as FormLogin, WindowsAuthentication, or AadSso.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACLoginMode -Mode FormLogin
#>
function Set-WACLoginMode {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('FormLogin', 'WindowsAuthentication', 'AadSso')]
        [string]$Mode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "TokenAuthenticationMode" -Value $Mode
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACLoginMode: Successfully set WAC login mode."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACLoginMode: Failed to set WAC login mode. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC login mode.

.DESCRIPTION
    Gets the TokenAuthenticationMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACLoginMode
#>
function Get-WACLoginMode {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "TokenAuthenticationMode"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACLoginMode: Successfully retrieved WAC login mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC Operation mode.

.DESCRIPTION
    Sets the OperationMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER OperationMode
    Operation mode either 'Production' or 'Development'.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACOperationMode -Mode Development
#>
function Set-WACOperationMode {
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Production', 'Development')]
        [string]$Mode,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "OperationMode" -Value $Mode
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACOperationMode: Successfully updated WAC operation mode: $Mode."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACOperationMode: Failed to set WAC operation mode. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC Operation mode.

.DESCRIPTION
    Gets the OperationMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACOperationMode
#>
function Get-WACOperationMode {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "OperationMode"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACOperationMode: Successfully retrieved WAC operation mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Add WAC sideload site.

.DESCRIPTION
    Add a sideload site in appsettings.json under %ProgramFiles%\WindowsAdminCenter for UX debugging.

.PARAMETER Site
    URL of sideload site. The site will be added into the CSPFrameAncestors and CorsSite lists if not found.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Add-WACSideloadSite -Site "https://localhost:4200"
#>
function Add-WACSideloadSite {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Site,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $testUri = [System.Uri]$Site
        if ($testUri.Scheme -ne "https") {
            throw "Must use valid URL."
        }

        $appSettingsPath = GetAppSettingsPath
        $cspFrameAncestors = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors"
        $newCspFrameAncestors = @()
        $found = $false
        foreach ($item in @($cspFrameAncestors)) {
            $newCspFrameAncestors += $item
            if ($item -ieq $Site) {
                $found = $true
            }
        }

        if (-not $found) {
            $newCspFrameAncestors += $Site.ToString()
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors" -Value @($newCspFrameAncestors)
        }
        
        $corsSites = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CorsSites"
        $newCorsSites = @()
        $found = $false
        foreach ($item in @($corsSites)) {
            $newCorsSites += $item
            if ($item -ieq $Site) {
                $found = $true
            }
        }

        if (-not $found) {
            $newCorsSites += $Site.ToString()
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CorsSites" -Value @($newCorsSites)
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Add-WACSideloadSite: Successfully added WAC sideload site: $Site."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Add-WACSideloadSite: Failed to added WAC sideload site. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Remove WAC sideload site.

.DESCRIPTION
    Add a sideload in appsettings.json under %ProgramFiles%\WindowsAdminCenter for UX debugging.

.PARAMETER Site
    URL of site. The site will be added into the CSPFrameAncestors and CorsSite lists.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Remove-WACSideLoadSite -Site "https://localhost:4200"
#>
function Remove-WACSideLoadSite {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Site,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $appSettingsPath = GetAppSettingsPath
        $cspFrameAncestors = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors"
        $newCspFrameAncestors = @()
        foreach ($item in @($cspFrameAncestors)) {
            if (-not ($item -ieq $Site)) {
                $newCspFrameAncestors += $item
            }
        }
        
        UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors" -Value @($newCspFrameAncestors)
        $corsSites = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CorsSites"
        $newCorsSites = @()
        foreach ($item in @($corsSites)) {
            if (-not ($item -ieq $Site)) {
                $newCorsSites += $item
            }
        }

        UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CorsSites" -Value @($newCorsSites)
        Write-Log -Level INFO -ExitCode 0 -Message "Remove-WACSideLoadSite: Successfully removed WAC sideload site: $Site."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Remove-WACSideLoadSite: Failed to remove WAC sideload site. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Get WAC sideload site.

.DESCRIPTION
    Get current setting of sideloading in appsettings.json under %ProgramFiles%\WindowsAdminCenter for UX debugging.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACSideloadSite
#>
function Get-WACSideloadSite {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $appSettingsPath = GetAppSettingsPath
        $cspFrameAncestors = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CSPFrameAncestors"
        foreach ($item in @($cspFrameAncestors)) {
            @{ "CSPFrameAncestors" = $item }
        }
        
        $corsSites = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "CorsSites"
        foreach ($item in @($corsSites)) {
            @{ "CorsSite" = $item }
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Get-WACSideloadSite: Successfully got WAC sideload site."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACSideloadSite: Failed to get WAC sideload site. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC Operation mode.

.DESCRIPTION
    Gets the OperationMode property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACOperationMode
#>
function Get-WACOperationMode {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "OperationMode"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACOperationMode: Successfully retrieved WAC operation mode."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC HTTPS port range and service port numbers.

.DESCRIPTION
    Modifies the Url property in appsettings.json under %ProgramFiles%\WindowsAdminCenter to use the specified WacPort
    and sets the ServicePortRange property in appsettings.json to the values of ServicePortRangeStart and ServicePortRangeEnd.
    Throws an error if the provided port range is invalid.

.PARAMETER WacPort
    The port number of HTTPS for opening WAC in the browser.

.PARAMETER ServicePortRangeStart
    The start port number of HTTPS port range for internal WAC services.

.PARAMETER ServicePortRangeEnd
    The end port number of HTTPS port range for internal WAC services.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACHttpsPorts -WacPort 443 -ServicePortRangeStart 444 -ServicePortRangeEnd 446
#>
function Set-WACHttpsPorts {
    Param(
        [Parameter(Mandatory = $true)]
        [int]$WacPort,
        [int]$ServicePortRangeStart,
        [int]$ServicePortRangeEnd,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $appSettingsPath = GetAppSettingsPath
        UpdateJsonField -Path $appSettingsPath -Sections "Kestrel", "Endpoints", "WindowsAdminCenter", "Url" -Value "https://*:$WacPort"
        UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "HttpSysUrls" -Value @("https://+:$WacPort")
        if ($ServicePortRangeStart -and $ServicePortRangeEnd) {
            if ($ServicePortRangeStart -ge $ServicePortRangeEnd) {
                Write-Error "Failed to set WAC HTTPS ports. Error: ServicePortRangeStart must be less than ServicePortRangeEnd."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: ServicePortRangeStart must be less than ServicePortRangeEnd."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
            if ($ServicePortRangeStart -le $WacPort -and $WacPort -le $ServicePortRangeEnd) {
                Write-Error "Failed to set WAC HTTPS ports. Error: WacPort must be outside of ServicePortRangeStart and ServicePortRangeEnd."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: WacPort must be outside of ServicePortRangeStart and ServicePortRangeEnd."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
            if (($ServicePortRangeEnd - $ServicePortRangeStart) -lt 2) {
                Write-Error "Failed to set WAC HTTPS ports. Error: Port range size must be greater than 3."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: Port range size must be greater than 3."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
            if (($ServicePortRangeStart -eq $WacPort) -or ($ServicePortRangeEnd -eq $WacPort)) {
                Write-Error "Failed to set WAC HTTPS ports. Error: ServicePortRangeStart and ServicePortRangeEnd must be different from WacPort."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: ServicePortRangeStart and ServicePortRangeEnd must be different from WacPort."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
        }
        if ($ServicePortRangeStart) {
            if ($ServicePortRangeStart -eq $WacPort) {
                Write-Error "Failed to set WAC HTTPS ports. Error: ServicePortRangeStart must be different from WacPort."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: ServicePortRangeStart must be different from WacPort."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "ServicePortRange", "Start" -Value $ServicePortRangeStart
            # Set WinREST and WinStream ports
            $endpoint = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Services", 0, "Endpoint"
            $uri = New-Object System.Uri -ArgumentList $endpoint
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Services", 0, "Endpoint" -Value "https://$($uri.Host):$ServicePortRangeStart"
            $endpoint = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Services", 1, "Endpoint"
            $uri = New-Object System.Uri -ArgumentList $endpoint
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Services", 1, "Endpoint" -Value "https://$($uri.Host):$($ServicePortRangeStart + 1)"
        }
        if ($ServicePortRangeEnd) {
            if ($ServicePortRangeEnd -eq $WacPort) {
                Write-Error "Failed to set WAC HTTPS ports. Error: ServicePortRangeEnd must be different from WacPort."
                $errorMessage = "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: ServicePortRangeEnd must be different from WacPort."
                Write-Log -Level ERROR -ExitCode 1 -Message $errorMessage
                ExitWithErrorCode 1
                throw $errorMessage
            }
            UpdateJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "ServicePortRange", "End" -Value $ServicePortRangeEnd
        }
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACHttpsPorts: Successfully set WAC HTTPS ports."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACHttpsPorts: Failed to set WAC HTTPS ports. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC HTTPS Core service port and port range start and end for other services (e.g. WinREST and WinStream).

.DESCRIPTION
    Gets the WacPort from the Url property in appsettings.json under %ProgramFiles%\WindowsAdminCenter
    and gets the Start and End values of the ServicePortRange property in appsettings.json.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACHttpsPorts
#>
function Get-WACHttpsPorts {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    $wacPort = (GetJsonField -Path  (GetAppSettingsPath) -Sections "Kestrel", "Endpoints", "WindowsAdminCenter", "Url").Split(":")[-1]
    $rangeStart = GetJsonField -Path  (GetAppSettingsPath) -Sections "WindowsAdminCenter", "ServicePortRange", "Start"
    $rangeEnd = GetJsonField -Path  (GetAppSettingsPath) -Sections "WindowsAdminCenter", "ServicePortRange", "End"
    @{ WacPort = $wacPort; ServicePortRangeStart = $rangeStart; ServicePortRangeEnd = $rangeEnd; }
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACHttpsPorts: Successfully retrieved WAC HTTPS ports."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC certificate subject name for the endpoints. The certificate must be identifiable by the subject name.

.DESCRIPTION
    Sets the Subject property of the Certificate property in appsettings.json under %ProgramFiles%\WindowsAdminCenter to the given subject name, or that of the certificiate identified by the given thumbprint.
    If neither the subject name or thumbprint parameters are provided, the self-signed certificate subject name will be used.

.PARAMETER SubjectName
    The subject name of the certificate.

.PARAMETER Thumbprint
    The thumbprint of the certificate.

.PARAMETER Target
    The target of the certificate subject name. Can be set to All, FrontEnd, or Service.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACCertificateSubjectName

.EXAMPLE
    Set-WACCertificateSubjectName -SubjectName "CN=contoso.com"

.EXAMPLE
    Set-WACCertificateSubjectName -SubjectName "contoso.com"

.EXAMPLE
    Set-WACCertificateSubjectName -Thumbprint "1234567890abcdef1234567890abcdef12345678"
#>
function Set-WACCertificateSubjectName {
    Param(
        [Parameter(Mandatory = $false)]
        [string]$SubjectName,
        [Parameter(Mandatory = $false)]
        [string]$Thumbprint,
        [ValidateSet('All', 'FrontEnd', 'Service')]
        [Parameter(Mandatory = $false)]
        [string]$Target = 'All',
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        if ([string]::IsNullOrWhiteSpace($SubjectName) -and [string]::IsNullOrWhiteSpace($Thumbprint)) {
            $SubjectName = $ConstSSLCertificateSubjectName
        }

        if (-not [string]::IsNullOrWhiteSpace($Thumbprint)) {
            $cert = Get-Item Cert:\LocalMachine\My\$Thumbprint
            $SubjectName = $cert.Subject

            if ($SubjectName.StartsWith("CN=")) {
                $SubjectName = ($SubjectName -split "=")[1]
            }

            $SubjectName = ($SubjectName -split ", ")[0]
        }

        if ($Target -eq 'FrontEnd' -or $Target -eq 'All') {
            UpdateJsonField -Path  (GetAppSettingsPath) -Sections "Kestrel", "Endpoints", "WindowsAdminCenter", "Certificate", "Subject" -Value $SubjectName
            Write-Log -Level INFO -ExitCode 0 -Message "The certificate subject name for the front-end endpoint has been set to $SubjectName."
        }

        if ($Target -eq 'Service' -or $Target -eq 'All') {
            UpdateJsonField -Path  (GetAppSettingsPath) -Sections "WindowsAdminCenter", "ServiceCertificate", "Subject" -Value $SubjectName
            Write-Log -Level INFO -ExitCode 0 -Message "The certificate subject name for the service endpoint has been set to $SubjectName."
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACCertificateSubjectName: Successfully set WAC certificate subject name."
        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACCertificateSubjectName: Failed to set WAC certificate subject name. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets WAC certificate subject name when using Form Login. The certificate must be identifiable by the subject name.

.DESCRIPTION
    Gets the value of the Subject property under the Certificate property in appsettings.json under %ProgramFiles%\WindowsAdminCenter.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACCertificateSubjectName
#>
function Get-WACCertificateSubjectName {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    GetJsonField -Path (GetAppSettingsPath) -Sections "Kestrel", "Endpoints", "WindowsAdminCenter", "Certificate", "Subject"
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACCertificateSubjectName: Successfully retrieved WAC certificate subject name."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC certificate access control list.

.DESCRIPTION
    Modifies the access control list of the certificate identified by the given subject name to grant full control permissions to the Network Service account.
    If no subject name is provided, the subject name from the appsettings.json file under %ProgramFiles%\WindowsAdminCenter will be used.

.PARAMETER SubjectName
    The subject name of the certificate.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACCertificateAcl

.EXAMPLE
    Set-WACCertificateAcl -SubjectName "CN=contoso.com"

.EXAMPLE
    Set-WACCertificateAcl -SubjectName "contoso.com"
#>
function Set-WACCertificateAcl {
    Param(
        [Parameter(Mandatory = $false)]
        [string]$SubjectName,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        if ([string]::IsNullOrWhiteSpace($SubjectName)) {
            $SubjectName = GetJsonField -Path (GetAppSettingsPath) -Sections "Kestrel", "Endpoints", "WindowsAdminCenter", "Certificate", "Subject"
        }

        if (-not $SubjectName.StartsWith("CN=")) {
            $SubjectName = "CN=$SubjectName"
        }

        $cert = Get-ChildItem Cert:LocalMachine\My\* | Where-Object { ($_.Subject -split ", ")[0] -eq $SubjectName }
        if ($cert -is [array] -and $cert.Count -gt 0) {
            $cert = $cert[0]
        }

        $keyName = $cert.PrivateKey.CspKeyContainerInfo.UniqueKeyContainerName
        $machineKeyPath = [IO.Path]::Combine($ConstMachineKeyRootPath, $keyName)

        if (($null -ne $keyName) -and (Test-Path -Path $machineKeyPath)) {
            $acl = Get-Acl -Path $machineKeyPath
            $networkServiceSid = New-Object System.Security.Principal.SecurityIdentifier -ArgumentList $ConstNetworkServiceSid
            $rule = New-Object System.Security.AccessControl.FileSystemAccessRule $networkServiceSid, $ConstFullControlPermissions, allow
            $acl.AddAccessRule($rule)

            Set-Acl -Path $machineKeyPath -AclObject $acl
            Write-Log -Level INFO -ExitCode 0 -Message "Set-WACCertificateAcl: Successfully set WAC certificate access control list."
        }
        else {
            Write-Log -Level INFO -ExitCode 0 -Message "Set-WACCertificateAcl: Unable to find machine key path for certificate. Skipping setting access control list."
        }

        ExitWithErrorCode 0
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACCertificateAcl: Failed to set WAC certificate access control list. Error: $_"
        ExitWithErrorCode 1
        throw
    }
}

<#
.SYNOPSIS
    Gets the firewall rule of Windows Admin Center external endpoint.

.DESCRIPTION
    Gets the firewall rule of Windows Admin Center external endpoint.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACFirewallRule
#>
function Get-WACFirewallRule {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $policy = New-Object -ComObject HNetCfg.FwPolicy2
        foreach ($rule in $policy.Rules) {
            if ($rule.Name -ieq $ConstInboundOpenException) {
                $rule
                Write-Log -Level INFO -ExitCode 0 -Message "Get-WACFirewallRule: Successfully retrieved WAC firewall rule."
                ExitWithErrorCode 0
                return
            }
        }
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACFirewallRule: Failed to get WAC firewall rule. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACFirewallRule: WAC firewall rule does not exist."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Removes the firewall rule of Windows Admin Center.

.DESCRIPTION
    Removes the firewall rule of Windows Admin Center, if it exits.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACFirewallRule
#>
function Unregister-WACFirewallRule {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $policy = New-Object -ComObject HNetCfg.FwPolicy2
        $remove = $null
        foreach ($rule in $policy.Rules) {
            if ($rule.Name -ieq $ConstInboundOpenException) {
                $remove = $rule
                break;
            }
        }

        if ($null -ne $remove) {
            $policy.Rules.Remove($remove.Name);
        }
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Unregister-WACFirewallRule: Failed to remove WAC firewall rule. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACFirewallRule: Successfully removed WAC firewall rule."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Creates new firewall rule for Windows Admin Center.

.DESCRIPTION
    Creates new firewall rule for Windows Admin Center to enable remote access to WAC from the browser.

.PARAMETER Port
    The port number of HTTPS connection. Default port number is 6600.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACFirewallRule

.EXAMPLE
    Register-WACFirewallRule -Port 6600
#>
function Register-WACFirewallRule {
    Param(
        [Parameter(Mandatory = $false)]
        [int]$Port = $ConstDefaultPort,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    # https://learn.microsoft.com/en-us/windows/win32/api/icftypes/ne-icftypes-net_fw_action
    $NET_FW_ACTION_ALLOW = 1
    # https://learn.microsoft.com/en-us/windows/win32/api/icftypes/ne-icftypes-net_fw_ip_protocol
    $NET_FW_IP_PROTOCOL_TCP = [int]6
    # https://learn.microsoft.com/en-us/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2
    # Private | Domain | Public
    $NET_FW_PROFILE2_ALL = 7
    
    try {
        Unregister-WACFirewallRule -ExitWithErrorCode:$false
        SetExitWithErrorCode $ExitWithErrorCode
        $rule = New-Object -ComObject HNetCfg.FwRule
        $rule.Name = $ConstInboundOpenException
        $rule.Enabled = $true
        $rule.Action = $NET_FW_ACTION_ALLOW
        $rule.Protocol = $NET_FW_IP_PROTOCOL_TCP
        $rule.LocalPorts = $Port.ToString()
        $rule.Profiles = $NET_FW_PROFILE2_ALL
        $policy = New-Object -ComObject HNetCfg.FwPolicy2
        $policy.Rules.Add($rule)
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Register-WACFirewallRule: Failed to create WAC firewall rule. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACFirewallRule: Successfully created WAC firewall rule."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets WAC WinRM Trusted Hosts mode.

.DESCRIPTION
    Sets WinRM TrustedHosts property to '*' when TrustAll is specified, otherwise sets TrustedHosts property to empty.

.PARAMETER TrustAll
    Make any hosts trusted when using WinRM protocols, such as PowerShell remoting and CIM session.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACWinRmTrustedHosts -TrustAll

.EXAMPLE
    Set-WACWinRmTrustedHosts
#>
function Set-WACWinRmTrustedHosts {
    Param(
        [switch]$TrustAll,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        if ($TrustAll) {
            Set-Item WSMan:\localhost\Client\TrustedHosts -Value '*' -Force
            Write-Log -Level INFO -ExitCode 0 -Message "Set-WACWinRmTrustedHosts: Successfully set TrustedHosts to *."
            ExitWithErrorCode 0
            return
        }

        Set-Item WSMan:\localhost\Client\TrustedHosts -Value '' -Force
        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACWinRmTrustedHosts: Successfully set TrustedHosts to empty."
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACWinRmTrustedHosts: Failed to set TrustedHosts. Error: $_"
        ExitWithErrorCode 1
        return
    }

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets WAC WinRM Trusted Hosts settings.

.DESCRIPTION
    Gets the WinRM client configuration including TrustedHosts property.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACWinRmTrustedHosts
#>
function Get-WACWinRmTrustedHosts {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    Get-Item WSMan:\localhost\Client\TrustedHosts
    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACWinRmTrustedHosts: Successfully got TrustedHosts settings."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets Local CredSSP configuration instance.

.DESCRIPTION
    Gets the PowerShell session configuration instance for Local CredSSP.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Get-WACLocalCredSSP
#>
function Get-WACLocalCredSSP {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        Get-PSSessionConfiguration -Name $ConstCredSspName -ErrorAction Stop
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Get-WACLocalCredSSP: Failed to get WAC local CredSSP configuration instance. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Get-WACLocalCredSSP: Successfully got WAC local CredSSP configuration instance."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Unregisters Local CredSSP configuration instance.

.DESCRIPTION
    Unregisters the PowerShell session configuration instance for Local CredSSP.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Unregister-WACLocalCredSSP
#>
function Unregister-WACLocalCredSSP {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode
    try {
        $configuration = Get-PSSessionConfiguration -Name $ConstCredSspName
        Unregister-PSSessionConfiguration -Name $configuration.Name
        $group = Get-LocalGroup -Name $ConstCredSspGroupName -ErrorAction SilentlyContinue
        if ($group) {
            Remove-LocalGroup -Name $ConstCredSspGroupName
        }

        $credSspPath = GetCredSspPath
        if (Test-Path -Path $credSspPath) {
            Remove-Item -Path $credSspPath -Recurse -Force -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null
        }

        $policyPath = GetConstPolicyPath
        if (Test-Path -Path $policyPath) {
            Remove-Item -Path $policyPath -Recurse -Force -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null
        }
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Unregister-WACLocalCredSSP: Failed to unregister WAC local CredSSP configuration instance. Error: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Unregister-WACLocalCredSSP: Successfully unregistered WAC local CredSSP configuration instance."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Registers Local CredSSP configuration instance.

.DESCRIPTION
    Unregisters old PowerShell session configuration instance for CredSSP if it exists, and then registers new instance.

.PARAMETER NoWinRmServiceRestart
    Don't restart WinRM service after the configuration.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACLocalCredSSP

.EXAMPLE
    Register-WACLocalCredSSP -NoWinRmServiceRestart
#>
function Register-WACLocalCredSSP {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$NoWinRmServiceRestart,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    try {
        # 0 create local group
        $group = Get-LocalGroup -Name $ConstCredSspGroupName -ErrorAction SilentlyContinue
        if ($group) {
            Remove-LocalGroup -Name $ConstCredSspGroupName
        }

        New-LocalGroup -Name $ConstCredSspGroupName -Description $ConstCredSspGroupDescription
        $user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $userName = $user.Name
        Add-LocalGroupMember -Group $ConstCredSspGroupName -Member $userName

        # 1 remove old one if exists.
        $existing = Get-PSSessionConfiguration -Name $ConstCredSspName -ErrorAction SilentlyContinue
        if ($existing) {
            Unregister-PSSessionConfiguration -Name $ConstCredSspName -Force -WarningAction SilentlyContinue -ErrorAction Stop
        }

        # 2 configure CredSSP script module (Msft.Sme.Shell).
        # 2a refresh CredSSP folder content.
        $credSspPath = GetCredSspPath
        if (Test-Path -Path $credSspPath) {
            Remove-Item -Path $credSspPath -Recurse -Force -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null
        }
        
        New-Item -Path $credSspPath -ItemType Directory | Out-Null
        Copy-Item -Recurse -Path (Join-Path -Path (GetUxPowerShellModulePath) -ChildPath "*") -Destination $credSspPath | Out-Null

        # 2b import the signer certificate(s) into the TrustedPublisher store.
        $moduleFiles = Get-ChildItem -Path $credSspPath -Include @('*.psm1', '*.psd1') -Recurse
        $importedThumbprints = @{}
        foreach ($moduleFile in $moduleFiles) {
            $moduleAuthenticodeSignature = Get-AuthenticodeSignature -FilePath $moduleFile.FullName
            if ($moduleAuthenticodeSignature.Status -ne "Valid") {
                continue
            }

            if (-not $importedThumbprints.Contains($moduleAuthenticodeSignature.SignerCertificate.Thumbprint) -and
                -not (Test-Path -Path (Join-Path -Path 'Cert:\LocalMachine\TrustedPublisher' -ChildPath $moduleAuthenticodeSignature.SignerCertificate.Thumbprint))) {
                $store = New-Object System.Security.Cryptography.X509Certificates.X509Store -ArgumentList ([System.Security.Cryptography.X509Certificates.StoreName]::TrustedPublisher),
                    ([System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine)
                $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite -bor [System.Security.Cryptography.X509Certificates.OpenFlags]::MaxAllowed)
                $store.Add($moduleAuthenticodeSignature.SignerCertificate)
                $store.Close()
            }
        }
        if ($null -ne $store) {
            $store.Dispose()
            $store = $null
        }
    
        # 3 creates role capabilities settings file (.psrc).
        $allowed = @(
            "$ConstShellModuleName\Enable-WACSHCredSSPClientRole",
            "$ConstShellModuleName\Get-WACSHCredSSPClientRole",
            "$ConstShellModuleName\Disable-WACSHCredSspClientRole",
            "$ConstShellModuleName\Test-WACSHCredSsp",
            "$ConstShellModuleName\Get-WACSHCredSspClientConfigurationOnGateway",
            "$ConstShellModuleName\Get-WACSHCredSspManagedServer"
        )
        $contentPsrc = "@{GUID='$((New-Guid).Guid)';VisibleFunctions='$([string]::Join("','", $allowed))';}";
        if (Test-Path -Path $ConstPolicyFolderPath) {
            Remove-Item -Path $ConstPolicyFolderPath -Recurse -Force -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null
        }

        New-Item -Path $ConstPolicyFolderPath -ItemType Directory | Out-Null
        New-Item -Path (Join-Path $ConstPolicyFolderPath $ConstRoleCapabilities) -ItemType Directory | Out-Null
        $contentPsrc | Set-Content -Path (Join-Path $ConstPolicyFolderPath "$($ConstRoleCapabilities)\$($ConstCredSspAdmin).psrc") -Force

        # 4 define endpoint settings.
        $psscPath = [System.IO.Path]::GetTempFileName().Replace(".tmp", ".pssc")
        $machineName = [System.Environment]::MachineName
        $networkService = (new-object System.Security.Principal.SecurityIdentifier([System.Security.Principal.WellKnownSidType]::NetworkServiceSid, $null)).Translate([System.Security.Principal.NTAccount])
        $configuration = @{
            Path                 = $psscPath
            SessionType          = 'RestrictedRemoteServer'
            SchemaVersion        = '2.0.0.0'
            GUID                 = (new-Guid).Guid
            RunAsVirtualAccount  = $True
            RoleDefinitions      = @{
                $userName                             = @{RoleCapabilities = $ConstCredSspRoleName }
                $networkService.Value                 = @{RoleCapabilities = $ConstCredSspRoleName }
                "$machineName\$ConstCredSspGroupName" = @{RoleCapabilities = $ConstCredSspRoleName }
            }
            EnvironmentVariables = @{PSModulePath = "$credSspPath;$($Env:PSModulePath)" }
            ExecutionPolicy      = 'AllSigned'
        }

        # 4a Create the configuration file
        New-PSSessionConfigurationFile @configuration
        Register-PSSessionConfiguration -Name $ConstCredSspName -Path $psscPath -NoServiceRestart:$NoWinRmServiceRestart -Force -WarningAction SilentlyContinue -ErrorAction Stop

        # 4b Enable PowerShell logging on the system
        $basePath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        if (-not (Test-Path $basePath)) {
            $null = New-Item $basePath -Force
        }

        Set-ItemProperty $basePath -Name EnableScriptBlockLogging -Value 1 -ErrorAction Stop
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Register-WACLocalCredSSP: Failed to register CredSSP session configuration."
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Register-WACLocalCredSSP: Successfully registered CredSSP session configuration."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Imports previously installed extensions into WAC.

.DESCRIPTION
    Imports previously installed extensions into WAC from the extensions folder.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Import-WACExistingExtensions
#>
function Import-WACExistingExtensions {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    function RemoveRange {
        Param(
            [System.Collections.Generic.List[PSCustomObject]]$RemoveList,
            [string]$ExtensionsConfigFilePath,
            [PSCustomObject]$ExtensionsConfig
        )
        $extensions = [System.Collections.Generic.List[PSCustomObject]]$ExtensionsConfig.Extensions
    
        foreach ($extension in $RemoveList) {
            $matchingExtensionIndex = $extensions.FindIndex({ param($x) $x.Id -eq $extension.Id -and $x.Version -eq $extension.Version })
            if ($matchingExtensionIndex -ne -1) {
                $extensions.RemoveAt($matchingExtensionIndex)
            }
        }
    
        $ExtensionsConfig.Extensions = $extensions.ToArray()
        $ExtensionsConfig | ConvertTo-Json -Depth 100 | Set-Content -Path $ExtensionsConfigFilePath -ErrorAction Stop
    }

    $extensionsPath = GetExtensionsPath
    $extensionsConfigFilePath = Join-Path $extensionsPath $ConstExtensionsConfigFileName
    if (-not (Test-Path -Path $extensionsConfigFilePath)) {
        # Not an upgrade installation, no previously installed extensions to import.
        Write-Log -Level INFO -ExitCode 0 -Message "Import-WACExistingExtensions: No previously installed extensions to import."
        ExitWithErrorCode 0
        return
    }

    try {
        Add-Type -Path (Join-Path (GetServicePath) -ChildPath $ConstNuGetVersioningDllName)
        
        $defaultExtensions = GetPreInstalledExtensions
        $extensionsConfig = Get-Content -Path $extensionsConfigFilePath -Raw | ConvertFrom-Json
        $extensionsConfig.IsPreinstallDataPopulated = $false
        $removeList = @()

        foreach ($configuredExtension in $extensionsConfig.Extensions) {
            $configuredExtensionPath = Join-Path $extensionsPath -ChildPath "$($configuredExtension.Id).$($configuredExtension.Version)"
            $configuredExtensionPathExists = Test-Path -Path $configuredExtensionPath
            if (-not $configuredExtensionPathExists) {
                $removeList += $configuredExtension
                continue
            }

            if ($configuredExtension.IsPreInstalled) {
                # Remove pre-installed extensions that shipped with the older gateway.
                if ($configuredExtensionPathExists) {
                    Remove-Item $configuredExtensionPath -Recurse
                }

                $removeList += $configuredExtension
                continue
            }

            if (($configuredExtension.Status -As [ExtensionStatus]) -eq [ExtensionStatus]::Installed) {
                if ($null -ne $defaultExtensions[$configuredExtension.Id] -and
                    [NuGet.Versioning.NuGetVersion]$configuredExtension.Version -le [NuGet.Versioning.NuGetVersion]$defaultExtensions[$configuredExtension.Id]) {
                    # Gateway ships with a newer version of the extension, remove the older version from the configuration.
                    $removeList += $configuredExtension
                    continue
                }

                # The extension installed from the feed is newer, remove the extension version that ships with the gateway.
                $configuredExtensionUxDirectory = Join-Path -Path (GetUxModulesPath) -ChildPath $configuredExtension.Id
                if (Test-Path -Path $configuredExtensionUxDirectory) {
                    Remove-Item $configuredExtensionUxDirectory -Recurse
                }
            }

            ConfigureCachedExtensions $configuredExtensionPath $configuredExtension
        }

        UpdateShellManifest
        RemoveRange $removeList $extensionsConfigFilePath $extensionsConfig
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Import-WACExistingExtensions: Failed to import previously installed extensions. Exception: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Import-WACExistingExtensions: Successfully imported previously installed extensions."
    ExitWithErrorCode 0
}

function UpdateShellManifest {
    $shellManifestPath = Join-Path (GetUxPath) $ConstExtensionManifestFileName
    $shellManifest = Get-Content -Path $shellManifestPath -Encoding UTF8 | ConvertFrom-Json
    $shellManifest.modules = @()
    foreach ($directory in Get-ChildItem -Path (GetUxModulesPath) -Directory) {
        $extensionManifestPath = Join-Path $directory.FullName $ConstExtensionManifestFileName
        $extensionManifest = Get-Content -Path $extensionManifestPath -Encoding UTF8 | ConvertFrom-Json
        $shellManifest.modules += $extensionManifest
    }

    $shellManifest | ConvertTo-Json -Depth 100 | Set-Content -Path $shellManifestPath -Encoding UTF8 -ErrorAction Stop
}

function GetPreInstalledExtensions {
    $preInstalledExtensions = @{}
    $modulesFolderPath = GetUxModulesPath
    if (Test-Path -Path $modulesFolderPath) {
        foreach ($directory in Get-ChildItem -Path $modulesFolderPath -Directory) {
            $extensionId = $directory.Name
            $manifestPath = Join-Path $directory.FullName $ConstExtensionManifestFileName
            $manifest = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
            $version = [NuGet.Versioning.NuGetVersion]$manifest.version

            $preInstalledExtensions.Add($extensionId, $version)
        }
    }

    return $preInstalledExtensions
}

function ConfigureCachedExtensions {
    Param(
        [string]$ConfiguredExtensionPath,
        [PSCustomObject]$ConfiguredExtension
    )

    $extensionUxPath = Join-Path $ConfiguredExtensionPath $ConstExtensionUxFolderName
    $extensionManifestPath = Join-Path $extensionUxPath $ConstExtensionManifestFileName
    if (-not (Test-Path -Path $extensionManifestPath)) {
        return
    }

    $manifest = Get-Content -Path $extensionManifestPath -Raw | ConvertFrom-Json
    $moduleName = $manifest.name
    if ($null -eq $manifest.version) {
        # Force update to extensions.config version information when manifest.json doesn't include version property.
        UpdateJsonField -Path $extensionManifestPath -Sections "version" -Value $ConfiguredExtension.Version
    }

    $extensionIndexPath = Join-Path $extensionUxPath $ConstExtensionIndexFileName
    if (Test-Path -Path $extensionIndexPath) {
        $indexContent = Get-Content -Path $extensionIndexPath -Raw
        $indexContent.Replace("<base href=`"/`">", "<base href=`"/modules/$($moduleName)/`">") | Set-Content -Path $extensionIndexPath
    }
    
    $extensionModulePath = Join-Path (GetUxModulesPath) $ConfiguredExtension.Id
    if (Test-Path -Path $extensionModulePath) {
        Remove-Item -Path $extensionModulePath -Recurse
        New-Item -Path $extensionModulePath -ItemType Directory
    }

    Copy-Item -Path $extensionUxPath -Destination $extensionModulePath -Recurse -Force -ErrorAction Stop

    $extensionPluginPath = Join-Path (GetPlugInsPath) "$($ConfiguredExtension.Id).$($ConfiguredExtension.Version)"
    if (Test-Path -Path $extensionPluginPath) {
        Remove-Item -Path $extensionPluginPath -Recurse
    }

    $extensionGatewayPath = Join-Path $ConfiguredExtensionPath $ConstExtensionGatewayFolderName
    if (Test-Path -Path $extensionGatewayPath) {
        New-Item -Path $extensionPluginPath -ItemType Directory -ErrorAction SilentlyContinue
        Copy-Item -Path "$extensionGatewayPath\*" -Destination $extensionPluginPath -Recurse -Force -ErrorAction Stop
    }
}

<#
.SYNOPSIS
    Imports previously installed plugins into WAC.

.DESCRIPTION
    Imports previously installed plugins into WAC from the plugins folder.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Import-WACExistingPlugins
#>
function Import-WACExistingPlugins {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $plugInsPath = GetPlugInsPath
    if (Test-Path -Path $plugInsPath) {
        $pluginDirectories = Get-ChildItem -Path $plugInsPath -Directory
    }

    if ($null -eq $pluginDirectories -or $pluginDirectories.Count -eq 0) {
        # Not an upgrade installation or no previously installed plugins to import.
        Write-Log -Level INFO -ExitCode 0 -Message "Import-WACExistingPlugins: No previously installed plugins to import."
        ExitWithErrorCode 0
        return
    }

    try {
        $appSettingsFilePath = GetAppSettingsPath
        $appSettings = Get-Content -Path $appSettingsFilePath -Raw | ConvertFrom-Json
        $services = [System.Collections.Generic.List[PSCustomObject]]$appSettings.WindowsAdminCenter.Services
        $features = [System.Collections.Generic.List[PSCustomObject]]$appSettings.WindowsAdminCenter.Features

        foreach ($directory in $pluginDirectories) {
            $settingsFilePath = Join-Path $directory.FullName $ConstExtensionSettingsFileName
            $settings = Get-Content -Path $settingsFilePath -Raw | ConvertFrom-Json
            if ($services.FindIndex({ param($service) $service.Name -eq $settings.Service.Name }) -eq -1) {
                $services.Add($settings.Service)
            }

            $settings.Feature.FullPath = $directory.FullName
            $features.Add($settings.Feature)
        }

        $port = [int]$appSettings.WindowsAdminCenter.ServicePortRange.Start
        $portRangeEnd = [int]$appSettings.WindowsAdminCenter.ServicePortRange.End
        foreach ($service in $services) {
            if ($port -ge $portRangeEnd) {
                throw "No available ports remaining in given port range."
            }

            $serviceEndpointSegments = $service.Endpoint -Split ':'
            $endpointHostName = "$($serviceEndpointSegments[0]):$($serviceEndpointSegments[1])"
            $service.Endpoint = "$($endpointHostName):$port"
            $port++
        }

        $appSettings.WindowsAdminCenter.Services = $services.ToArray()
        $appSettings.WindowsAdminCenter.Features = $features.ToArray()
        $appSettings | ConvertTo-Json -Depth 100 | Set-Content -Path $appSettingsFilePath -ErrorAction Stop
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Import-WACExistingPlugins: Failed to import previously installed plugins. Exception: $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Import-WACExistingPlugins: Successfully imported previously installed plugins."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Creates database for WAC if it doesn't exist and performs necessary migrations.

.DESCRIPTION
    Runs .NET Entity Framework bundle executable to create WAC database and/or perform necessary migrations.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Initialize-WACDatabase
#>
function Initialize-WACDatabase {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $efBundlePath = Join-Path (GetServicePath) $ConstEntityFrameworkBundleFileName

    Invoke-WACWinCommand -Command $efBundlePath -Parameters @()        

    Write-Log -Level INFO -ExitCode 0 -Message "Initialize-WACDatabase: Successfully initialized database."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Checks if the WAC installation failed.

.DESCRIPTION
    Checks if the WAC installation failed by checking the configuration log file.

.PARAMETER LogFilePath
    The path to the configuration log file.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Test-WACInstallationFailure -LogFilePath "C:\ProgramData\Windows Admin Center\Logs\Configuration.log"
#>
function Test-WACInstallationFailure {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$LogFilePath,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )
    SetExitWithErrorCode $ExitWithErrorCode
    $result = $False;
    foreach ($line in (Get-Content $LogFilePath)) {
        # Log format: "StampPart1 StampPart2 Level=Level ExitCode=ExitCode Message=Message"
        $exitCode = [int]$line.Split(" =")[5]
        $result = [int]($result -or $exitCode)
    }
    ExitWithErrorCode $result
}

<#
.SYNOPSIS
    Utility function to invoke a Windows command.
    (This command is Microsoft internal use only.)
    
.DESCRIPTION
    Invokes a Windows command and generates an exception if the command returns an error. Note: only for application commands. 

.PARAMETER Command
    The name of the command we want to invoke.

.PARAMETER Parameters
    The parameters we want to pass to the command.

.PARAMETER NoExit
    Don't exit even when it has an error to start the command.

.PARAMETER NoExit
    Return the object instead of simple string.

.EXAMPLE
    Invoke-WACWinCommand "netsh" "http delete sslcert ipport=0.0.0.0:9999"
#>
function Invoke-WACWinCommand {
    Param(
        [string]$Command, 
        [string[]]$Parameters,
        [switch]$NoExit,
        [switch]$ReturnObject
    )

    try {
        Write-Verbose "$command $([string]::Join(" ", $Parameters))"
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo
        $startInfo.FileName = $Command
        $startInfo.RedirectStandardError = $true
        $startInfo.RedirectStandardOutput = $true
        $startInfo.UseShellExecute = $false
        $startInfo.Arguments = [string]::Join(" ", $Parameters)
        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $startInfo
    }
    catch {
        Write-Error $_
        if (-not $NoExit) {
            Write-Log -Level ERROR -ExitCode 1 -Message "$($Command): Failed to initialize process during Invoke-WACWinCommand. Error - $_"
            ExitWithErrorCode 1
            throw
        }
    }

    try {
        $process.Start() | Out-Null
    }
    catch {
        Write-Error $_
        if (-not $NoExit) {
            Write-Log -Level ERROR -ExitCode 1 -Message "$($Command): Failed to start process during Invoke-WACWinCommand. Error - $_"
            ExitWithErrorCode 1
            throw
        }
    }

    try {
        $process.WaitForExit() | Out-Null
        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()
        $output = @{ StdOut = $stdout; StdErr = $stderr; ExitCode = $process.ExitCode; }
    } 
    catch {
        Write-Error $_
        if (-not $NoExit) {
            Write-Log -Level ERROR -ExitCode 1 -Message "$($Command): Failed to wait for process exit and capture output during Invoke-WACWinCommand. Error - $_"
            ExitWithErrorCode 1
            throw
        }
    }

    if ($process.ExitCode -ne 0) {
        Write-Error $_
        if (-not $NoExit) {
            Write-Log -Level ERROR -ExitCode $process.ExitCode -Message "$($Command): Failed during process execution started by Invoke-WACWinCommand. Process output - $($output.Stdout) $($output.StdErr)"
            ExitWithErrorCode $process.ExitCode
            throw $output.Stdout + "`r`n" + $output.StdErr
        }
    }

    # output all messages
    if ($ReturnObject) {
        return $output
    }

    return $output.Stdout + "`r`n" + $output.StdErr
}

<#
.SYNOPSIS
    Gets SID of current user Windows identity.

.DESCRIPTION
    Gets SID of current user Windows identity.

.EXAMPLE
    Get-WACCurrentWindowsIdentitySID
#>
function Get-WACCurrentWindowsIdentitySID {
    return [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
}

<#
.SYNOPSIS
    Add user SID to DACL of WAC service's security descriptor.

.DESCRIPTION
    Add user SID to DACL of WAC service's security descriptor to allow it to operate service through launcher without elevation.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Add-WACUserSIDToSecurityDescriptor -UserSID "S-1-5-21-3623811015-3361044348-30300820-1013"
#>
function Add-WACUserSIDToSecurityDescriptor {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$UserSID,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $saclPrefix = "S:"
        $defaultSecurityDescriptor = (Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdshow", $ConstServiceName -ReturnObject).StdOut.Trim()
        $securityDescriptorParts = $defaultSecurityDescriptor -Split $saclPrefix
        $dacl = $securityDescriptorParts[0]
        $sacl = $securityDescriptorParts[1]

        $wacServiceSecurityDescriptor = "$dacl(A;;RPWPCR;;;$UserSID)$saclPrefix$sacl"

        Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdset", $ConstServiceName, $wacServiceSecurityDescriptor
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Add-WACUserSIDToSecurityDescriptor: Failed to set user SID to service secirity descriptor. $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Add-WACUserSIDToSecurityDescriptor: Successfully set user SID to service secirity descriptor."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Sets security descriptor on service to allow current user to operate through launcher without elevation.

.DESCRIPTION
    Adds current user SID to DACL of WAC service's security descriptor to allow it to operate service through launcher without elevation.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Set-WACServiceSecurityDescriptor
#>
function Set-WACServiceSecurityDescriptor {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        $wacCurrentUserSID = Get-WACCurrentWindowsIdentitySID
        $wacServiceSecurityDescriptor = (Invoke-WACWinCommand -Command $ConstServiceController -Parameters "sdshow", $ConstServiceName -ReturnObject).StdOut.Trim()
        if (($wacServiceSecurityDescriptor -join "") -match $wacCurrentUserSID) {
            Write-Log -Level INFO -ExitCode 0 -Message "Set-WACServiceSecurityDescriptor: Current user SID is already in WAC service's security descriptor."
            ExitWithErrorCode 0
            return
        } else {
            Add-WACUserSIDToSecurityDescriptor -UserSID $wacCurrentUserSID
        }
    }
    catch {
        Write-Error $_
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACServiceSecurityDescriptor: Failed to set security descriptor. $_"
        ExitWithErrorCode 1
        throw
    }

    Write-Log -Level INFO -ExitCode 0 -Message "Set-WACServiceSecurityDescriptor: Successfully set security descriptor."
    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Tests the presence of the uninstaller key in the registry.

.DESCRIPTION
    Adds current user SID to DACL of WAC service's security descriptor to allow it to operate service through launcher without elevation.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Test-WACUninstallKey
#>
function Test-WACUninstallKey {
    [OutputType([Bool])]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $regKey = GetUninstallRegistryKey
    if (!!$regKey) {
        Write-Log -Level INFO -ExitCode 0 -Message "Test-WACUninstallKey: The WAC uninstall key was found."
        ExitWithErrorCode 0
        return $true
    } else {
        Write-Log -Level INFO -ExitCode 1 -Message "Test-WACUninstallKey: The WAC uninstall key was not found."
        ExitWithErrorCode 1
        return $false
    }
}

<#
.SYNOPSIS
    Registers the WAC-Configuration event log source in the Application log.

.DESCRIPTION
    Registers the WAC-Configuration event log source in the Application log.

.PARAMETER ExitWithErrorCode
    Exit the script with the error code. 0 is success, otherwise error.

.EXAMPLE
    Register-WACConfigurationEventLogSource
#>
function Register-WACConfigurationEventLogSource {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    try {
        if ([System.Diagnostics.EventLog]::SourceExists($ConstLogSourceWACConfiguration)) {
            Remove-EventLog -Source $ConstLogSourceWACConfiguration
        }
        New-EventLog -LogName $ConstApplicationEventLogName -Source $ConstLogSourceWACConfiguration
    }
    catch {
        Write-Log -Level ERROR -ExitCode 1 -Message "Register-WACConfigurationEventLogSource: Failed to register event log source. $_"
        ExitWithErrorCode 1
        Write-Error $_
    }

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Set and configure FQDN for Windows Admin Center.

.DESCRIPTION
    Set and configure FQDN for Windows Admin Center.

.PARAMETER EndpointFqdn
    The FQDN to be set for the frontend endpoint.

.PARAMETER ServiceFqdn
    The FQDN to be used for the service endpoint if different from the frontend endpoint.

.PARAMETER NoHosts
    Don't update the hosts file.

#>
function Set-WACEndpointFqdn {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$EndpointFqdn,
        [Parameter(Mandatory = $false)]
        [string]$ServiceFqdn = $null,
        [Parameter(Mandatory = $false)]
        [switch]$NoHosts,
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    function AdjustServiceFqdn([string]$ServiceFqdn) {
        if ([string]::IsNullOrEmpty($ServiceFqdn) -or $ServiceFqdn -ieq "localhost") {
            return
        }

        $hostname = [System.Net.Dns]::GetHostName()
        if ($hostname -ieq $ServiceFqdn) {
            Write-Log -Level INFO -ExitCode 0 -Message "Set-WACEndpointFqdn: Service FQDN is the same as hostname."
            return
        }
    
        try {
            $localFqdn = [System.Net.Dns]::GetHostEntry($hostname).HostName
            if ($localFqdn -ieq $ServiceFqdn) {
                Write-Log -Level INFO -ExitCode 0 -Message "Set-WACEndpointFqdn: Service FQDN is the same as local FQDN."
                return
            }
        }
        catch {
            # continue to validate.
        }

        Write-Log -Level INFO -ExitCode 0 -Message "Set-WACEndpointFqdn: Added Service FQDN to the hosts file."
        $path = "${env:windir}\system32\drivers\etc\hosts"
        $tag = "# Windows Admin Center Loopback"
        $loopbackAddress = "127.0.0.1"
        $newEntry = "$loopbackAddress    $ServiceFqdn    $tag"
        try {
            $acl = Get-Acl -Path $path
            $original = Get-Content -Path $path
            if ($null -eq $original -or $original.Length -eq 0) {
                Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACEndpointFqdn: Couldn't Read the hosts file or zero size."
                return
            }

            $content = $original | ForEach-Object {
                if (($_.IndexOf($ServiceFqdn, [System.StringComparison]::OrdinalIgnoreCase) -lt 0) -and (-not $_.Contains($tag))) { 
                    $_ 
                }
            }
            $content += $newEntry
            if (($content.Length -eq $original.Length) -or ($content.Length -eq $original.Length + 1)) {
                $tempPath = [System.IO.Path]::GetTempFileName()
                # check if calculated length is one more than original length.
                $content | Set-Content -Path $tempPath -Force
                $readContent = Get-Content -Path $tempPath
                if ($readContent.Length -eq $content.length) {
                    Move-Item -Path $tempPath -Destination $path -Force
                    Set-Acl -Path $path -AclObject $acl
                }
                else {
                    Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACEndpointFqdn: Couldn't write to the hosts file."
                }
            }
        }
        catch {
            throw
        }
    }

    if ([string]::IsNullOrEmpty($EndpointFqdn)) {
        Write-Log -Level ERROR -ExitCode 1 -Message "Set-WACEndpointFqdn: Endpoint Fqdn is empty."
        ExitWithErrorCode 1
    }

    if ([string]::IsNullOrEmpty($ServiceFqdn)) {
        $ServiceFqdn = $EndpointFqdn
    }

    if (-not $NoHosts) {
        AdjustServiceFqdn -ServiceFqdn $ServiceFqdn
    }
    
    $appSettingsPath = GetAppSettingsPath
    $json = Get-Content -Path $appSettingsPath -Raw -ErrorAction Stop | ConvertFrom-Json
    if ($null -eq $json.WindowsAdminCenter.Http.EndpointFqdn) {
        $json.WindowsAdminCenter.Http | Add-Member -NotePropertyName EndpointFqdn -NotePropertyValue $EndpointFqdn -Force
    }
    else {
        $json.WindowsAdminCenter.Http.EndpointFqdn = $EndpointFqdn
    }

    if ($null -eq $json.WindowsAdminCenter.Http.ServiceFqdn) {
        $json.WindowsAdminCenter.Http | Add-Member -NotePropertyName ServiceFqdn -NotePropertyValue $ServiceFqdn -Force
    }
    else {
        $json.WindowsAdminCenter.Http.ServiceFqdn = $ServiceFqdn
    }

    foreach ($service in $json.WindowsAdminCenter.Services) {
        $current = New-Object System.Uri -ArgumentList $service.Endpoint
        $service.Endpoint = "$($current.Scheme)://$($ServiceFqdn):$($current.Port)"
    }

    $proxySetting = $json.WindowsAdminCenter.Http.Proxy
    if ($null -ne $proxySetting -and -not [string]::IsNullOrEmpty($proxySetting.Address)) {
        $newBypassList = if ($null -ne $proxySetting.BypassList) { $proxySetting.BypassList + $ServiceFqdn | Sort-Object | Get-Unique } else { @($ServiceFqdn) }
        $proxySetting.BypassList = $newBypassList
    }

    $json | ConvertTo-Json -Depth 100 | Set-Content -Path $appSettingsPath -ErrorAction Stop
    Write-Log -Level INFO -ExitCode 0 -Message "Set-WACEndpointFqdn: Updated Endpoint and Service FQDN."

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Gets the endpoint FQDNs for Windows Admin Center.

.DESCRIPTION
    Gets the endpoint FQDNs for Windows Admin Center.

#>
function Get-WACEndpointFqdn {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    $appSettingsPath = GetAppSettingsPath
    $endpointFqdn = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "EndpointFqdn"
    $serviceFqdn = GetJsonField -Path $appSettingsPath -Sections "WindowsAdminCenter", "Http", "ServiceFqdn"
    @{
        EndpointFqdn = $endpointFqdn
        ServiceFqdn  = $serviceFqdn
    }

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Adds a start menu shortcut to the "WindowsAdminCenterSetup" executable.
    NOTE: This is specific to the WacSetup project currently available only on specific editions of Windows Server 2025.
          There's currently no known searching mechanism in WS/OS Shell that provides a functionality
          for avoiding "Windows Admin Center Setup" to be present or served as a "best match" in the start menu after WAC
          gets installed, therefore, we need to remove the WacSetup shortcut after the installer is finished, 
          and restore it back (only if needed) during the uninstall phase to ensure a consistent UX.

.DESCRIPTION
    Adds a start menu shortcut to the "WindowsAdminCenterSetup" executable.

#>
function Add-WACSetupStartMenuShortcut {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    # Check if WacSetup project files are present on the System which indicates a relevant build for WacSetup
    $wacSetupPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Windows"), "WindowsAdminCenterSetup")
    if (-not (Test-Path -Path $wacSetupPath)) {
        Write-Log -Level INFO -ExitCode 0 -Message "Add-WACSetupStartMenuShortcut: WacSetup project files are not present on the system."
    }
    else {
        $shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("CommonPrograms"), "Windows Admin Center Setup.lnk")
        
        try {
            $shell = New-Object -comObject WScript.Shell
            $shortcut = $shell.CreateShortcut($shortcutPath)
            $shortcut.TargetPath = [System.IO.Path]::Combine($wacSetupPath, "WindowsAdminCenterSetup.exe")
            $shortcut.Save()
        }
        catch {
            Write-Error $_
            Write-Log -Level ERROR -ExitCode 1 -Message "Add-WACSetupStartMenuShortcut: Failed to create the start menu shortcut."
            ExitWithErrorCode 1
        }
    }

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Removes the start menu shortcut to the "WindowsAdminCenterSetup" executable.
    NOTE: This is specific to the WacSetup project currently available only on specific editions of Windows Server 2025.
          There's currently no known searching mechanism in WS/OS Shell that provides a functionality
          for avoiding "Windows Admin Center Setup" to be present or served as a "best match" in the start menu after WAC
          gets installed, therefore, we need to remove the WacSetup shortcut after the installer is finished, 
          and restore it back (only if needed) during the uninstall phase to ensure a consistent UX..

.DESCRIPTION
    Removes the start menu shortcut to the "WindowsAdminCenterSetup" executable.

#>
function Remove-WACSetupStartMenuShortcut {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    SetExitWithErrorCode $ExitWithErrorCode

    # Check if WacSetup shortcut (.lnk) is present and remove it
    $shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("CommonPrograms"), "Windows Admin Center Setup.lnk")
    if (Test-Path -Path $shortcutPath) {
        Remove-Item -Path $shortcutPath -Force -ErrorAction SilentlyContinue
    }

    ExitWithErrorCode 0
}

<#
.SYNOPSIS
    Utility function to modify a JSON file.
    
.DESCRIPTION
    Updates a field in a JSON file to the given value. 

.PARAMETER Path
    The path to the JSON file to be updated.

.PARAMETER Sections
    An array indicating the field to be modified.
    Uses the name of the sections in top-down order and a number indicating the desired index for an array. (Please see example below.)

.PARAMETER Value
    The value to be set to the field.

.EXAMPLE
    UpdateJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "Services", 0,  "Endpoint" -Value "https://localhost:$ServicePortRangeStart"
#>
function UpdateJsonField {
    Param(
        [string]$Path, 
        [object[]]$Sections,
        [object]$Value
    )

    $jsonFile = Get-Content -Path $Path -Raw -ErrorAction Stop | ConvertFrom-Json
    $jsonField = $jsonFile
    
    $sectionCount = $Sections.Count
    $sectionIndex = 0
    foreach ($section in $Sections) {
        $sectionIndex++

        if ($section -is [int]) {
            $jsonField = $jsonField[$section]
            continue
        }

        if ($sectionIndex -eq $sectionCount) {
            if ($null -ne $jsonField.$section) {
                $jsonField.$section = $Value
            }
            else {
                $jsonField | Add-Member -MemberType NoteProperty -Name $section -Value $Value -Force
            }
            
            break
        }

        $jsonField = $jsonField.$section
    }

    $jsonFile | ConvertTo-Json -Depth 100 | Set-Content -Path $Path -ErrorAction Stop
}

<#
.SYNOPSIS
    Utility function to read a JSON file.
    
.DESCRIPTION
    Reads a field in a JSON file. 

.PARAMETER Path
    The path to the JSON file to be read.

.PARAMETER Sections
    An array indicating the field to be read.
    Uses the name of the sections in top-down order and a number indicating the desired index for an array. (Please see example below.)

.EXAMPLE
    GetJsonField -Path (GetAppSettingsPath) -Sections "WindowsAdminCenter", "System", "InstallDate"
#>
function GetJsonField {
    Param(
        [string]$Path, 
        [object[]]$Sections
    )

    $jsonField = Get-Content -Path $Path -Raw -ErrorAction Stop | ConvertFrom-Json

    foreach ($section in $Sections) {
        if ($section -is [int]) {
            $jsonField = $jsonField[$section]
            continue
        }

        $jsonField = $jsonField.$section
    }

    return $jsonField
}

function GetUninstallRegistryKey {
    $regValue = Get-ItemProperty -Path $ConstUninstallRegKey -ErrorAction SilentlyContinue -ErrorVariable err

    if (!!$err) {
        return $null
    }

    return $regValue
}

function GetRegInstallLocationPath {
    $regValue = GetUninstallRegistryKey
    if (!!$regValue) {
        # NB: In a cluster this value contains the WindowsAdminCenter\Program Files suffix.
        $property = $regValue.$ConstSetupRegInstallLocationPropertyName

        return $property
    }

    return $null
}

function GetProgramFilesAppPath {
    $path = $ConstDefaultProgramFilesFolderPath
    $regInstallFolder = GetRegInstallLocationPath

    if (!!$regInstallFolder) {
        $path = $regInstallFolder
    }

    return $path
}

function GetProgramFilesPath {
    $path = $ConstDefaultProgramFilesFolderPath
    $regInstallFolder = GetRegInstallLocationPath

    if (!!$regInstallFolder) {
        $installionMode = GetRegInstallionMode

        if ($installionMode -eq $ConstSetupRegInstallionModePropertyValueFailoverCluster) {
            $parentPath = Split-Path -Path $regInstallFolder -Parent | Split-Path -Parent
            
            $path = Join-Path -Path $parentPath -ChildPath "Program Files"
        }
    }

    return $path
}

function GetProgramDataAppPath {
    $path = $ConstDefaultProgramDataFolderPath
    $regInstallFolder = GetRegInstallLocationPath

    if (!!$regInstallFolder) {
        $installionMode = GetRegInstallionMode

        if ($installionMode -eq $ConstSetupRegInstallionModePropertyValueFailoverCluster) {
            $parentPath = Split-Path -Path $regInstallFolder -Parent | Split-Path -Parent
            
            $path = Join-Path -Path $parentPath -ChildPath "ProgramData\WindowsAdminCenter"
        }
    }

    return $path
}

function GetRegInstallionMode {
    $regValue = GetUninstallRegistryKey
    $property = $regValue.$ConstSetupRegInstallionModePropertyName

    return $property
}

function GetServicePath {
    $path = Join-Path -Path (GetProgramFilesAppPath) -ChildPath "Service"

    return $path
}

function GetUpdaterPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Updater"

    return $path
}

function GetUxPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Ux"

    return $path
}

function GetUxPowerShellModulePath {
    $uxPath = GetUxPath
    $path = Join-Path -Path $uxPath -ChildPath "powershell-module"

    return $path
}

function GetUxModulesPath {
    $uxPath = GetUxPath
    $path = Join-Path -Path $uxPath -ChildPath "modules"

    return $path
}

function GetPowerShellModulesPath {
    $programFilesPath = GetProgramFilesAppPath
    $path = Join-Path -Path $programFilesPath -ChildPath "PowerShellModules"

    return $path
}

function GetCredSspPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "CredSSP"

    return $path
}

function GetDatabasePath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Database"

    return $path
}

function GetControllersPath {
    $programFilesPath = GetProgramFilesAppPath
    $path = Join-Path -Path $programFilesPath -ChildPath "Controllers"

    return $path
}

function GetExtensionsPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Extensions"

    return $path
}

function GetPlugInsPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Plugins"

    return $path
}

function GetLogsPath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "Logs"

    return $path
}

function GetMigrationStatusFilePath {
    $programDataPath = GetProgramDataAppPath
    $path = Join-Path -Path $programDataPath -ChildPath "MigrationBackup\MarkedMigrated.txt"

    return $path

}

<#
.SYNOPSIS
    Utility function to get the path to the app settings JSON file.
#>
function GetAppSettingsPath {
    
    return [System.IO.Path]::GetFullPath((Join-Path -Path (GetServicePath) -ChildPath $ConstAppConfigJsonName))
}

function OutIniFile([Object]$InputObject, [string]$FilePath) {
    $output = @()

    foreach ($section in $InputObject.keys) {
        if (!($InputObject[$section].GetType().Name -eq "Hashtable")) {
            # No Sections
            $output += "$section=$($InputObject[$section])"
        }
        else {
            # Sections
            $output += "[$section]"
            foreach ($key in ($InputObject[$section].keys | Sort-Object)) {
                if ($key -match "^Comment[\d]+") {
                    $output += "$($InputObject[$section][$key])"
                }
                else {
                    $output += "$key=$($InputObject[$section][$key])"
                }
            }
            $output += ""
        }
    }
    New-Item -Path $FilePath -ItemType File -Force | Out-Null
    Set-Content -Path $FilePath -Value $output -Force
}


function GetGatewayService {
    $service = Get-Service -Name $ConstServiceName -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level WARN -ExitCode 0 -Message "The Windows Admin Center service registration was not found. Error: $err"

        return $null
    }

    return $service
}

function GetGenericServiceResource {
    Param(
        [Parameter(Mandatory = $True)]
        [string]$serviceName
    )
    $genSvcResources = @(get-clusterresource -ErrorAction SilentlyContinue -ErrorVariable err | Where-Object {$_.ResourceType -eq $ConstGenericServiceResourceTypeName})
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "GetGenericServiceResource: There was an error getting the Generic Service Resources. Error: $err"

        return $null
    }

    $param = $genSvcResources[0] | Get-ClusterParameter -ErrorAction SilentlyContinue -ErrorVariable err | Where-Object {$_.Name -eq $ConstGenericServiceNameParameterName -and $_.Value -eq $serviceName}
    if (!$param) {
        # $err
        Write-Log -Level ERROR -ExitCode 1 -Message "GetGenericServiceResource: The Generic Service Resource for Gateway service $serviceName was not found."

        return $null
    }

    $resource = Get-ClusterResource -Name $param.ClusterObject.Name -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "GetGenericServiceResource: There was an error getting the Generic Service Resource for Gateway service $serviceName. Error: $err"

        return $null
    }

    return $resource
}

function GetGenericServiceResourceV1 {
    return GetGenericServiceResource $ConstGWv1ServiceName 
}

function GetGenericServiceResourceV2 {
    return GetGenericServiceResource $ConstServiceName 
}

function GetGWV1RoleName {
    $gwv1Resource = GetGenericServiceResourceV1
    if (!!$gwv1Resource) {
        return $gwv1Resource.OwnerGroup
    }

    return $null
}

function GetGWV2Role {
    $gwv2Resource = GetGenericServiceResourceV2
    if (!!$gwv2Resource) {
        return $gwv2Resource.OwnerGroup
    }

    return $null
}

function GetGWRole {
    $role = $null

    $v2Role = GetGWV2Role
    if (!$v2Role) {
        $role = GetGWV1Role
    } else {
        $role = $v2Role
    }

    return $role
}

function GetGWGenericServiceResource {
    $resourceName = $null

    $v2Name = GetGenericServiceResourceV2
    if (!$v2Name) {
        $resourceName = GetGenericServiceResourceV1
    } else {
        $resourceName = $v2Name
    }

    $resource = Get-ClusterResource -Name $resourceName -ErrorAction SilentlyContinue -ErrorVariable err
    if (!!$err) {
        Write-Log -Level ERROR -ExitCode 1 -Message "GetGWGenericServiceResource: There was an error getting the cluster resource for $resourceName. Error: $err"
    }

    return $resource
}

<#
.SYNOPSIS
    Utility function to write a log record to the log file.
#>
function Write-Log {
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateSet("INFO", "WARN", "ERROR", "DEBUG", "VERBOSE")]
        [String]
        $Level,
        [Parameter(Mandatory = $True)]
        [string]
        $ExitCode,
        [Parameter(Mandatory = $True)]
        [string]
        $Message
    )

    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Line = "$Stamp Level=$Level ExitCode=$ExitCode Message=$Message"
    $logsPath = GetLogsPath
    $LogFilePath = Join-Path $logsPath $ConstLogFileName

    $logName = $ConstApplicationEventLogName
    
    # If the WindowsAdminCenter log has been created then all log entries should go there.  If the that
    # event log does not exist, e.g. during setup, then use the application log.
    try {
        if ([System.Diagnostics.EventLog]::SourceExists($ConstEventLogName)) {
            $logName = $ConstEventLogName
        }
    }
    catch {
        # Any error will cause the application log to be used.
    }

    Write-EventLog -LogName $logName -Source $ConstLogSourceWACConfiguration -EventId 0 -Category $ConstCategoryInstaller -EntryType SuccessAudit `
        -Message "Write-Log: $line." -ErrorAction SilentlyContinue

    if (Test-Path -Path $logsPath) {
        Add-Content $LogFilePath -Value $Line
    }
}


# Two global variables are used to track down the exit code usage.
$global:_exitOnce = $false
$global:_exitCount = 0

function SetExitWithErrorCode($exitWithErrorCode) {
    $global:_exitWithErrorCode = $exitWithErrorCode
}

<#
.SYNOPSIS
    Tracks exit code when a command runs with ExitWithErrorCode switch parameter.
.DESCRIPTION
    "Exit" function is the only way to report the exit code of script when launched through the installer.
    However a script will be terminated when "Exit" function is called. And "Exit" will close current
    PowerShell interactive console as well. To control these behavior, SetExitWithErrorCode and ExitWithErrorCode
    are implemented.

    Every entry function must be defined with $ExitWithErrorCode optional parameter. It must reflect the value
    by calling "SetExitWithErrorCode $ExitWithErrorCode". This function applies tracking mode of exit code.
    The function must call "ExitWithErrorCode" function only once in the function lifetime.
    Exit code feature is not available if you call multiple function by external client like interactive
    session or calling by another script. The function must be called once and finish the script session.
#>
function ExitWithErrorCode($exitCode) {
    if ($global:_exitWithErrorCode) {
        $global:_exitCount++
        if ($global:_exitCount -gt 1) {
            Write-Warning "Are you exiting multiple times ($($global:_exitCount))?"
            Write-Warning "Exit code feature can be used only once after import this module"
            Write-Warning "Cannot use parameter -ExitWithErrorCode"
            Write-Warning "Exiting ... $exitCode"
        }

        if (-not $global:_exitOnce) {
            if ($exitCode -ne 0) {
                $global:_exitOnce = $true
            }

            Write-Verbose "Exit $exitCode"
            Exit $exitCode
        }
    }
}

# SIG # Begin signature block
# MIIoQgYJKoZIhvcNAQcCoIIoMzCCKC8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBdPG1KqZMl8KaM
# vaEVBK2k36YqR8kCJSLW8XhRWQw9Y6CCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGiIwghoeAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAQEbHQG/1crJ3IAAAAABAQwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIEsaDIxcnFIyDd/PImVxGU3+
# W75jj3jb8J3Q+0LHPrhqMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEATjJGBJQKfIzsYXUNcegjQapdog6m9sVqoRgs8AKOYDSfxYOq2/iXF/HG
# 60wdufF0YPEpG6d9xx8rj0r6+f4AHcjygVzQT6ojSt9DVJijMVbrRcQPYMniJm4a
# jBCRtWRuUvew0Kk17nloEUtMLCeMDy+dwh1q5ka4VT7349gIOKhWIG/vAMI9VTUP
# 8LjI4m5b6q2QSxqt0hRn9FtVg22Ngetc4pmCN0CsMQqUGAtQFKoy6Wvf/xSO9JNL
# u89Hswt58Cugsz4Yeph8CRufhD+YJntHpIfwLT82bjEH9lgUDgRXmsEcqrCIxKdD
# RlK/F+GWxH1qldPXMttRfNvQ7tR9EaGCF6wwgheoBgorBgEEAYI3AwMBMYIXmDCC
# F5QGCSqGSIb3DQEHAqCCF4UwgheBAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFZBgsq
# hkiG9w0BCRABBKCCAUgEggFEMIIBQAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCBhu4hZ6fHq5Pkvk4LzhW70onKvUe0d8mL8FIwEu1vKwwIGZ0o2z5z/
# GBIyMDI0MTIwOTE4Mjk1Ni45NlowBIACAfSggdmkgdYwgdMxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNO
# OjU5MUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNloIIR+zCCBygwggUQoAMCAQICEzMAAAH0F0aFwMs/OeUAAQAAAfQwDQYJ
# KoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjQw
# NzI1MTgzMDU5WhcNMjUxMDIyMTgzMDU5WjCB0zELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NTkxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCnCE4TptCAL2qriMkZfYDX
# Kg5t+TSp61DySSP7mbftYHEOWxnmgmeN/Meymo+I4RXNnbLbKAaA1nf/F1lA3t/0
# DVanUB2HmoddlmHdIFfwAG5zr1NvdwnkoJlxcOy5/CZd4KPzUTMkQhmq5V1XxJOV
# C54H9vUwhi3lEqKze7DN2V9KXRyQdsbOg73VhMqDogTGopiiMat4KimcgrE6+Svl
# VmyPZ/3kFvUsYS+6EEib8LsnKy8m8FlY22uynPJdWe6j6QMTJnCmSmGxHxm92L6z
# +lCKh+Z1tbVSrNaWpdBWChhdtpiQTJpKH+F4G3CPW2574ty45wcA+BvBm9AuSwpo
# rjqiS2t6A5Hh7SJywaIBZH0gv6fLiaUJQ0DzgXsYQRY4S+JuKDvCytNrplvO4yzJ
# OLYDPio9XdBGQWDFJunhHg4QqeKfwnPhcsjXBeEGEikwZ8DcFPznSepqbNKIPkvm
# nH5W18KLQwlNLYsMXU9pVnCXJVkhWNUcryiHYdgb1PboWNH38jzmLkTHGaEenEzZ
# n5SEl5kDovPjnab/7GsDjGt1hqzlybsVSHLbis8tUf4XL5nLAcCn1z2hZOu2N8gq
# osi9i2AlzjVDxbFtk9HsHW5+3wEWy/PZ05IuTE8MtxdbLXoA3Lve/SKkLEDBQQL2
# GyyLQt0HxOGI1//gD5FnywIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFCt0ZaEK0Sw+
# J3UsnOxNotMpBt+bMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQDdwdIPEkpQOyBp
# wh9FfrS6A4NKGwGrC0RRFRtRd4OZhhJrmgWPfhG6NbeA54K385sM7jm9+mdgbk5L
# lijDCwXDX2CIIjolX5xwb+qozTyfEBJvPBa2q2ivNCImH26mwThNVl4pheZvLHtY
# 3211tUisJ6VWPs/qJ8wdNIu3oGbKhLbGULZx+Ao88DXe9Ld66pSXrPB7sYCGN+M1
# eMqUThI1Ym92qCu/QZREqOqZqY2+GZIlqd7pNjOl0MJ6Crxp2UYfzkjURYqZ8RFv
# WXMrLk4w7Z70iQCW/J2lS6fQLew0S2nR6GWJPRKtqryNxhUMfgDYL8xssEjCKSPC
# IUZDhKUUtPZOBvga++lxZXMHHAOj0hEHCnOeBvLNuGH3lRU6tAvattYescNITd2B
# 0vbK5odGBjsdhguzku2zfTBT066Hw3nhFS1roYVkXHkDi4hODIlxV1ZVo3SqOzR4
# SPATI1S/RxEu4dYkF6OQx7epECG8KOeGujsMZFZoiV3J/NmqWfoWyctDduX5m9Ul
# ZNgm4v4hksjZKLcishF+Nxyfb1fYFf+/PYpxi5siMrpd9i+tlA3hcpue9KoE0DAg
# 9jbEl4Hij08MQUjatw9otTLPkhXsk/clGmCDfGxSq8UeVIbq4whaPAfQZAgjCsLb
# NHL6U1mw4qeu7LIcxBM/uPLlT3aoQTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
# SZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmlj
# YXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIy
# NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXI
# yjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjo
# YH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1y
# aa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v
# 3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pG
# ve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viS
# kR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYr
# bqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlM
# jgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSL
# W6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AF
# emzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIu
# rQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIE
# FgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWn
# G1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEW
# M2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5
# Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBi
# AEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV
# 9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3Js
# Lm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAx
# MC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2
# LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv
# 6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZn
# OlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1
# bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4
# rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU
# 6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDF
# NLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/
# HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdU
# CbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKi
# excdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTm
# dHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZq
# ELQdVTNYs6FwZvKhggNWMIICPgIBATCCAQGhgdmkgdYwgdMxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNO
# OjU5MUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQC/4tn9WDSzXtd6TiIb1H1z/v4AjqCBgzCB
# gKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUA
# AgUA6wE7HDAiGA8yMDI0MTIwOTA5NDcwOFoYDzIwMjQxMjEwMDk0NzA4WjB0MDoG
# CisGAQQBhFkKBAExLDAqMAoCBQDrATscAgEAMAcCAQACAhqxMAcCAQACAhK8MAoC
# BQDrAoycAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEA
# AgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAF16nKJmPXiBlB02
# MujobUhXyWWrCDr+ve9v5fOkUlk2AYvQ3PNA+gpQVDuT77OlRchvsV1n1dOmbdoI
# p+7zOdrOYtaOGt2NrQV1XutwljM5tQGz3O2XmT9zGv0BfaGPNrRRtRK5KSUzaJGd
# PzcsdLcF5YCJG5B2pzUJaA1eAKA1zXQWupVwHqqKAZtx/rtVRNIe1v1Nae9v1juh
# wx+6Xz0SMjvU+OYqTEX24Hmpri9bv4BUVbf/zNYT2A9ywUg351u2vi5YjLqCzq/m
# Yls+kxUzFHNgn7o8p02aKdrxrmXF2XYF4ssb+uHYHcQfwKo0NqHArhOt/aDuCHdX
# O2cF5NIxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MAITMwAAAfQXRoXAyz855QABAAAB9DANBglghkgBZQMEAgEFAKCCAUowGgYJKoZI
# hvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCC0gpAs3ZgzIoEm
# csRSrFyGsPZ0e41I4hHzpuS2o6MFNDCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQw
# gb0EID9YwnxuJpPqeO+SScHxDuFJAiLzKzq8gG9mDrREGNZrMIGYMIGApH4wfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH0F0aFwMs/OeUAAQAAAfQw
# IgQg4bKBQ0xE108gEtZEshjqHAm+RqaZemloO9H54/LMWoMwDQYJKoZIhvcNAQEL
# BQAEggIAS0JbcBFurPe2uR6/svjhHRt8oS8zy8dulRwyP+rLPHLfxc4Nb1F6Gw/k
# UVCFyl4PIfzUmOwqffyXT49JoSIX/iRZRC+G7xOVqAgRGME+1rYYFpav8PiHOS8d
# 4bpI/hS2FbctCrvtElIFc6Hv7ir9Zz4ikEDVoF0Pb1zEHl9xBwN9pGvS6fAX5nO+
# ta6eZzETxgYS3sYFXMpc6aDOuN60FS/n2CwHBeQa0vp5galWNSfai8YTFTqyz3aC
# MkAWu/uWFBAjUQcbsNyBO6uTUqY8uOZALruHTo9KjpftOdlZql99v0xM06Q3tapa
# OfYPvh7R7RqcA76Ne12L4K0TOjWxrk2RIUCPtarV2BpiYn9wwx15Ui6+K6umTfjo
# IYMFysLWUqzPWokr/8dLot6AA5iiC6d8fiY7ys7apjUHi1Jf4he4b6oX2MLntzbz
# XN4cUmT309rqE2G6xfylWhum6J66TL9LTN8X9mapgC8FyO7CeM0NIMY+J/qpDf9b
# IFGjXQ0DQWpzMIZqvcoSvS0MSIkOLUT8mMrfjcJn/iP5pPhYu5q2ASuQyr6u5Qd7
# RAlK2oeGPnPuVfimOu5rdmGqhJDWQLZ5ExzhGuzWpO4SQqiqeGe/tmgaKohngNuD
# aioiE+9cASmvd9iOTob0jyi1H4d3KmDds8n3TBIRpUmq3EFGCtY=
# SIG # End signature block
