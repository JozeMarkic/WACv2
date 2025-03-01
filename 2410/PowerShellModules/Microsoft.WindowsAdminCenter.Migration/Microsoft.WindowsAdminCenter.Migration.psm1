# Script can be loaded only if running under elevated administrator environment.
#Requires -RunAsAdministrator

$WacProgramFiles = "${env:ProgramFiles}\WindowsAdminCenter"
$WacProgramData = "${env:ProgramData}\WindowsAdminCenter"
$WacToolCommand = "$WacProgramFiles\Service\WindowsAdminCenterTool.exe"
$WacConfigModulePath = "$WacProgramFiles\PowerShellModules\Microsoft.WindowsAdminCenter.Configuration"
$WacAppSettingsFilePath = "$WacProgramFiles\Service\appsettings.json"
$WacV2MigrationFolder = "$WacProgramData\MigrationBackup"
$WacV2ExtensionConfigPath = "$WacProgramData\Extensions\extensions.config"

$WacV1InstalledFolder = "${env:ProgramFiles}\Windows Admin Center\"
$WacV1MigrationFolder = "${env:ProgramData}\Server Management Experience\MigrationBackup"
$WacV1ExtensionConfigPath = "${env:ProgramData}\Server Management Experience\Extensions\extensions.config"
$WacV1NetworkServiceDatabasePath = "${env:systemroot}\ServiceProfiles\NetworkService\appdata\Roaming\Microsoft\ServerManagementExperience"
$WacV1UserDatabasePath = "${env:appdata}\Microsoft\ServerManagementExperience"
$WacV1DesktopExePath = "${WacV1InstalledFolder}SmeDesktop.exe"

$WacRegistryPath = "HKLM:\SOFTWARE\Microsoft\ServerManagementGateway"
$WacApplicationIdV1 = "975536f5-223d-442c-9271-7f62fc035c1f"
$WacApplicationIdV2 = "13EF9EED-B613-4D2D-8B82-7E5B90BE4990"
$WacAuthenticatedUsersV1 = "D:(A;;GX;;;AU)";
$WacNetworkServiceV1 = "O:NS";
$WacNetworkServiceV2 = "D:(A;;GX;;;NS)";
$WacWindowsAuthenticationMode = "WindowsAuthentication"
$WacMigrationMarkedFileName = "MarkedMigrated.txt"
$WacMigrationStatusFileName = "MigrationStatus.json"

Import-LocalizedData -BindingVariable ResourceStrings -FileName ResourceStrings.psd1 -ErrorAction SilentlyContinue
if ($null -eq $ResourceStrings) {
    Write-Warn "Fallback to English"
    Import-LocalizedData -BindingVariable ResourceStrings -BaseDirectory $PSScriptRoot -UICulture "en-US" -FileName "ResourceStrings.psd1"
}

<#
.SYNOPSIS
    Update the Windows Admin Center environment from V1 to V2.

.DESCRIPTION
    Update the Windows Admin Center environment from V1 to V2. During the migration, it will stop the Windows Admin Center V1 service, and at the completion start the Windows Admin Center V2 service.
    It saves the information of current settings, extensions and database of Windows Admin Center V1, and then restore them to Windows Admin Center V2.
    If V1 and V2 are configured with WindowsAuthentication (NTLM), it will remove the port binding of V1 and add the port binding of V2. Then after that V1 cannot be used anymore. In case, you want o use V1 back again, you can run Restore-WACV1Environment script command.
    Attention: The migration doesn't uninstall V1, you must uninstall it manually after migration.

    The following features are not fully migrated by various conditions:
    1) Proxy: If it has been configured with credentials, you must revisit Proxy settings on V2 and re-configure the proxy.
    2) Azure App registration settings: If it is configured, you must revisit Azure Portal at the App registration settings and add new Return URL.
    3) WebSocket Validation Override: If it's configured on the registry, you must edit appsettings.json file to register supporting WebSocket origin addresses. V2 uses different setting format.
    4) UI Extensions: Non pre-installed extension wouldn't be migrated, you must reinstall them.

    The migration result will tell all remained tasks at the end, and recorded on JSON files at %ProgramData%\WindowsAdminCenter\MigrationBackup folder.

.PARAMETER SkipSettings
    Use it to skip the migration of settings.

.PARAMETER SkipDatabase
    Use it to skip the migration of database.

.PARAMETER NonInteractive
    Use it to migrate without any prompt.

.PARAMETER Force
    Make the migration even if the migration was already performed. (not guaranteed to work)

#>
function Update-WACEnvironment() {
    [CmdletBinding()]
    param(
        [switch]$SkipSettings,
        [switch]$SkipDatabase,
        [switch]$NonInteractive,
        [switch]$Force
    )

    $error.Clear()
    Write-Host ($ResourceStrings.MigrationTitle -f $NonInteractive)
    if (-not $NonInteractive) {
        Write-Host $ResourceStrings.MigrationStartMessage
        Write-Host $ResourceStrings.MigrationStartMessage1
        Write-Host $ResourceStrings.MigrationStartMessage2
    }

    $includeSettings = -not $SkipSettings.IsPresent -or -not $SkipSettings.ToBool()
    $includeDatabase = -not $SkipDatabase.IsPresent -or -not $SkipDatabase.ToBool()
    $interactive = -not $NonInteractive.IsPresent -or -not $NonInteractive.ToBool()

    $migration = GetInstalledStatus -FolderPath $WacV2MigrationFolder
    if ($migration.Status -ne "Ready" -and $migration.Status -ne "NotInitializedV1") {
        $allowRepeat = $migration.Status -eq "CannotRepeat" -and $Force
        if (-not $allowRepeat) {
            Write-Error -Message "$($migration.Title): $($migration.Message) [$($migration.Status)]" -Category InvalidOperation -ErrorId $migration.Status
            return
        }

        Write-Host -BackgroundColor Cyan $ResourceStrings.ForcedMessage
    }

    Write-Host "$($migration.Title): $($migration.Message) [$($migration.Status)"
    if ($migration.LoginMode -eq $WacWindowsAuthenticationMode) {
        Write-Host -BackgroundColor Cyan $ResourceStrings.WindowAuthenticationMessage
    }

    if ($interactive) {
        $decision = $Host.UI.PromptForChoice(
            $ResourceStrings.StopWindowsAdminCenterV1Message,
            $ResourceStrings.SureProceedMessage,
            @(
                [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.YesLabel, $ResourceStrings.StopV1ProceedMessage),
                [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.NoLabel, $ResourceStrings.QuitAllMessage)
            ),
            1)
        if ($decision -ne 0) {
            return
        }
    }

    ResetMigrationStatus -FolderPath $WacV2MigrationFolder
    Save-WACResource -Version1 -FolderPath $WacV2MigrationFolder -BackupPath $WacV1MigrationFolder -DoNotReStartService
    Write-Host ($ResourceStrings.SaveStateV1Message -f $WacV2MigrationFolder)
    foreach ($item in (Get-ChildItem -Path $WacV2MigrationFolder)) {
        Write-Host " - $($item.Name)"
    }

    if ($interactive) {
        if (-not $TransferSettings.IsPresent) {
            $decision = $Host.UI.PromptForChoice(
                $ResourceStrings.UpdatingSettingsMessage,
                $ResourceStrings.WantToUpdateMessage,
                @(
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.YesLabel, $ResourceStrings.UpdateSettingsMessage),
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.SkipLabel, $ResourceStrings.SkipSettingsMessage)
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.QuitLabel, $ResourceStrings.QuitAllMessage)
                ),
                0)
            if ($decision -eq 1) {
                $includeSettings = $false
            }
            elseif ($decision -eq 2) {
                Write-Host -ForegroundColor Blue $ResourceStrings.QuitMigrationMessage
                return
            }
        }

        if (-not $TransferDatabase.IsPresent) {
            $decision = $Host.UI.PromptForChoice(
                $ResourceStrings.UpdatingDatabaseMessage,
                $ResourceStrings.WantToUpdateMessage,
                @(
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.YesLabel, $ResourceStrings.UpdateDatabaseMessage),
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.SkipLabel, $ResourceStrings.SkipDatabaseMessage)
                    [System.Management.Automation.Host.ChoiceDescription]::new($ResourceStrings.QuitLabel, $ResourceStrings.QuitAllMessage)
                ),
                0)
            if ($decision -eq 1) {
                $includeDatabase = $false
            }
            elseif ($decision -eq 2) {
                Write-Host -ForegroundColor Blue $ResourceStrings.QuitMigrationMessage
                return
            }
        }

        if (-not $includeSettings -and -not $includeDatabase) {
            Write-Host $ResourceStrings.QuitMigrationMessage
            return
        }
    }

    Write-Host ($ResourceStrings.TransferringStatusMessage -f $includeSettings, $includeDatabase)
    $includeExtensions = $migration.Status -ne "NotInitializedV1"
    Restore-WACResource -FolderPath $WacV2MigrationFolder -RestoreSettings:$includeSettings -RestoreDatabase:$includeDatabase -RestoreExtensions:$includeExtensions
    if ($error.Count -eq 0) {
        Write-Host ($ResourceStrings.CompletedMigrationMessage -f $WacV2MigrationFolder, $WacV1MigrationFolder)
        Write-Host $ResourceStrings.V1StoppedMessage
        if ($migration.LoginMode -eq $WacWindowsAuthenticationMode) {
            Write-Host $ResourceStrings.BindingRemovedMessage
        }

        Write-Host $ResourceStrings.V2GuideMessage
    }

    "MIGRATION COMPLETED AT $(Get-Date)" | Set-Content -Path "$WacV2MigrationFolder\$WacMigrationMarkedFileName"
    UpdateMigrationStatus -FolderPath $WacV2MigrationFolder -State "Completed" -Title "" -Message "" -Category "" -Payload $null
}

