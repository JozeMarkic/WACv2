<#########################################################################################
# Copyright (c) Microsoft Corporation. All rights reserved.
#
# Extension Tools
#
# Requires -Version 4.0
#
#########################################################################################>

add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@

$nugetVersioningDllPath = Join-Path $PSScriptRoot "..\..\Service\NuGet.Versioning.dll"
Add-Type -Path $nugetVersioningDllPath

Function CreateApplicationAccessToken {
    param(
        [PSCredential]$credentials,
        [string]$accessKey
    )

    if (($null -eq $credentials) -or [System.String]::IsNullOrEmpty($accessKey)) {
        return ""
    }

    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($credentials.Password))
    $accessHashData = "$($accessKey):$($credentials.UserName):$($password)"
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $bytes = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($accessHashData))
    $sha256.Dispose()
    $accessToken = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json @{ accessHash = [System.Convert]::ToBase64String($bytes); username = $credentials.UserName; password = $password; })))
    return $accessToken
}

Function GetAccessParameters {
    param(
        [Uri]
        $Endpoint,
        [PSCredential]
        $Credentials,
        [string]
        $AccessKey
    )

    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    $params = @{
        useBasicParsing = $true
        userAgent       = "Scripts"
    }

    # if there is no access token, it assumes it uses NTLM connection with Credentials or current user's context.
    $accessToken = CreateApplicationAccessToken -credentials $Credentials -accessKey $AccessKey
    if (-not [System.String]::IsNullOrEmpty($accessToken)) {
        $params.headers = @{ "application-acccess-token" = $accessToken; }
    }
    else {
        if ($Credentials) {
            $params.credential = $Credentials
        }
        else {
            $params.useDefaultCredentials = $True
        }
    }

    $params.uri = $Endpoint.ToString().Trim("/") + "/api/extensions";

    return $params
}

Function GetRecentVersion($extensions) {
    $recent = $extensions[0]
    $extensions | ForEach-Object { 
        if ($Null -eq $recent -Or [NuGet.Versioning.NuGetVersion]$recent.version -le [NuGet.Versioning.NuGetVersion]$_.version) { 
            $recent = $_ 
        } 
    }

    return $recent
}

<#
.SYNOPSIS
Show the feeds available in the Windows Admin Center Gateway.

.DESCRIPTION
The function list the available feeds.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Get-WACFeed -Endpoint "https://localhost:6600" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Get-WACFeed {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.uri = $params.uri.ToString() + "/configs";
    $params.method = "Get"
    $params.headers += @{ 'Accept-Encoding' = '' }
    $response = Invoke-WebRequest @params
    if ($response.StatusCode -ne 200 ) {
        throw "Failed to get the feeds. Please verify the given URI points to a valid WAC gateway endpoint."
    }

    try {
        $packageFeeds = ConvertFrom-Json $response.Content
        $packageFeeds = $packageFeeds.packageFeeds
        if ($null -eq $packageFeeds) {
            throw
        }
    }
    catch {
        throw "The response was malformed. Please verify the given URI points to a valid WAC gateway endpoint."
    }

    return $packageFeeds
}

<#
.SYNOPSIS
Add a feed to the Windows Admin Center Gateway.

.DESCRIPTION
The function add a feed.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER Feed
Required. Provide the Feed url.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Add-WACFeed -Endpoint "https://localhost:6600" -Feed "https://aka.ms/sme-extension-feed" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Add-WACFeed {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $true)]
        [String]
        $Feed,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    if ($null -eq $Credentials) {
        $commonParameters = @{ Endpoint = $Endpoint; }
    }
    else {
        $commonParameters = @{ Endpoint = $Endpoint; Credentials = $Credentials; AccessKey = $AccessKey; }
    }

    $packageFeedsRaw = Get-WACFeed @commonParameters
    $packageFeeds = [PSCustomObject]@{ packageFeeds = @($packageFeedsRaw) }
    if ($packageFeeds.packageFeeds -Contains $Feed) {
        Write-Warning "The feed '$Feed' already exist in the gateway"
        return
    }

    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.uri = $params.uri + "/configs";
    $params.method = "Put"
    $packageFeeds.packageFeeds += $Feed
    $params.body = ConvertTo-Json $packageFeeds   
    $response = Invoke-WebRequest @params -ContentType "application/json"
    if ($response.StatusCode -ne 200 ) {
        throw "Failed to add the feed in the gateway"
    }

    return [PSCustomObject]@($packageFeedsRaw)
}

<#
.SYNOPSIS
Remove a feed to the Windows Admin Center Gateway.