<#
.SYNOPSIS
    Restore the Windows Admin Center V1 environment to undo the migration.

.DESCRIPTION
    Restore the Windows Admin Center V1 environment to undo the migration.

.PARAMETER Force
    Use it to force the restore even if the restore was alrady performed.

.PARAMETER FolderPath
    Use it to specify the folder path of the backup. Default is "%ProgramData%\WindowsAdminCenter\MigrationBackup"
#>
function Restore-WACV1Environment() {
    [CmdletBinding()]
    param(
        [string]$FolderPath = $WacV2MigrationFolder,
        [switch]$Force
    )

    function Restore-WACv1DesktopShortcut {
        $publicDesktopPath = [System.IO.Path]::Combine([Environment]::GetFolderPath("CommonDesktopDirectory"))
        $productName = "Windows Admin Center"
        $desktopShortcutsPath = @("$publicDesktopPath\$productName.lnk")
        $shell = New-Object -ComObject WScript.Shell
        $shortcut = $shell.CreateShortcut($desktopShortcutsPath)
        $shortcut.TargetPath = $WacV1DesktopExePath
        $shortcut.WorkingDirectory = $WacV1InstalledFolder
        $shortcut.Description = $productName
        $shortcut.IconLocation = $WacV1DesktopExePath + ", 0"
        $shortcut.Save()
    }

    if (-not (Test-Path "$FolderPath\$WacMigrationMarkedFileName")) {
        if (-not $Force) {
            throw $ResourceStrings.MigrationWasNotMessage
        }
    }
    else {
        Remove-Item -Path "$FolderPath\$WacMigrationMarkedFileName"
    }

    Import-Module -Name $WacConfigModulePath -Verbose:$false

    $serviceV2 = Get-Service -Name WindowsAdminCenter -ErrorAction SilentlyContinue
    if ($null -eq $serviceV2) {
        throw $ResourceStrings.NoServiceMessage
    }

    if ($serviceV2.Status -eq "Running") {
        $serviceV2 | Stop-Service -Force
    }

    $serviceV1 = Get-Service -Name ServerManagementGateway -ErrorAction SilentlyContinue
    if ($null -ne $service -and $serviceV1.Status -eq "Running") {
        $serviceV1 | Stop-Service -Force
    }
    else {
        $desktop = Get-Process -Name SmeDesktop -ErrorAction SilentlyContinue
        if ($null -ne $desktop) {
            $desktop | Stop-Process -Force
        }
    }

    $settingsPath = Join-Path $FolderPath "Settings.json"
    $settings = Get-Content -Path $settingsPath | ConvertFrom-Json
    $httpsSysV1 = $settings.json.httpsSysV1
    $portV1 = $httpsSysV1.port
    $thumbprintV1 = $httpsSysV1.thumbprint
    $applicationIdV1 = $httpsSysV1.applicationId
    $urlaclV1 = $httpsSysV1.urlacl
    $httpsSysV2 = $settings.json.httpsSysV2
    $portV2 = $httpsSysV2.port
    $thumbprintV2 = $httpsSysV2.thumbprint
    
    Set-WACHttpsPorts -WacPort $portV2
    Write-Host "V2 Port: $portV2"

    if ($httpsSysV2.loginMode -eq $WacWindowsAuthenticationMode) {
        try {
            Unregister-WAChttpSys
        }
        catch {
        }

        # add the port binding for V2
        Register-WAChttpSys -Thumbprint $thumbprintV2 -Port $portV2
        Write-Host "V2 Http.sys: $portV2"
    }
    
    # remove the port binding for V1
    Write-Host "V1 Http.sys - Delete: $portV1"
    InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "sslcert", "ipport=0.0.0.0:$portV1")
    InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "urlacl", "url=https://+:$portV1/")


    # add the port binding for V1
    Write-Host "V1 Http.sys - Add: $portV1"
    InvokeWinCommand -Command "netsh" -Parameters @("http", "add", "sslcert", "ipport=0.0.0.0:$portV1", "certhash=$thumbprintV1", "appid=""{$applicationIdV1}""")
    InvokeWinCommand -Command "netsh" -Parameters @("http", "add", "urlacl", "url=https://+:$portV1/", "sddl=""$urlaclV1""")

    if ($null -ne $serviceV1) {
        # set V1 service to auto start
        $serviceV1 | Set-Service -StartupType Automatic
        Start-Service -Name $serviceV1.Name
    } else {
        Restore-WACv1DesktopShortcut
    }
    
    Start-Service -Name $serviceV2.Name
}

<#
.SYNOPSIS
    Save the current settings, extensions and database of Windows Admin Center V1.

.DESCRIPTION
    Save the current settings, extensions and database of Windows Admin Center V1 or V2.

.PARAMETER FolderPath
    Use it to specify the folder path of the backup. Default is "WACBackup" of current folder.

.PARAMETER BackupPath
    Make a second copy of the backup to the specified folder.

.PARAMETER Version1
    Use it to save the content of Windows Admin Center V1 otherwise V2.

.PARAMETER DoNotReStartService
    Use it to not restart the Windows Admin Center service after saving.
#>
function Save-WACResource() {
    [CmdletBinding()]
    param(
        [string]$FolderPath = "WACBackup",
        [string]$BackupPath,
        [switch]$Version1,
        [switch]$DoNotReStartService
    )

    function Remove-WACv1DesktopShortcut {
        $currentUserDesktopPath = [Environment]::GetFolderPath("Desktop")
        $publicDesktopPath = [System.IO.Path]::Combine([Environment]::GetFolderPath("CommonDesktopDirectory"))
        $desktopShortcutsPaths = @("$currentUserDesktopPath\Windows Admin Center.lnk", "$publicDesktopPath\Windows Admin Center.lnk")
        foreach ($shortcutPath in $desktopShortcutsPaths) {
            if (Test-Path -Path $shortcutPath) {
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($shortcutPath)
                $targetPath = $shortcut.TargetPath
                if ($targetPath -eq $WacV1DesktopExePath) {
                    Remove-Item -Path $shortcutPath -Force
                }
            }
        }
    }

    if (-not (Test-Path -Path $FolderPath)) {
        New-Item -Path $FolderPath -ItemType Directory | Out-Null
    }

    $settingsPath = Join-Path $FolderPath "Settings.json"
    $extensionsConfigPath = Join-Path $FolderPath "Extensions.json"
    $databasePath = Join-Path $FolderPath "Database.json"

    if ($Version1) {
        $service = Get-Service -Name ServerManagementGateway -ErrorAction SilentlyContinue
        if ($null -ne $service) {
            $service | Stop-Service -Force
            $service | Set-Service -StartupType Manual
        }
        else {
            $desktop = Get-Process -Name SmeDesktop -ErrorAction SilentlyContinue
            if ($null -ne $desktop) {
                $desktop | Stop-Process -Force
            }
            Remove-WACv1DesktopShortcut
        }
    }
    else {
        $service = Get-Service -Name WindowsAdminCenter -ErrorAction SilentlyContinue
        if ($null -ne $service) {
            $service | Stop-Service -Force
        }
    }

    Export-WACExtensions -Version1:$Version1 -Path $extensionsConfigPath
    Export-WACDatabase -Version1:$Version1 -Path $databasePath
    Export-WACSettings -Version1:$Version1 -Path $settingsPath

    if (-not [string]::IsNullOrEmpty($BackupPath)) {
        if (Test-Path -Path $BackupPath) {
            Remove-Item -Path $BackupPath -Force -Recurse
        }

        New-Item -ItemType Directory -Path $BackupPath | Out-Null
        Copy-Item -Path "$FolderPath\*" -Destination $BackupPath -Force
    }

    if (-not $DoNotReStartService -and ($null -ne $service)) {
        Start-Service -Name $service.Name
    }
}

<#
.SYNOPSIS
    Restore the settings, extensions and database of Windows Admin Center V2.

.DESCRIPTION
    Restore the settings, extensions and database of Windows Admin Center V2. V1 is not supported.

.PARAMETER FolderPath
    Use it to specify the folder path of saved files. Default is "WACBackup" of current folder.

.PARAMETER RestoreSettings
    Use it to restore the settings.

.PARAMETER RestoreExtensions
    Use it to restore the extensions.

.PARAMETER RestoreDatabase
    Use it to restore the database.
 #>
function Restore-WACResource() {
    [CmdletBinding()]
    param(
        [string]$FolderPath = "WACBackup",
        [switch]$RestoreSettings,
        [switch]$RestoreExtensions,
        [switch]$RestoreDatabase
    )

    $service = Get-Service -Name WindowsAdminCenter -ErrorAction SilentlyContinue
    if ($null -eq $service) {
        throw $ResourceStrings.NoServiceMessage
    }

    if ($service.Status -eq "Running") {
        $service | Stop-Service -Force
        $service = Get-Service -Name WindowsAdminCenter
        if ($service.Status -eq "Running") {
            throw $ResourceStrings.NotStopServiceMessage
        }
    }

    if ($RestoreSettings) {
        $settingsPath = Join-Path $FolderPath "Settings.json"
        Import-WACSettings -Path $settingsPath
    }
    
    if ($RestoreDatabase) {
        $databasePath = Join-Path $FolderPath "Database.json"
        Import-WACDatabase -Path $databasePath
    }

    if ($RestoreExtensions) {
        $extensionsConfigPath = Join-Path $FolderPath "Extensions.json"
        Import-WACExtensions -Path $extensionsConfigPath
    }

    Start-Service -Name WindowsAdminCenter
}

<#
.SYNOPSIS
    Export the settings of Windows Admin Center.

.DESCRIPTION
    Export the settings of Windows Admin Center and output as JSON format.

.PARAMETER Path
    Use it to export into the file with JSON format. Default name is Settings.json.

.PARAMETER Version1
    Use it to export the settings of Windows Admin Center V1.

.PARAMETER IniPath
    Use it to export into the file with INI format that can be read by the installer.
    It only works with Version1.
#>
function Export-WACSettings() {
    [CmdletBinding()]
    param(
        [string]$Path = "Settings.json",
        [switch]$Version1,
        [string]$IniPath
    )

    # registry and certificate information
    $httpsSysV2 = [PSCustomObject]@{ applicationId = $WacApplicationIdV2; urlacl = $WacNetworkServiceV2; }
    if (Test-Path -Path $WacAppSettingsFilePath) {
        $selfSignedCertificateV2 = Get-WACSelfSignedCertificate
        $settings = Get-Content -Path $WacAppSettingsFilePath | ConvertFrom-Json
        Import-Module -Name $WacConfigModulePath -Verbose:$false
        $loginMode = Get-WACLoginMode
        $portV2 = (Get-WACHttpsPorts).WacPort
        $httpsSysV2 | Add-Member -MemberType NoteProperty -Name loginMode -Value $loginMode
        $httpsSysV2 | Add-Member -MemberType NoteProperty -Name port -Value $portV2
        if ($loginMode -eq $WacWindowsAuthenticationMode) {
            $result = InvokeWinCommand -Command netsh -Parameters @("http", "show", "sslcert", "ipport=0.0.0.0:$portV2")
            $thumbprintV2 = (($result -split '\r?\n') | Where-Object { $_.Contains("Certificate Hash") } ).Split(":")[1].Trim()
            $selfSignedThumbprintV2 = $selfSignedCertificateV2.Thumbprint
            $selfSignedV2 = $thumbprintV2 -ieq $selfSignedThumbprintV2
        }
        else {
            $subjectNameV2 = "CN=$(Get-WACCertificateSubjectName)"
            if ($selfSignedCertificateV2.SubjectName.Name -eq $subjectNameV2) {
                $selfSignedV2 = $true
                $thumbprintV2 = $selfSignedCertificateV2.Thumbprint
            }
            else {
                $selfSignedV2 = $false
                $certsV2 = Get-Item "Cert:\LocalMachine\my\*" | Where-Object { $_.Subject -eq $subjectNameV2 }
                if ($null -ne $certsV2 -and $certsV2.Count -eq 1) {
                    $thumbprintV2 = $certsV2.Thumbprint
                    $subjectNameV2 = $certsV2.SubjectName.Name
                }
                else {
                    $thumbprintV2 = ""
                }
            }
        }
        
        $httpsSysV2 | Add-Member -MemberType NoteProperty -Name thumbprint -Value $thumbprintV2
        $httpsSysV2 | Add-Member -MemberType NoteProperty -Name selfSigned -Value $selfSignedV2
        $httpsSysV2 | Add-Member -MemberType NoteProperty -Name subjectName -Value $subjectNameV2
        Write-Verbose "Found V2 port number: $portV2, Thumbprint: $thumbprintV2, SelfSigned: $selfSignedV2"
    }

    if ($Version1) {
        $registry = [PSCustomObject]@{}
        foreach ($property in (get-item -Path $WacRegistryPath).Property) {
            $value = Get-ItemPropertyValue -Path $WacRegistryPath -Name $property
            $registry | Add-Member -Type NoteProperty -Name $property -Value $value
        }

        if ($registry.WebSocketValidationOverride -ne "*") {
            UpdateMigrationStatus -FolderPath $folderPath -State "InProgress" -Title $ResourceStrings.WebSocketSettingsReviewMessage  -Message $ResourceStrings.WebSocketSettingsReviewGuideMessage -Category "WebSocketValidationOverride" -Payload @{ Value = $registry.WebSocketValidationOverride }
        }

        if (-not [string]::IsNullOrEmpty($registry.Proxy)) {
            $proxyJson = ConvertFrom-Json $registry.Proxy
            if (-not [string]::IsNullOrEmpty($proxyJson.protectedData2)) {
                $payload = @{ Address = $proxyJson.address; BypassOnLocal = $proxyJson.bypassOnLocal; BypassList = $proxyJson.bypassList; }
                UpdateMigrationStatus -FolderPath $folderPath -State "InProgress" -Title $ResourceStrings.ProxySettingsReviewMessage  -Message $ResourceStrings.ProxySettingsReviewGuideMessage -Category "Proxy" -Payload $payload
            }
        }

        $portV1 = $registry.SmePort
        $result = InvokeWinCommand -Command "netsh" -Parameters @("http", "show", "sslcert", "ipport=0.0.0.0:$portV1")
        $thumbprintV1 = (($result -split '\r?\n') | Where-Object { $_.Contains("Certificate Hash") } ).Split(":")[1].Trim()
        $subjectNameV1 = (Get-Item "Cert:\LocalMachine\my\$thumbprintV1").Subject
        $selfSignedV1 = $subjectNameV1 -eq "CN=Windows Admin Center"
        Write-Verbose "Found V1 port number: $portV1, Thumbprint: $thumbprintV1, SelfSigned: $selfSignedV1"
        $urlacl = if ((Get-CimInstance -ClassName Win32_OperatingSystem).ProductType -eq 1) { $WacAuthenticatedUsersV1 } else { $WacNetworkServiceV1 }
        $httpsSysV1 = @{ port = $portV1; thumbprint = $thumbprintV1; urlacl = $urlacl; applicationId = $WacApplicationIdV1; subjectName = $subjectNameV1; selfSigned = $selfSignedV1; }
        $data = @{
            name     = $WacRegistryPath
            version1 = $true
            json     = @{ registry = $registry; httpsSysV1 = $httpsSysV1; httpsSysV2 = $httpsSysV2 }
        }
        $data | ConvertTo-Json -Depth 10 | Set-Content -Path $Path
        if (-not [string]::IsNullOrEmpty($IniPath)) {
            $ini = @{
                httpsSysV1 = $httpsSysV1;
                registry = @{}
            };
            $registry.PSObject.Properties | ForEach-Object {
                $ini["registry"][$_.Name] = $_.Value
            }
            OutIniFile -InputObject $ini -FilePath $IniPath
        }
        return
    }
    
    if (-not (Test-Path -Path $WacAppSettingsFilePath)) {
        throw $ResourceStrings.V2NotInstalledMessage
    }

    $data = @{
        name     = $WacAppSettingsFilePath;
        version1 = $false;
        json     = { settings = $settings; httpsSysV2 = $httpsSysV2 }
    }
    $data | ConvertTo-Json -Depth 10 | Set-Content -Path $Path
}

<#
.SYNOPSIS
    Import the settings of Windows Admin Center V2.

.DESCRIPTION
    Import the settings of Windows Admin Center V2 from JSON format.

.PARAMETER Path
    Use it to import from the file with JSON format. Default name is Settings.json.