.DESCRIPTION
The function remove a feed.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER Feed
Required. Provide the Feed url.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Remove-Feed -Endpoint "https://localhost:6600" -Feed "https://aka.ms/sme-extension-feed" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Remove-WACFeed {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $true)]
        [String]
        $Feed,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    if ($null -eq $Credentials) {
        $commonParameters = @{ Endpoint = $Endpoint; }
    }
    else {
        $commonParameters = @{ Endpoint = $Endpoint; Credentials = $Credentials; AccessKey = $AccessKey; }
    }

    $packageFeedsRaw = Get-WACFeed @commonParameters
    $packageFeeds = [PSCustomObject]@{packageFeeds = @($packageFeedsRaw) }
    if ($packageFeeds.packageFeeds -NotContains $Feed) {
        Write-Warning "The feed '$Feed' not exist in the gateway"
    }
    else {
        $removeFeed = [PSCustomObject]@($packageFeeds.packageFeeds | Where-Object { $_ -eq $Feed })
        $params = GetAccessParameters $Endpoint $Credentials $AccessKey
        $params.uri = $params.uri + "/configs";
        $params.method = "Put"
        $packageFeeds.packageFeeds = @($packageFeeds.packageFeeds | Where-Object { $_ -Ne $Feed })
        $params.body = ConvertTo-Json $packageFeeds   
        $response = Invoke-WebRequest @params -ContentType "application/json"
        if ($response.StatusCode -ne 200 ) {
            throw "Failed to remove the feed in the gateway"
        }
    }

    return $removeFeed
}

<#
.SYNOPSIS
Show the extension available in the Windows Admin Center Gateway.

.DESCRIPTION
The function list the available extensions.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Get-WACExtension -Endpoint "https://localhost:4100" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Get-WACExtension {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.method = "Get"
    $response = Invoke-WebRequest @params
    if ($response.StatusCode -ne 200 ) {
        throw "Failed to get the extensions"
    }

    try {
        $content = ConvertFrom-Json $response.Content
        $extensions = $content.Extensions
        if ($null -eq $extensions) {
            throw
        }
    }
    catch {
        throw "The response was malformed. Please verify the given URI points to a valid WAC gateway endpoint."
    }

    return $extensions
}

<#
.SYNOPSIS
Install a Windows Admin Center Extension.

.DESCRIPTION
The function install a specific extension.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER ExtensionId
Required. Specifies the Id for the extension.

.PARAMETER Version
(Optional) Specifies a version, if is not present, The function search for the latest one.

.PARAMETER Feed
(Optional) Specifies a feed, if is not present, The function add it.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Install-Extension -Endpoint "https://localhost:4100" -ExtensionId "DataON.MUST" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Install-WACExtension {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $true)]
        [String]
        $ExtensionId,
        [Parameter(Mandatory = $false)]
        [String]
        $Version,
        [Parameter(Mandatory = $false)]
        [String]
        $Feed,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    if ($null -eq $Credentials) {
        $commonParameters = @{ Endpoint = $Endpoint; }
    }
    else {
        $commonParameters = @{ Endpoint = $Endpoint; Credentials = $Credentials; AccessKey = $AccessKey; }
    }

    $NotFoundLegend = "The extension '$ExtensionId' is not available in the "
    if ($PSBoundParameters.ContainsKey("Feed")) {
        if (-not $Feed) {
            $NotFoundLegend += "Pre-installed catalog"
            $extensions = @(Get-WACExtension @commonParameters | Where-Object { $_.id -eq $ExtensionId -and $null -eq $_.packageSource })
        }
        else {
            # Check if exist the Feed otherwise install it 
            $Feeds = Get-WACFeed @commonParameters
            if ($Feeds -NotContains $Feed) {
                Write-Warning "The feed '$Feed' not exist in the gateway, trying to add it"
                Add-WACFeed -Feed $Feed @commonParameters
            }
    
            $NotFoundLegend += "$Feed feed"
            $extensions = @(Get-WACExtension @commonParameters | Where-Object { $_.id -eq $ExtensionId -And $_.packageSource -eq $Feed })
        }
    }
    else {
        $NotFoundLegend += "current feeds"
        $extensions = @(Get-WACExtension @commonParameters | Where-Object { $_.id -eq $ExtensionId })
    }

    if (!$extensions) {
        Write-Warning $NotFoundLegend
        return
    }

    if ($Version) {
        $extensions = @($extensions | Where-Object { $_.version -eq $Version })
    }

    if (!$extensions) {
        Write-Warning "The extension: '$ExtensionId' ('$Version') is not present" 
        return
    }

    $extension = GetRecentVersion $extensions
    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.uri = $params.uri + "/" + $extension.id + "/versions/" + $extension.version + "/install";
    $params.method = "Post"
    try {
        $response = Invoke-WebRequest @params
    } 
    catch {
        $e = ConvertFrom-Json $_
        throw $e.error.message
    }

    if ($response.StatusCode -ne 200 ) {
        throw "Failed to install the extension in the gateway"
    }

    return $extension
}