#>
function Import-WACSettings() {
    [CmdletBinding()]
    param(
        [string]$Path = "Settings.json"
    )

    Import-Module -Name $WacConfigModulePath -Verbose:$false

    if (-not (Test-Path -Path $Path)) {
        throw ($ResourceStrings.CannotFindFileMessage -f $Path)
    }

    $data = Get-Content -Path $Path | ConvertFrom-Json
    if ($data.version1) {
        Write-Host "Importing V1 settings into V2."
        $registry = $data.json.registry
        $httpsSysV1 = $data.json.httpsSysV1
        $httpsSysV2 = $data.json.httpsSysV2
        if ($registry.InstallDir -ne $WacV1InstalledFolder) {
            throw ($ResourceStrings.UnexpectedInstallationFolderMessage -f $registry.InstallDir)
        }

        $portV1 = $registry.SmePort
        $portV2 = (Get-WACHttpsPorts).WacPort
        if ($portV1 -ne $portV2) {
            Write-Host "Update Port: $portV1"
            Set-WACHttpsPorts -WacPort $portV1
        }

        $loginMode = Get-WACLoginMode
        if ($loginMode -eq $WacWindowsAuthenticationMode) {
            # remove the port binding for V1
            InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "sslcert", "ipport=0.0.0.0:$portV1")
            InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "urlacl", "url=https://+:$portV1/")

            # remove the port binding for V2
            InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "sslcert", "ipport=0.0.0.0:$portV2")
            InvokeWinCommand -Command "netsh" -Parameters @("http", "delete", "urlacl", "url=https://+:$portV2/")

            # migrate the port binding.
            $thumbprint = $httpsSysV1.thumbprint
            if ($httpsSysV1.selfSigned) {
                if ([string]::IsNullOrEmpty($httpsSysV2.thumbprint)) {
                    throw "Couldn't locate thumbprint of certificate from SubjectName=$($httpsSysV2.subjectName), please validate Windows Admin Center V2 is properly configured."
                }
                else {
                    $thumbprint = $httpsSysV2.thumbprint
                    Write-Host ($ResourceStrings.SelfSignedSubjectNameMessage -f $httpsSysV2.subjectName)
                }
            }

            Register-WACHttpSys -Thumbprint $thumbprint -Port $portV1
            Write-Host $ResourceStrings.PortMigratedMessage
        }
        else {
            if (-not $httpsSysV1.selfSigned) {
                Set-WACCertificateSubjectName -Thumbprint $httpsSysV1.thumbprint
                Write-Host $MigratedPreInstalledCertifateMessage
            }
        }
        
        Write-Host "Port: $portV1."

        $autoUpdateMode = if ($registry.SmeAutoUpdate -eq "1") { "Automatic" } else { "Manual" }
        Set-WACSoftwareUpdateMode -Mode $autoUpdateMode
        Write-Host "Software Update Mode: $autoUpdateMode"

        $telemetryPrivacyType = $registry.SmeTelemetryPrivacyType
        Set-WACTelemetryPrivacy -Mode $telemetryPrivacyType
        Write-Host "Telemetry Privacy Mode: $telemetryPrivacyType"

        $winRmHttps = ($registry.WinRMHTTPS -eq "1")
        Set-WACWinRmOverHttps -Enabled:$winRmHttps
        Write-Host "WinRM Over HTTPS: $winRmHttps"

        $webSocketValidationOverride = $registry.WebSocketValidationOverride
        if ($webSocketValidationOverride -ne "*") {
            ## User must review the settings.
            Write-Verbose $ResourceStrings.WebSocketSettingsReviewMessage
            Write-Verbose $ResourceStrings.WebSocketSettingsReviewGuideMessage
        }

        $proxy = $registry.Proxy
        if (-not [string]::IsNullOrEmpty($proxy)) {
            ## {
            ##    "address":"<Proxy Url>",
            ##    "bypassOnLocal": <true|false>,
            ##    "bypassList":[<list of bypass address>],
            ##    "protectedData2":"<encrypted>"
            ## }
            $proxyJson = ConvertFrom-Json $proxy
            Write-Host "Proxy: address=$($proxyJson.address), bypassOnLocal=$($proxyJson.bypassOnLocal), bypassList=$($proxyJson.bypassList -join ',')"
            if ([string]::IsNullOrEmpty($proxyJson.protectedData2)) {
                # there is no credentials so it can set.
                Set-WACProxy -Address $proxyJson.address -BypassOnLocal $proxyJson.bypassOnLocal -BypassList $proxyJson.bypassList
            }
            else {
                ## User must review the settings.
                Write-Verbose $ResourceStrings.ProxySettingsReviewMessage
                Write-Verbose $ResourceStrings.ProxySettingsReviewGuideMessage
            }
        }

        return
    }

    $json = $data.json
    $json.settings | ConvertTo-Json -Depth 10 | Set-Content -Path $WacAppSettingsFilePath
}

<#
.SYNOPSIS
    Export the extensions of Windows Admin Center V2.

.DESCRIPTION
    Export the extensions of Windows Admin Center V2 and output as JSON format.

.PARAMETER Path
    Use it to export into the file with JSON format. Default name is Extensions.json.

.PARAMETER Version1
    Use it to export the extensions of Windows Admin Center V1.
#>
function Export-WACExtensions() {
    [CmdletBinding()]
    param(
        [string]$Path = "Extensions.json",
        [switch]$Version1
    )

    if ($Version1) {
        $extensionsConfigPath = $WacV1ExtensionConfigPath
    }
    else {
        $extensionsConfigPath = $WacV2ExtensionConfigPath
    }

    if (-not (Test-Path -Path $extensionsConfigPath)) {
        if ($Version1) {
            # V1 is not initialized, skip migrating extensions.
            return
        }
        throw ($ResourceStrings.CannotFindFileMessage -f $extensionsConfigPath)
    }

    $folderPath = Split-Path -Path $Path -Parent
    $json = Get-Content -Path $extensionsConfigPath | ConvertFrom-Json
    UpdateMissingExtensions -FolderPath $folderPath -Json $json
    $data = @{ name = $extensionsConfigPath; version1 = $Version1.IsPresent; json = $json }
    $data | ConvertTo-Json -Depth 10 | Set-Content -Path $Path
}

<#
.SYNOPSIS
    Import the extensions of Windows Admin Center V2.

.DESCRIPTION
    Import the extensions of Windows Admin Center V2 from JSON format.

.PARAMETER Path
    Use it to import from the file with JSON format. Default name is Extensions.json.
#>
function Import-WACExtensions() {
    [CmdletBinding()]
    param(
        [string]$Path = "Extensions.json",
        [string]$Url = "https://localhost",
        [string]$Feed,
        [string]$AccessKey
    )

    if (-not (Test-Path -Path $Path)) {
        throw ($ResourceStrings.CannotFindFileMessage -f $Path)
    }

    $data = Get-Content -Path $Path | ConvertFrom-Json
    $json = $data.json
    foreach ($extension in $json.extensions) {
        if (-not $extension.isPreInstalled) {
            if ($extension.status -eq "Installed") {
                $arguments = @{ ExtensionId = $extension.Id; Endpoint = $Url; }
                if ([string]::IsNullOrEmpty($AccessKey)) {
                    $arguments["AccessKey"] = $AccessKey
                }

                if ([string]::IsNullOrEmpty($Feed)) {
                    $arguments["Feed"] = $Feed
                }

                Install-WACExtension @arguments
            }
        }
        else {
            if ($extension.status -ne "Installed") {
                ## intentionally empty lines: Remained as installed for pre-installed extensions.
            }
        }
    }
}

function UpdateMissingExtensions {
    param(
        [string]$FolderPath,
        [object]$Json
    )

    $preinstalled = @{}
    foreach ($extension in $Json.extensions) {
        if ($extension.isPreInstalled) {
            $preinstalled[$extension.id] = $extension.status
        }
    }

    $extensionsToReport = [PSCustomObject]@{
        extensions = @()
    }

    foreach ($extension in $Json.extensions) {
        if (-not $extension.isPreInstalled) {
            if ($extension.status -eq "Installed" -and ($null -eq $preinstalled[($extension.id)])) {
                $extensionsToReport.extensions += [PSCustomObject]@{
                    Id         = $extension.id
                    OldVersion = $extension.version
                }
            }
        }
    }

    if ($extensionsToReport.extensions.Count -gt 0) {
        UpdateMigrationStatus -FolderPath $folderPath -State "InProgress" -Title $ResourceStrings.ExtensionInstallationReviewMessage -Message $ResourceStrings.ExtensionInstallationReviewGuideMessage -Category "InstallExtension" -Payload $extensionsToReport
    }
}

<#
.SYNOPSIS
    Export the content of database.

.DESCRIPTION
    Export the content of database and output as JSON format.

.PARAMETER Path
    Use it to export into the file with JSON format. Default name is Database.json.

.PARAMETER Version1
    Use it to export the content of Windows Admin Center V1.

.PARAMETER Version1DatabaseFolder
    Path of Windows Admin Center V1 database.
    Default:
        - For desktop installation: "%APPDATA%\Microsoft\ServerManagementExperience"
        - For server installation:  "%SYSTEMROOT%\ServiceProfiles\NetworkService\appdata\Roaming\Microsoft\ServerManagementExperience"
#>
function Export-WACDatabase() {
    [CmdletBinding()]
    param(
        [string]$Path = "Database.json",
        [switch]$Version1,
        [string]$Version1DatabaseFolder = $null
    )

    if (-not $Path.EndsWith(".json")) {
        throw ($ResourceStrings.PathNotJsonMessage -f $Path)
    }

    if ($Version1) {
        ExportVersion1Database -Path $Path -DatabaseFolder $Version1DatabaseFolder
        return
    }

    Write-Verbose "Exporting the database to $Path."
    $parameters = @("save", "--verbose", "--filename", $Path)
    InvokeWinCommand -Command $WacToolCommand -Parameters $parameters
}

<#
.SYNOPSIS
    Import the content of database.

.DESCRIPTION
    Import the content of database from JSON format.

.PARAMETER Path
    Use it to import from the file with JSON format. Default name is Database.json.

.PARAMETER NotReset
    Use it to not reset the database before importing.
#>
function Import-WACDatabase() {
    [CmdletBinding()]
    param(
        [string]$Path = "Database.json",
        [switch]$NotReset
    )

    if (-not $Path.EndsWith(".json")) {
        throw ($ResourceStrings.PathNotJsonMessage -f $Path)
    }

    Write-Verbose "Importing the database from $Path (NotReset: $NotReset)"
    $parameters = @("restore", "--verbose", "--filename", $Path)
    if (-not $NotReset) {
        $parameters += "--reset"
    }

    InvokeWinCommand -Command $WacToolCommand -Parameters $parameters
}

<#
.SYNOPSIS
    Get the migration eligibility of Windows Admin Center V1 to V2.

.DESCRIPTION
    Used by the installer to determine if it will run the migration tool after installation.
    Return $true if the migration is eligible otherwise $false.

.PARAMETER ExitWithErrorCode
    Use exit code instead of return value to indicate the result for the installer to handle.

.EXAMPLE
    Get-WACMigrationEligibility -ExitWithErrorCode

.EXAMPLE
    Get-WACMigrationEligibility
#>
function Get-WACMigrationEligibility()
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ExitWithErrorCode
    )

    $status = GetInstalledStatus -FolderPath $WacV2MigrationFolder
    if ($status.Status -eq "Ready") {
        Write-Verbose "WAC v1 is ready to migrate to v2"
        if ($ExitWithErrorCode) {
            exit 0
        }

        return $true
    }

    Write-Verbose "WAC v1 is not ready to migrate to v2"
    Write-Verbose ($status | Out-String)
    if ($ExitWithErrorCode) {
        exit 1
    }

    return $false
}

<#
.SYNOPSIS
    Internal function reading the status of currently installed Windows Admin Center V1 and V2.

.PARAMETER FolderPath
    Use it to specify the folder path of saved files.
#>
function GetInstalledStatus() {
    param([string]$FolderPath)

    if (Test-Path -Path "$FolderPath\$WacMigrationMarkedFileName") {
        return @{
            Status  = "CannotRepeat"
            Title   = $ResourceStrings.StatusTitleCannotRepeat
            Message = $ResourceStrings.AlreadyPerformedMessage
        }
    }

    if (-not (Test-Path -Path $WacRegistryPath)) {
        return @{
            Status  = "NotInstalledV1"
            Title   = $ResourceStrings.StatusTitleNotApplicable
            Message = $ResourceStrings.NotFoundV1Message
        }
    }

    try {
        [Version]$v1Version = Get-ItemPropertyValue -Path $WacRegistryPath -Name Version
        if ($v1Version -lt [Version]"1.2.17537.0") {
            return @{
                Status  = "NotHealthyV1"
                Title   = $ResourceStrings.StatusTitleNotReady
                Message = $ResourceStrings.OlderV1Message
            }
        }

        if (-not (Test-Path -Path $WacV1ExtensionConfigPath)) {
            return @{
                Status  = "NotInitializedV1"
                Title   = $ResourceStrings.StatusTitlePartial
                Message = $ResourceStrings.V1InstallErrorMessage
            }
        }
    }
    catch {
        return @{
            Status  = "NotHealthyV1"
            Title   = $ResourceStrings.StatusTitleNotApplicable
            Message = $ResourceStrings.NotHealthV1Message
        }
    }

    if ((-not (Test-Path -Path $WacToolCommand)) -or
        (-not (Test-Path -Path $WacAppSettingsFilePath))) {
        return @{
            Status  = "NotInstalledV2"
            Title   = $ResourceStrings.StatusTitleNotReady
            Message = $ResourceStrings.NotFoundV2Message
        }
    }

    $appsettings = Get-Content -Path $WacAppSettingsFilePath | ConvertFrom-Json
    [Version]$v2Version = $appsettings.WindowsAdminCenter.System.FileVersion
    if ($v2Version -lt [Version]"2.0.0.0") {
        return @{
            Status  = "NotHealthyV2"
            Title   = $ResourceStrings.StatusTitleNotApplicable
            Message = $ResourceStrings.OlderV2Message
        }
    }

    Import-Module -Name $WacConfigModulePath -Verbose:$false
    $v2LoginMode = Get-WACLoginMode

    return @{
        Status       = "Ready"
        Title        = $ResourceStrings.StatusTitleReady
        Message      = $ResourceStrings.TransferReadyMessage -f $v1Version, $v2Version
        PortConflict = $portConflict
        LoginMode    = $v2LoginMode
    }
}

<#
.SYNOPSIS
    Internal function exporting the database content of Windows Admin Center V1.

.DESCRIPTION
    Read the Windows Admin Center V1 database and output as JSON V2 format.
    
.PARAMETER Path
    Use it to export into the file with JSON format. Default name is Database.json.

    .PARAMETER DatabaseFolder
    Path of Windows Admin Center V1 database.
    Default:
        - For desktop installation: "%APPDATA%\Microsoft\ServerManagementExperience"
        - For server installation:  "%SYSTEMROOT%\ServiceProfiles\NetworkService\appdata\Roaming\Microsoft\ServerManagementExperience"
#>
function ExportVersion1Database {
    [CmdletBinding()]
    param(
        [string]$Path = "Database.json",
        [string]$DatabaseFolder = $null
    )

    $folderPath = Split-Path -Path $Path -Parent
    if ([string]::IsNullOrEmpty($DatabaseFolder)) {
        $testPath = $WacV1NetworkServiceDatabasePath
        if (-not (Test-Path -Path $testPath)) {
            $testPath = $WacV1UserDatabasePath
        }

        $DatabaseFolder = $testPath
    }

    if (-not (Test-Path -Path "$DatabaseFolder\sme.edb")) {
        throw "Cannot find Windows Admin Center V1 database at $DatabaseFolder"
    }

    if (-not $Path.EndsWith(".json")) {
        throw "Path must be a JSON file: $Path"
    }

    $backupPath = $Path.Replace(".json", "_Original.json")
    Write-Verbose "ExportVersion1Database: Exporting Windows Admin Center V1 database from $DatabaseFolder"
    Write-Verbose "  - $Path (original: $backupPath)"
    $mainDatabasePath = "$DatabaseFolder\sme.edb"
    $tableDatabasePath = "$DatabaseFolder\TableStorage\smeTableStorage.edb"
    Write-Verbose "ExportVersion1Database: Main database: $mainDatabasePath"
    Write-Verbose "ExportVersion1Database: Table database: $tableDatabasePath"

    $data = ReadVersion1Database -path $mainDatabasePath
    Write-Verbose "ExportVersion1Database: Database count: $($data.Count)"
    $tableData = ReadVersion1DataTable -path $tableDatabasePath
    Write-Verbose "ExportVersion1Database: Data table count: $($tableData.Count)"
    $data += $tableData
    Write-Verbose "ExportVersion1Database: Total table count: $($data.Count)"
    $data | ConvertTo-Json -Depth 10 | Set-Content -Path $backupPath
    ConvertToDatabase -FolderPath $folderPath -Version1Source $data | ConvertTo-Json -Depth 10 | Set-Content -Path $Path
}

<#
.SYNOPSIS
    Internal function NormalizeValue
#>
function NormalizeValue($value) {
    if ($null -eq $value) {
        return $value
    }

    $type = $value.GetType()
    if ($type -eq [System.DBNull]) {
        return $null
    }
    elseif ($type -eq [System.Boolean]) {
        return $value
    }
    elseif ($type -eq [System.Byte]) {
        return $value
    }
    elseif ($type -eq [System.String]) {
        return $value
    }
    elseif ($type -eq [System.Byte[]]) {
        try {
            $text = [System.Text.Encoding]::UTF8.GetString($value)
            return $text;
        }
        catch {
            return $null
        }
    }

    Write-Verbose "NormalizeValue: Unexpected data type received: $value"
    return $value;
}

<#
.SYNOPSIS
    Internal function InitializeDatabaseInstance
#>
function InitializeDatabaseInstance([string]$folderPath) {
    Write-Verbose "InitializeDatabaseInstance: Initializing database at $folderPath"
    $instance = New-Object Microsoft.Database.Isam.IsamInstance -ArgumentList $folderPath, $folderPath, $folderPath, "edb", "Isam", $true, 4096
    $instance.IsamSystemParameters.EnableIndexCleanup = $true
    $instance.IsamSystemParameters.CreatePathIfNotExist = $true
    $instance.IsamSystemParameters.CircularLog = $true
    return $instance
}

<#
.SYNOPSIS
    Internal function RecoverDatabaseAndShutdownCleanly
#>
function RecoverDatabaseAndShutdownCleanly([object]$file) {
    $dataFolder = $file.DirectoryName
    Write-Verbose "RecoverDatabaseAndShutdownCleanly: Recovering database at $dataFolder"
    $recovery = New-Object Microsoft.Isam.Esent.Interop.Instance -ArgumentList $file.FullName
    $recovery.Parameters.CreatePathIfNotExist = $true
    $recovery.Parameters.LogFileDirectory = $dataFolder
    $recovery.Parameters.TempDirectory = $dataFolder
    $recovery.Parameters.SystemDirectory = $dataFolder
    $recovery.Parameters.CircularLog = $true
    $recovery.Init()

    $session = New-Object Microsoft.Isam.Esent.Interop.Session -ArgumentList $recovery
    [Microsoft.Isam.Esent.Interop.Api]::JetAttachDatabase($session, $file.FullName, [Microsoft.Isam.Esent.Interop.AttachDatabaseGrbit]::DeleteCorruptIndexes)
    [Microsoft.Isam.Esent.Interop.Api]::JetDetachDatabase($session, $file.FullName)

    $session.Dispose()
    $recovery.Dispose()
}

<#
.SYNOPSIS
    Internal function Base64Decode
#>
function Base64Decode([string]$base64EncodedData) {
    $base64EncodedBytes = [System.Convert]::FromBase64String($base64EncodedData)
    return [System.Text.Encoding]::UTF8.GetString($base64EncodedBytes)
}

<#
.SYNOPSIS
    Internal function converting a Windows Admin Center V1 database object to a new database object.

.PARAMETER FolderPath
    The folder where backup file will be created.