<#
.SYNOPSIS
Uninstall a Windows Admin Center Extension.

.DESCRIPTION
The function uninstall the selected extension.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER ExtensionId
Required. Specifies the Id for the extension.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Uninstall-Extension -Endpoint "https://localhost:4100" -ExtensionId "DataON.MUST" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Uninstall-WACExtension {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $true)]
        [String]
        $ExtensionId,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    if ($null -eq $Credentials) {
        $commonParameters = @{ Endpoint = $Endpoint; }
    }
    else {
        $commonParameters = @{ Endpoint = $Endpoint; Credentials = $Credentials; AccessKey = $AccessKey; }
    }

    $extension = Get-WACExtension @commonParameters | Where-Object { $_.id -eq $ExtensionId -And $_.status -eq "Installed" }
    if (!$extension) {
        Write-Warning "The extension: '$ExtensionId' is not installed"
        return 
    }

    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.uri = $params.uri + "/" + $extension.id + "/versions/" + $extension.version + "/uninstall";
    $params.method = "Post"
    try {
        $response = Invoke-WebRequest @params
    } 
    catch {
        $e = ConvertFrom-Json $_
        throw $e.error.message
    }

    if ($response.StatusCode -ne 200 ) {
        throw "Failed to uninstall the extension in the gateway"
    }

    return $extension
}

<#
.SYNOPSIS
Update a Windows Admin Center Extension.

.DESCRIPTION
The function update the selected extension with the most recent version available.

.PARAMETER Endpoint
Required. Provide the gateway name.

.PARAMETER ExtensionId
Required. Specifies the Id for the extension.

.PARAMETER Feed
(Optional) Specifies a feed, if is not present, The function add it.

.PARAMETER Credentials
(Optional) Credentials to logon to Windows Admin Center. It's required if it uses the form login.

.PARAMETER AccessKey
(Optional) The access key to the endpoint for the form login. The access key can be created from Access menu of Settings on Windows Admin Center UI.

.EXAMPLE
C:\PS> Update-Extension -Endpoint "https://localhost:4100" -ExtensionId "DataON.MUST" -Credentials (Get-Credential) -AccessKey "MyAccessKey123"

#>
Function Update-WACExtension {
    [CmdletBinding(DefaultParameterSetName = 'NoAuthentication')]
    param(
        [Parameter(Mandatory = $true)]
        [Uri]
        $Endpoint,
        [Parameter(Mandatory = $true)]
        [String]
        $ExtensionId,
        [Parameter(Mandatory = $false)]
        [String]
        $Feed,
        [Parameter(Mandatory = $false, ParameterSetName = 'Authentication')]
        [PSCredential]
        $Credentials,
        [Parameter(Mandatory = $true, ParameterSetName = 'Authentication')]
        [String]
        $AccessKey
    )

    if ($null -eq $Credentials) {
        $commonParameters = @{ Endpoint = $Endpoint; }
    }
    else {
        $commonParameters = @{ Endpoint = $Endpoint; Credentials = $Credentials; AccessKey = $AccessKey; }
    }

    if ($PSBoundParameters.ContainsKey("Feed")) {
        if ($Feed) {
            $Feeds = Get-WACFeed @commonParameters
            if ($Feeds -NotContains $Feed) {
                Write-Warning "The feed '$Feed' not exist in the gateway, trying to add it"
                Add-WACFeed -Feed $Feed @commonParameters
            }
        }
    }

    $extension = Get-WACExtension @commonParameters | Where-Object { $_.id -eq $ExtensionId -And $_.status -eq "Installed" }
    if (!$extension) {
        Write-Warning "The extension: '$ExtensionId' is not installed"
        return 
    }

    $params = GetAccessParameters $Endpoint $Credentials $AccessKey
    $params.uri = $params.uri + "/" + $extension.id + "/versions/" + $extension.version + "/update";
    $params.method = "Post"
    try {
        $response = Invoke-WebRequest @params
    } 
    catch {
        $e = ConvertFrom-Json $_
        throw $e.error.message
    }

    if ($response.StatusCode -ne 200 ) {
        throw "Failed to update the extension in the gateway"
    }

    return $extension
}

# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAzx7+PSUDySiZ6
# m0eHa9zgxyXNZkcyhSnmCTIcx9nR/KCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIEjvK/TOFirP56RP0D1R9Ukd
# H85ubQVBC2djh4UI6xmtMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAaZefb87C0v+5eQ1csbUROA0V3ufEKOv6DD54X5Qz5mQWJJ9B+PQ/xHv/
# NN7yJbmYezcpjxZgg5H3lqCq4kuoEhPczxU3rSWxAaBgFZMBSLIwqqv529D8eoeF
# CJB++x4pMPf3OtX9SSnSCUpeSeEpyLm8hab2MAHRXbf3LndTgNZaJ9U5r8Cq6vbf
# tY2Bk/drLCqrVsIf6MQnAD0OixEWRyEmJpx2vkVDOi8eGWCHNN/f5V7RzFJEQTfB
# i5fkB/wKo9lBo23KKKQvTES302yuOSYtQnt44/M64tpbkw9JF99AENBX9AummDeZ
# p5vUXap2rurcQSjUQeAQ+MxapWfCpaGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCC
# F5gGCSqGSIb3DQEHAqCCF4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsq
# hkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCCQZZpc3Eigg4Ic3hu3Gyz5RQcA6ovH8gXrghEZZgxw7AIGZ0nup/+2
# GBMyMDI0MTIwOTE4Mjk1Ny4wNzlaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# TjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaCCEf4wggcoMIIFEKADAgECAhMzAAAB/XP5aFrNDGHtAAEAAAH9MA0G
# CSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0
# MDcyNTE4MzExNloXDTI1MTAyMjE4MzExNlowgdMxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9w
# ZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjJEMUEt
# MDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAoWWs+D+Ou4JjYnRHRedu
# 0MTFYzNJEVPnILzc02R3qbnujvhZgkhp+p/lymYLzkQyG2zpxYceTjIF7HiQWbt6
# FW3ARkBrthJUz05ZnKpcF31lpUEb8gUXiD2xIpo8YM+SD0S+hTP1TCA/we38yZ3B
# EtmZtcVnaLRp/Avsqg+5KI0Kw6TDJpKwTLl0VW0/23sKikeWDSnHQeTprO0zIm/b
# tagSYm3V/8zXlfxy7s/EVFdSglHGsUq8EZupUO8XbHzz7tURyiD3kOxNnw5ox1eZ
# X/c/XmW4H6b4yNmZF0wTZuw37yA1PJKOySSrXrWEh+H6++Wb6+1ltMCPoMJHUtPP
# 3Cn0CNcNvrPyJtDacqjnITrLzrsHdOLqjsH229Zkvndk0IqxBDZgMoY+Ef7ffFRP
# 2pPkrF1F9IcBkYz8hL+QjX+u4y4Uqq4UtT7VRnsqvR/x/+QLE0pcSEh/XE1w1fcp
# 6Jmq8RnHEXikycMLN/a/KYxpSP3FfFbLZuf+qIryFL0gEDytapGn1ONjVkiKpVP2
# uqVIYj4ViCjy5pLUceMeqiKgYqhpmUHCE2WssLLhdQBHdpl28+k+ZY6m4dPFnEoG
# cJHuMcIZnw4cOwixojROr+Nq71cJj7Q4L0XwPvuTHQt0oH7RKMQgmsy7CVD7v55d
# OhdHXdYsyO69dAdK+nWlyYcCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBTpDMXA4ZW8
# +yL2+3vA6RmU7oEKpDAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBf
# BgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmww
# bAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0El
# MjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUF
# BwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAY9hYX+T5AmCr
# YGaH96TdR5T52/PNOG7ySYeopv4flnDWQLhBlravAg+pjlNv5XSXZrKGv8e4s5dJ
# 5WdhfC9ywFQq4TmXnUevPXtlubZk+02BXK6/23hM0TSKs2KlhYiqzbRe8QbMfKXE
# DtvMoHSZT7r+wI2IgjYQwka+3P9VXgERwu46/czz8IR/Zq+vO5523Jld6ssVuzs9
# uwIrJhfcYBj50mXWRBcMhzajLjWDgcih0DuykPcBpoTLlOL8LpXooqnr+QLYE4Bp
# Uep3JySMYfPz2hfOL3g02WEfsOxp8ANbcdiqM31dm3vSheEkmjHA2zuM+Tgn4j5n
# +Any7IODYQkIrNVhLdML09eu1dIPhp24lFtnWTYNaFTOfMqFa3Ab8KDKicmp0Ath
# RNZVg0BPAL58+B0UcoBGKzS9jscwOTu1JmNlisOKkVUVkSJ5Fo/ctfDSPdCTVaIX
# XF7l40k1cM/X2O0JdAS97T78lYjtw/PybuzX5shxBh/RqTPvCyAhIxBVKfN/hfs4
# CIoFaqWJ0r/8SB1CGsyyIcPfEgMo8ceq1w5Zo0JfnyFi6Guo+z3LPFl/exQaRubE
# rsAUTfyBY5/5liyvjAgyDYnEB8vHO7c7Fg2tGd5hGgYs+AOoWx24+XcyxpUkAajD
# hky9Dl+8JZTjts6BcT9sYTmOodk/SgIwggdxMIIFWaADAgECAhMzAAAAFcXna54C
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
# TjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaIjCgEBMAcGBSsOAwIaAxUAoj0WtVVQUNSKoqtrjinRAsBUdoOggYMw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsF
# AAIFAOsBm7MwIhgPMjAyNDEyMDkxNjM5MTVaGA8yMDI0MTIxMDE2MzkxNVowdzA9
# BgorBgEEAYRZCgQBMS8wLTAKAgUA6wGbswIBADAKAgEAAgIPhgIB/zAHAgEAAgIU
# uDAKAgUA6wLtMwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAow
# CAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQAod6JxBqal
# PVt8Lwk0lobAcYuYlOwdkAqvwwLaamk0Wf5x/EK22jNWs16H0rQwRwFx4vleVxcE
# H5UzUGRkWaMIdFOtGJuug+Hyo0D9QyekJ8izxzlmgTMhvkVD6ryScqGc604MtZOy
# Zvtm1dmdoBcWjJAph1Cu9sB154jyvgROCfQ9boWAMPwzm5ZfM6eAOVmUU2quJDnE
# SGQTd66vrz6WZ1QAN+lvJJESAuYuCl99RnNILRQKS2F0pB4Wl2wddaV2dBhM8Wn7
# Y6WEsm8l2r4wAqJlVUZQ8EEs/DLUaN4SqZi6KYMCbybZeIOWHMM+HFpBPdI2pXBx
# Yg57b+SGEpO+MYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAH9c/loWs0MYe0AAQAAAf0wDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgC2Xjr2ii
# dnAzBVZ0qmKEY3ovkyurAbjmb14kI3gBWMgwgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCCAKEgNyUowvIfx/eDfYSupHkeF1p6GFwjKBs8lRB4NRzCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB/XP5aFrNDGHtAAEA
# AAH9MCIEIAKBHJ2Stzn0OUIa9USw4z8U4sNk3Sf+32ypYieOTVl0MA0GCSqGSIb3
# DQEBCwUABIICAJxGPi+RmC54KqpgEu6fvSBEPmC+DFA4Et+mLrx4nZLvhUaH3cef
# rSJrQtS49J8bSHnwN08oqQVYWzsqoyZfHdWL2TOaG1iDCCR3SGIRRDuJTjg6qwio
# WL1qi4kkaRa1IvHU8l9AJDKdD7fmwiw8qJOc04pdCdPAAg7usFSZCYWH6/FSymfk
# PGORXRWNHRdlYbNQJ2yndq54Vmu0XR8hNK3KEOngF6EBY1x0OpCviTng7WesCVJK
# Mq88isB6PrA+eu9xC/1wd22aRRoccEFldDS+5QynfWtJ15cSl/OXwc/XBz3FCrve
# AAzeo/5Z7SKRarhycWhynADzz3l8VefS//4M9QTZgORmaxhbc1zxeH0ngpLDAzzd
# 4N6EuMhHynOnBQpbJk/TIaoC4zwgJXP0D94oGznM1bcl/JP57zG5rrcvAsUJYfJ1
# jly0cfXjhdYIg7vM31+vSSBiMXMJFxtWovWOacESe0a8AfuvkUpBR+S8umVpiapt
# S1LmsiYQ6EfI8zmLr548GeUfYfRC+Bo1CZZ20svDroovq+KL8XKaBRJpcgUPn8W2
# 4WoMQK5ls5yCGcQ+PtfQIBRJbHJXC3f3C/vhLyPEDQuxJgsBJouUMizns/FX9lof
# 2tdr7gaKxysndWM9kglmSAtYo52F5jnmJZU/j0vSD9xLcrm1UgqQufrD
# SIG # End signature block