.PARAMETER Version1Source
    The Windows Admin Center V1 source of database object.

.OUTPUTS
    A WAC database object to serialize.
#>
function ConvertToDatabase {
    param(
        [string]$FolderPath,
        [object]$Version1Source
    )

    Write-Verbose "ConvertToDatabase: Convert Windows Admin Center V1 database to new database"
    $userProfileSettingsEntities = @()
    $connectionEntities = @()
    $aadAppTableEntities = @()
    $aadStatusEntities = @()
    $userAccountGroupEntities = @()
    
    $postInstallAzureFlag = $false;
    $postInstallAzureData = [PSCustomObject]@{}

    foreach ($item in $Version1Source) {
        $name = $item.Name
        if ([string]::IsNullOrEmpty($name)) {
            Write-Error "Empty/unexpected item in the Windows Admin Center V1 database object."
        }

        if ($name -eq "settings") {
            Write-Verbose "ConvertToDatabase: Converting settings for admin and all"
            foreach ($settings in $item.Rows) {
                $username = $settings.Name
                if ($username -ne "admin" -and $username -ne "all") {
                    throw "Settings data contain unexpected name: $username"
                }
                
                $data = $settings.Value | ConvertFrom-Json
                $serialized = $data.properties | ConvertTo-Json -Compress -Depth 10
                $userProfileSettingsEntities += [PSCustomObject]@{
                    username   = $username
                    name       = $name
                    instanceId = "singleton"
                    properties = $serialized
                    version    = $data.Version
                }
            }
        }
        elseif ($name -eq "profiles") {
            Write-Verbose "ConvertToDatabase: Converting profiles for <userId>"
            foreach ($settings in $item.Rows) {
                $username = $settings.Name
                $data = $settings.Value | ConvertFrom-Json
                $serialized = $data.properties | ConvertTo-Json -Compress -Depth 10
                $userProfileSettingsEntities += [PSCustomObject]@{
                    username   = $username
                    name       = $name
                    instanceId = "singleton"
                    properties = $serialized
                    version    = $data.Version
                }
            }
        }
        elseif ($name.EndsWith("_Connections")) {
            Write-Verbose "ConvertToDatabase: Converting Connections for $name"
            # <userId>_Connections / <nodeId>
            # Shared_Connections / <nodeId> => "<userId>: $shared$"
            $username = $name.Substring(0, $name.Length - "_Connections".Length)
            if ($username -eq "Shared") {
                $username = "`$shared`$"
            }
            
            foreach ($connection in $item.Rows) {
                $name = $connection.Name
                $serialized = $connection.Value
                $connectionEntities += [PSCustomObject]@{
                    username   = $username
                    name       = $name
                    instanceId = "singleton"
                    blob       = $serialized
                }
            }
        }
        elseif ($name -eq "AccessCatalog") {
            Write-Verbose "ConvertToDatabase: Converting AccessCatalog for UsersGroup and AdministratorsCatalog"
            foreach ($entry in $item.Rows) {
                if ($entry.Name -eq "AdministratorsGroup") {
                    $data = $entry.Value | ConvertFrom-Json
                    foreach ($group in $data) {
                        $userAccountGroupEntities += CreateGroupEntry $group 0
                    }
                    
                }
                elseif ($entry.Name -eq "UsersGroup") {
                    $data = $entry.Value | ConvertFrom-Json
                    foreach ($group in $data) {
                        $userAccountGroupEntities += CreateGroupEntry $group 1
                    }
                }
            }
        }
        elseif ($name -eq "AadCatalog") {
            if ($item.Rows.Count -eq 0) {
                Continue
            }    
            
            Write-Verbose "ConvertToDatabase: Converting AadCatalog for RedirectUrl, AppObjectId and AuthEnabled"
            $redirectUri = ""
            $appObjectId = ""
            $aadAuthEnabled = $false

            foreach ($entry in $item.Rows) {
                if ($entry.Name -eq "RedirectUri") {
                    $redirectUri = $entry.Value
                }
                elseif ($entry.Name -eq "AppObjectId") {
                    $appObjectId = $entry.Value
                }
                elseif ($entry.Name -eq "AadAuthEnabled") {
                    $aadAuthEnabled = $entry.Value -eq "True"
                }
            }

            $postInstallAzureFlag = $true
            
            $aadStatusEntity = [PSCustomObject]@{
                username       = "#Global#"
                name           = "AadStatusEntitySingleton"
                instanceId     = "singleton"
                redirectUri    = $redirectUri
                aapObjectId    = $appObjectId
                aadAuthEnabled = $aadAuthEnabled
            }

            $postInstallAzureData | Add-Member -Type NoteProperty -Name "oldRedirectUri" -Value $redirectUri

            # override old settings. AAD login will be turned off.
            $aadStatusEntity.aadAuthEnabled = $false
            $aadStatusEntities += $aadStatusEntity

            $postInstallAzureData | Add-Member -Type NoteProperty -Name "aadAuthEnabled" -Value $aadAuthEnabled
        }
        elseif ($name -eq "AadApp") {
            if ($item.Rows.Count -eq 0) {
                Continue
            }
            
            Write-Verbose "ConvertToDatabase: Converting AadApp for Created, Updated and Properties"
            $created = ""
            $updated = ""
            $properties = ""
            $config = @{}

            foreach ($entry in $item.Rows) {
                if ($entry.Name -eq "created") {
                    $created = $entry.Value
                }
                elseif ($entry.Name -eq "updated") {
                    $updated = $entry.Value
                }
                elseif ($entry.Name -eq "properties") {
                    $data = $entry.Value | ConvertFrom-Json
                    $config = CreateAppConfigEntry $data
                    $properties = $config | ConvertTo-Json -Compress -Depth 10
                }
            }

            $aadAppTableEntities += [PSCustomObject]@{
                username   = "#Global#"
                name       = "AadApp"
                instanceId = "singleton"
                created    = $created
                updated    = $updated
                properties = $properties
            }

            $postInstallAzureData | Add-Member -Type NoteProperty -Name "cloudName" -Value $config.cloudName
            $postInstallAzureData | Add-Member -Type NoteProperty -Name "authority" -Value $config.authority
            $postInstallAzureData | Add-Member -Type NoteProperty -Name "tenantId" -Value $config.tenantId
            $postInstallAzureData | Add-Member -Type NoteProperty -Name "appId" -Value $config.appId
        }
        else {
            # ignore below tables.
            # <userId>_Notifications / <topic>
            # <userId>_WorkItems / <workItemId>
        }
    }

    $dataContext = [PSCustomObject]@{
        aadAppTableEntities         = $aadAppTableEntities
        aadStatusEntities           = $aadStatusEntities
        connectionEntities          = $connectionEntities
        userProfileSettingsEntities = $userProfileSettingsEntities
        userAccountGroupEntities    = $userAccountGroupEntities
        notificationMessageEntities = @()
        workItemEntities            = @()
    }

    if ($postInstallAzureFlag) {
        UpdateMigrationStatus -FolderPath $FolderPath -State "InProgress" -Title $ResourceStrings.AadRegistrationSettingsReviewMessage  -Message $ResourceStrings.AadRegistrationSettingsReviewGuideMessage -Category "AADRegistration" -Payload $postInstallAzureData
    }
    
    return $dataContext
}

<#
.SYNOPSIS
    Internal function ReadVersion1Database
#>
function ReadVersion1Database {
    param([string]$path)

    Write-Verbose "ReadVersion1Database: Reading database: $path"
    $file = New-Object System.IO.FileInfo -ArgumentList $path
    $folderPath = "$($file.DirectoryName)\\"
    $count = 0
    do {
        try {
            $instance = InitializeDatabaseInstance($folderPath)
            $session = $instance.CreateSession()
            $session.AttachDatabase($file.FullName)
        }
        catch {
            # EsentDatabaseDirtyShutdownException
            if ($null -ne $session) {
                $session.Dispose()
                $session = $null
            }

            if ($null -ne $instance) {
                $instance.Dispose()
                $instance = $null
            }

            Start-Sleep -Seconds 1 | Out-Null
            RecoverDatabaseAndShutdownCleanly($file) | Out-Null
        }

        $count++
    } while ($null -eq $instance -and $count -lt 3)

    $data = @()
    try {
        $database = $session.OpenDatabase($file.FullName)
        try {
            foreach ($table in $database.Tables.GetEnumerator()) {
                $rows = @()
                $cursor = $database.OpenCursor($table.Name, $false)
                if ($null -ne $cursor) {
                    while ($cursor.MoveNext()) {
                        $name = NormalizeValue($cursor.Record["Key"])
                        $value = NormalizeValue($cursor.Record["Value"])
                        $rows += [PSCustomObject]@{ Name = $name; Value = $value }
                    }
                }

                $item = [PSCustomObject]@{ Name = Base64Decode($table.Name); Rows = $rows; }
                Write-Verbose "ReadVersion1Database: Table: $($item.Name) Rows: $($item.Rows.Count)"
                $data += $item
                $cursor.Dispose()
            }
        }
        finally {
            $database.Dispose()
        }
    }
    finally {
        $session.Dispose()
        $instance.Dispose()
    }
    
    Write-Verbose "ReadVersion1Database: Table total count: $($data.Count)"
    return $data
}

<#
.SYNOPSIS
    Internal function ReadVersion1DataTable
#>
function ReadVersion1DataTable {
    param([string]$path)

    Write-Verbose "ReadVersion1DataTable: Reading data table: $path"
    $file = New-Object System.IO.FileInfo -ArgumentList $path
    $folderPath = "$($file.DirectoryName)\\"
    $count = 0
    do {
        try {
            $instance = InitializeDatabaseInstance($folderPath)
            $session = $instance.CreateSession()
            $session.AttachDatabase($file.FullName)
        }
        catch {
            # EsentDatabaseDirtyShutdownException
            if ($null -ne $session) {
                $session.Dispose()
                $session = $null
            }

            if ($null -ne $instance) {
                $instance.Dispose()
                $instance = $null
            }

            Start-Sleep -Seconds 1 | Out-Null
            RecoverDatabaseAndShutdownCleanly($file) | Out-Null
        }

        $count++
    } while ($null -eq $instance -and $count -lt 3)

    $data = @()
    try {
        $database = $session.OpenDatabase($file.FullName)
        try {
            foreach ($table in $database.Tables.GetEnumerator()) {
                $rows = @()
                $cursor = $database.OpenCursor($table.Name, $false)
                if ($null -ne $cursor) {
                    do {
                        for ($i = 0; $i -lt $cursor.Names.Length; $i++) {
                            $name = $cursor.Names[$i];
                            $value = $cursor.Values[$i][0]
                            $rows += [PSCustomObject]@{ Name = $name; Value = $value; }
                        }
                    } while ($cursor.MoveNext())
                }

                $item = [PSCustomObject]@{ Name = $table.Name; Rows = $rows; }
                Write-Verbose "ReadVersion1DataTable: Table: $($item.Name) Rows: $($item.Rows.Count)"
                $data += $item
                $cursor.Dispose()
            }
        }
        finally {
            $database.Dispose()
        }
    }
    finally {
        $session.Dispose()
        $instance.Dispose()
    }
    
    Write-Verbose "ReadVersion1DataTable: Table total count: $($data.Count)"
    return $data
}

<#
.SYNOPSIS
    Internal function CreateGroupEntry
#>
function CreateGroupEntry([object]$group, $scope) {
    $type = if ($group.type -eq "SmartCardGroup") { 1 } else { 0 }
    $name = $group.Name
    $displayName = $name
    if ($name -eq "BUILTIN\Administrators") {
        $name = "S-1-5-32-544"
    }
    elseif ($name -eq "BUILTIN\Users") {
        $name = "S-1-5-32-545"
    }

    $userAccountGroupEntity = [PSCustomObject]@{
        username    = "#Global#"
        name        = $name
        instanceId  = "singleton"
        displayName = $displayName
        scope       = $scope
        type        = $type
    }
    return $userAccountGroupEntity
}

<#
.SYNOPSIS
    Internal function CreateAppConfigEntry
#>
function CreateAppConfigEntry([object]$config) {
    $appDisplayName = $config.appDisplayName
    $appId = $config.appId
    $appVerifyAddress = $config.appVerifyAddress
    $clientId = $config.clientId
    $cloudName = $config.cloudName
    $tenant = $config.tenant
    $tenantId = $config.tenantId
    if ($cloudName -eq "Azure Global" -or $cloudName -eq "AzureCloud") {
        $authority = "https://login.microsoftonline.com/"
        $cloudName = "Azure Global"
    }
    elseif ($cloudName -eq "Azure China" -or $cloudName -eq "AzureChinaCloud") {
        $authority = "https://login.partner.microsoftonline.cn/"
        $cloudName = "Azure China"
    }
    elseif ($cloudName -eq "Azure US Gov" -or $cloudName -eq "AzureUSGovernment") {
        $authority = "https://login.microsoftonline.us/"
        $cloudName = "Azure US Gov"
    }
    else {
        throw "Unexpected cloud name: $cloudName"
    }

    return [PSCustomObject]@{
        appDisplayName   = $appDisplayName
        appId            = $appId
        appVerifyAddress = $appVerifyAddress
        clientId         = $clientId
        cloudName        = $cloudName
        tenant           = $tenant
        tenantId         = $tenantId
        authority        = $authority
    }
}

<#
.SYNOPSIS
    Internal Utility function to invoke a Windows command.
    (This command is Microsoft internal use only.)
    
.DESCRIPTION
    Invokes a Windows command and generates an exception if the command returns an error. Note: only for application commands. 

.PARAMETER Command
    The name of the command we want to invoke.

.PARAMETER Parameters
    The parameters we want to pass to the command.

.EXAMPLE
    InvokeWinCommand "netsh" @("http", "delete", "sslcert", "ipport=0.0.0.0:9999")
#>
function InvokeWinCommand {
    Param(
        [string]$Command, 
        [string[]]$Parameters
    )

    try {
        Write-Verbose "$command $([System.String]::Join(" ", $Parameters))"
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo
        $startInfo.FileName = $Command
        $startInfo.RedirectStandardError = $true
        $startInfo.RedirectStandardOutput = $true
        $startInfo.UseShellExecute = $false
        $startInfo.Arguments = [System.String]::Join(" ", $Parameters)
        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $startInfo
    }
    catch {
        Write-Error $_
    }

    try {
        $process.Start() | Out-Null
    }
    catch {
        Write-Error $_
    }

    try {
        $process.WaitForExit() | Out-Null
        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()
        $output = TrimLines($stdout + "`r`n" + $stderr)
    } 
    catch {
        Write-Error $_
    }

    if ($process.ExitCode -ne 0) {
        Write-Error $_
        Write-Error $output
        return
    }

    return $output
}

function TrimLines([string]$original) {
    $lines = $original -split '\r?\n'
    $startIndex = 0
    $endIndex = 0

    for ($i = 0; $i -lt $lines.Length; $i++) {
        $startIndex = $i
        $line = $lines[$i].Trim()
        if (-not [string]::IsNullOrEmpty($line) -and -not [string]::IsNullOrWhiteSpace($line)) {
            break;
        }
    }

    for ($i = $lines.Length - 1; $i -ge 0; $i--) {
        $endIndex = $i
        $line = $lines[$i].Trim()
        if (-not [string]::IsNullOrEmpty($line) -and -not [string]::IsNullOrWhiteSpace($line)) {
            break;
        }
    }

    $newLines = @()
    for ($i = $startIndex; $i -le $endIndex; $i++) {
        $newLines += $lines[$i]
    }

    return $newLines | Out-String
}

<#
.SYNOPSIS
    Internal function to reset the migration status file. The function expects presence of the folder.
#>
function ResetMigrationStatus {
    param([string]$FolderPath)

    $path = "$FolderPath\$WacMigrationStatusFileName"
    if (Test-Path -Path $path) {
        Remove-Item -Path $path -Force
    }
    
    if (-not (Test-Path -Path $FolderPath)) {
        New-Item -Path $FolderPath -ItemType Directory -Force | Out-Null
    }

    @{ State = "NotStarted"; PostInstallState = "NotAvailable"; Count = 0; Steps = @() } | ConvertTo-Json | Set-Content -Path $path -Encoding utf8
}

<#
.SYNOPSIS
    Internal function to update the migration status where UI assistance is required.
#>
function UpdateMigrationStatus {
    param(
        [string]$FolderPath,
        [string]$State, # NotStarted, InProgress, Completed
        [string]$Title,
        [string]$Message,
        [string]$Category,
        [Object]$Payload
    )

    Write-Verbose "FolderPath: $FolderPath"
    
    $path = "$FolderPath\$WacMigrationStatusFileName"
    if (-not (Test-Path -Path $path)) {
        # If the file doesn't exist, it's not a full migration mode. Skip the status update.
        return
    }

    if ($State -eq "InProgress") {
        Write-Host -ForegroundColor Green "----------------------------------------"
        Write-Host -ForegroundColor Green $Title
        Write-Host -ForegroundColor Green " - $Message"
        Write-Host -ForegroundColor Green "----------------------------------------"
    }

    $json = Get-Content -Path $path -Encoding utf8 | ConvertFrom-Json
    $json | Add-Member -MemberType NoteProperty -Name "State" -Value $State -Force
    if (-not [string]::IsNullOrEmpty($Category)) {
        $json.Count++
        $json.Steps += @{ Title = $Title; Message = $Message; Category = $Category; State = "Pending"; Data = $Payload; }
        $json.PostInstallState = "Pending"
    }

    if ($State -eq "Completed") {
        $complatedMessage = if ($json.Count -eq 0) { $ResourceStrings.CompletedEndGuideMessage } else { $ResourceStrings.CompletedReviewGuideMessage -f $json.Count, $path }
        Write-Host -ForegroundColor Green "----------------------------------------"
        Write-Host -ForegroundColor Green $ResourceStrings.CompletedReviewMessage
        Write-Host -ForegroundColor Green " - $complatedMessage"
        Write-Host -ForegroundColor Green "----------------------------------------"
    }
   
    $json | ConvertTo-Json -Depth 100 | Set-Content -Path $path -Encoding utf8 -Force
}

<#
.DESCRIPTION
    Write the hashtable into the INI file.
    Reference: https://devblogs.microsoft.com/scripting/use-powershell-to-work-with-any-ini-file/
#>
function OutIniFile([Object]$InputObject, [string]$FilePath) {
    $output = @()

    foreach ($section in $InputObject.keys) {
        if (!($InputObject[$section].GetType().Name -eq "Hashtable")) {
            # No Sections
            $output += "$section=$($InputObject[$section])"
        } else {
            # Sections
            $output += "[$section]"
            foreach ($key in ($InputObject[$section].keys | Sort-Object)) {
                if ($key -match "^Comment[\d]+") {
                    $output += "$($InputObject[$section][$key])"
                } else {
                    $output += "$key=$($InputObject[$section][$key])"
                }
            }
            $output += ""
        }
    }
    New-Item -Path $FilePath -ItemType File -Force | Out-Null
    Set-Content -Path $FilePath -Value $output -Force
}

# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCThIWgUfahAppR
# Gb/NA4md1I1BBwDtkZFEVP/rnTjWLKCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIKdAQUR26M1v8vNLVzUEnIGY
# Jo95YdEdY3EPFQSpt5XgMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAUHvRWOuipUB+zPG0d7DKTAFE/rxRMl0FvXROjH60K17Owg8cISBD7ziA
# pZxB18Zx71RGpqYInwMzNyW24gMf1OR8E0HP/fT5JEjwbGz+ImgZjDgraY760rl6
# 7AIYFp37fldkGwV/6T3Sth8BxV+2u7dY+LlEyNVB2i0VbrvLPYBSOJIyf805Kuo8
# a3D0/AMqX3uNeCik1Qrkzmig7RQ2EoIQX+ug79s0FvrCWxWu0mGQdW7JuuBb0k/F
# hVUxYBGpogNQJBjH9ISxJPgaW8qHdYCVa2CqAr6UzXSjSKQXW4ydAC+sOWqkk2a6
# npECyBa3C0ZrZ1VAGkHzOKVu6eBngqGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCC
# F5gGCSqGSIb3DQEHAqCCF4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsq
# hkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCBo/04De9MUWe9MWIONdalXExLkbJWZVXzK1UztOkhhkgIGZ0osJD/d
# GBMyMDI0MTIwOTE4Mjk1Ni43MTJaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# Tjo1MjFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaCCEf4wggcoMIIFEKADAgECAhMzAAACAAvXqn8bKhdWAAEAAAIAMA0G
# CSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0
# MDcyNTE4MzEyMVoXDTI1MTAyMjE4MzEyMVowgdMxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9w
# ZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjUyMUEt
# MDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAr1XaadKkP2TkunoTF573
# /tF7KJM9Doiv3ccv26mqnUhmv2DM59ikET4WnRfo5biFIHc6LqrIeqCgT9fT/Gks
# 5VKO90ZQW2avh/PMHnl0kZfX/I5zdVooXHbdUUkPiZfNXszWswmL9UlWo8mzyv9L
# p9TAtw/oXOYTAxdYSqOB5Uzz1Q3A8uCpNlumQNDJGDY6cSn0MlYukXklArChq6l+
# KYrl6r/WnOqXSknABpggSsJ33oL3onmDiN9YUApZwjnNh9M6kDaneSz78/YtD/2p
# Gpx9/LXELoazEUFxhyg4KdmoWGNYwdR7/id81geOER69l5dJv71S/mH+Lxb6L692
# n8uEmAVw6fVvE+c8wjgYZblZCNPAynCnDduRLdk1jswCqjqNc3X/WIzA7GGs4HUS
# 4YIrAUx8H2A94vDNiA8AWa7Z/HSwTCyIgeVbldXYM2BtxMKq3kneRoT27NQ7Y7n8
# ZTaAje7Blfju83spGP/QWYNZ1wYzYVGRyOpdA8Wmxq5V8f5r4HaG9zPcykOyJpRZ
# y+V3RGighFmsCJXAcMziO76HinwCIjImnCFKGJ/IbLjH6J7fJXqRPbg+H6rYLZ8X
# BpmXBFH4PTakZVYxB/P+EQbL5LNw0ZIM+eufxCljV4O+nHkM+zgSx8+07BVZPBKs
# looebsmhIcBO0779kehciYMCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBSAJSTavgkj
# Kqge5xQOXn35fXd3OjAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBf
# BgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmww
# bAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0El
# MjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUF
# BwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAKPCG9njRtIqQ
# +fuECgxzWMsQOI3HvW7sV9PmEWCCOWlTuGCIzNi3ibdLZS0b2IDHg0yLrtdVuBi3
# FxVdesIXuzYyofIe/alTBdV4DhijLTXtB7NgOno7G12iO3t6jy1hPSquzGLry/2m
# EZBwIsSoS2D+H+3HCJxPDyhzMFqP+plltPACB/QNwZ7q+HGyZv3v8et+rQYg8sF3
# PTuWeDg3dR/zk1NawJ/dfFCDYlWNeCBCLvNPQBceMYXFRFKhcSUws7mFdIDDhZpx
# qyIKD2WDwFyNIGEezn+nd4kXRupeNEx+eSpJXylRD+1d45hb6PzOIF7BkcPtRtFW
# 2wXgkjLqtTWWlBkvzl2uNfYJ3CPZVaDyMDaaXgO+H6DirsJ4IG9ikId941+mWDej
# kj5aYn9QN6ROfo/HNHg1timwpFoUivqAFu6irWZFw5V+yLr8FLc7nbMa2lFSixzu
# 96zdnDsPImz0c6StbYyhKSlM3uDRi9UWydSKqnEbtJ6Mk+YuxvzprkuWQJYWfpPv
# ug+wTnioykVwc0yRVcsd4xMznnnRtZDGMSUEl9tMVnebYRshwZIyJTsBgLZmHM7q
# 2TFK/X9944SkIqyY22AcuLe0GqoNfASCIcZtzbZ/zP4lT2/N0pDbn2ffAzjZkhI+
# Qrqr983mQZWwZdr3Tk1MYElDThz2D0MwggdxMIIFWaADAgECAhMzAAAAFcXna54C
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
# Tjo1MjFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaIjCgEBMAcGBSsOAwIaAxUAjJOfLZb3ivipL3sSLlWFbLrWjmSggYMw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsF
# AAIFAOsBMG8wIhgPMjAyNDEyMDkwOTAxMzVaGA8yMDI0MTIxMDA5MDEzNVowdzA9
# BgorBgEEAYRZCgQBMS8wLTAKAgUA6wEwbwIBADAKAgEAAgIMfgIB/zAHAgEAAgIT
# 6zAKAgUA6wKB7wIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAow
# CAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQBHiiuxDkRQ
# ThcsoXR9ws/3PKBO0b2ardlfNkrPHqOpJtxbUdDREBVX0XNq5HUcDsoF3mVmZKXE
# XdMZmx0QMModwBR/8q7A0Nnj2CgL15jr0yoDQ7sn2TEZJUhNWAWLVX7h0DdglmcV
# HYBTS++r26f3GB/h26QydjKcY9YsueLjlmWNoI6ZRwe6k+5P0R5wUhQRtEpcRV5S
# Mkw/OSsh3GGqY8oO2DUqAlK4hebUgcWua13xapR4wWGzEEbBFw85TM2LDQWEW4LI
# jxg+aP7cIrRDsngWBCytPjOw+1l8uhZF2goiDdj/g0yzWbKkOXAJrPAifcEjGQRP
# M1QYBAaTzbtgMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAIAC9eqfxsqF1YAAQAAAgAwDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgm825XxM/
# CYq+LDuYXh7iMLP9v6R2KoY1EFEgY80XmUwwgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCDUyO3sNZ3burBNDGUCV4NfM2gH4aWuRudIk/9KAk/ZJzCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAACAAvXqn8bKhdWAAEA
# AAIAMCIEIPKNzIg+1vOLIYNJCzj2Njc2NO5+0l7ipFPTgDhFrma1MA0GCSqGSIb3
# DQEBCwUABIICAH/5MS01UIHvHzR8bnSUg3jgIH+O34qaylfLLAKuBZ4pFhTVDMoq
# 9BxOAYxrRQGHbhen1YcmvcRNCoZnDhQ71IszBU46ScJi16VxQBnGi1lZQwHRmpiP
# +/ULsx9AwJCRcK/KrgwWII+Ir/jaXFNof/JI6nO6uzqvUguurgEm39roV5bLwfPU
# v0J4uwQe9Fvvue2URZQP8aDq/AVKp8QLk1OSHe0NBqDyKXMgt2ojEFG2BdR9xstr
# vhQvVZGeeGBhvvEHVEju7klA1JhlvMN3Xpqy6tV7EpKW/oc/6jKE3Ul09QhNUcrr
# R8oDu7uwlp5dukcQiLsupBsRpyu8nfJiqRKz0GoYB0d7SDPXgAjgYqhjNmQNe1dj
# UUeree6iH+bWeg3ZJk8F+ECl8kaUXlqs54T3d3FMh4BHVM3hni318L5b5ZK5x0/9
# jHPo6T7+oQWSO9O4wBdBjntx+BGakVHBojjBgEGM5JS9SlNwTXm7gnYXkcyWevIC
# x35sif+gu5Illf095jQrj5kfvAu/oIM9ClKHD+g69sigmZK+5rAjW/inK46rvKwg
# JFtz4QHT26fMGECEeseX/yP4pglcV/v5iRho/bz6L49xrNzBFi0yjoOUzoUZl3js
# XtdqKNic4VDnGmr1v+xX5gbed8/TMe3olyArto7h7sI34UEyWl5hAL3f
# SIG # End signature block
