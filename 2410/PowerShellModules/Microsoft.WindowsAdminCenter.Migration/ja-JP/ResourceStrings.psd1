ConvertFrom-StringData @'
AadRegistrationSettingsReviewGuideMessage=Azure AD ?????????????Azure App Registration ????? ?? '/signin-oidc' ??????????????? URI ??????????? (?: https://wac-portal-site.contoso.com/signin-oidc)?
AadRegistrationSettingsReviewMessage=???Azure ????????????????????
AlreadyPerformedMessage=?????????????????
BindingRemovedMessage=Windows Admin Center V1 ? HTTP ??? ?????????????Windows Admin Center V1 ????????Windows Admin Center V2 ???????????Restore-WACV1Environment ??????????
CannotFindFileMessage={0} ?????????????
CompletedEndGuideMessage=????????????
CompletedMigrationMessage=??????????{0} ? {1} ???????????????
CompletedReviewGuideMessage=????????? {0} ????? '{1}' ?????????
CompletedReviewMessage=?????????????
ExtensionInstallationReviewGuideMessage=????????????????????Windows Admin Center UI ??????????????????
ExtensionInstallationReviewMessage=??????????????????????????????
ForcedMessage=?????????????????????????????????????????
MigratedPreInstalledCertifateMessage=???????????????? WACv1 ??????????
MigrationStartMessage=????Windows Admin Center V2 ??????????????????????????V1 Windows Admin Center??????????????
MigrationStartMessage1= 1) Windows ?? (NTLM) ???????????????????Windows Admin Center V1 ? HTTP ??? ????????????Windows Admin Center V1 ????????????Restore-WACV1Environment ????????????
MigrationStartMessage2= 2) ??????????????? V2 Windows Admin Center???????Windows Admin Center V2 ????????????????????????????????????????2 ????????????????? ?????? 1 ????????????????????
MigrationTitle=Windows Admin Center V2 ?????????(NonInteractive: {0})
MigrationWasNotMessage=????????????????????
NoLabel=???(&N)
NoServiceMessage=WindowsAdminCenter ??????????????????????????
NotFoundV1Message=???????????Windows Admin Center V1 ????????????
NotFoundV2Message=Windows Admin Center V2 ???????????????V2 Windows Admin Center ?????????????????????????????????????????????? Windows Admin Center V2 ???????
NotHealthV1Message=??????????? Windows Admin Center V1 ???????????????
NotStopServiceMessage=WindowsAdminCenter ????????????????
OlderV1Message=????????? Windows Admin Center V1 ????????????????????????????? Windows Admin Center V1 ??????????????????
OlderV2Message=????????? Windows Admin Center V2 ????????????????????????????? Windows Admin Center V2 ??????????????????
PathNotJsonMessage=??? JSON ??????????????: {0}
PortMigratedMessage=WindowsAuthentication ????? ????????????
ProxySettingsReviewGuideMessage=??????????????????????Windows Admin Center UI ? [??????? ??????] ????????????????
ProxySettingsReviewMessage=???????????????????????
QuitAllMessage=?????
QuitLabel=??(&Q)
QuitMigrationMessage=???????????????????????
SaveStateV1Message=Windows Admin Center V1 ? V2 ???? {0} ???????
SelfSignedSubjectNameMessage=Windows Admin Center ?????????????????????????????????????SubjectName={0}?
SkipDatabaseMessage=??????????????????
SkipLabel=????(&S)
SkipSettingsMessage=?????????????????
StatusTitleCannotRepeat=???????????????
StatusTitleNotApplicable=???????????????
StatusTitleNotReady=??????????????????
StatusTitlePartial=???????????????????
StatusTitleReady=????????????????
StopV1ProceedMessage=Windows AdminCenter V1 ??????????????
StopWindowsAdminCenterV1Message=???????????????Windows Admin Center V1 ????????
SureProceedMessage=???????
TransferReadyMessage=?????????? V1 ({0}) ?? V2 ({1}) ????????
TransferringStatusMessage=???: (??: {0})?(??????: {1})
UnexpectedInstallationFolderMessage=????? InstallDir: {0}
UpdateDatabaseMessage=???????????????????
UpdateSettingsMessage=????????????
UpdatingDatabaseMessage=?????????????????????????????????Azure ?????????????????????Windows Admin Center V2 ????????????????
UpdatingSettingsMessage=????????????????????????????????? Windows Admin Center V2 ????????
V1InstallErrorMessage=Windows Admin Center V1 ?????????????????????????????????? Windows Admin Center V1 ?????? 1 ?????????????????????Windows Admin Center V1 ??????????????????????
V1StoppedMessage=Windows Admin Center V1 ??????????????????????????
V2GuideMessage=??? V2 Windows Admin Center ??????????????????Windows Admin Center V1 ??????????????
V2NotInstalledMessage=Windows Admin Center V2 ???????????????
WantToUpdateMessage=???????
WebSocketSettingsReviewGuideMessage=??????????????? %Program Files%\\WindowsAdminCenter\\Service\\appsettings.json ????? WebSocketAllowedOrigins ??????????????????? WebSocket ???????????????WebSocket ?????????????????????????????????????????????????
WebSocketSettingsReviewMessage=???? WebSocket ???????????????
WindowAuthenticationMessage=Windows Admin Center V2 ? Windows ?? (NTLM) ?????????????????????Windows Admin Center V1 ???? ????????????Restore-WACV1Environment ??????????????????Windows Admin Center V2 ?????????????????
YesLabel=??(&Y)
'@

# SIG # Begin signature block
# MIIoPAYJKoZIhvcNAQcCoIIoLTCCKCkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCZiw1/gEWyqoce
# 7GJ2o9AGn5gKyApKVKGZcoQyt3K+BqCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
# lV0POxitAAAAAAQDMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQwOTEyMjAxMTEzWhcNMjUwOTExMjAxMTEzWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCfdGddwIOnbRYUyg03O3iz19XXZPmuhEmW/5uyEN+8mgxl+HJGeLGBR8YButGV
# LVK38RxcVcPYyFGQXcKcxgih4w4y4zJi3GvawLYHlsNExQwz+v0jgY/aejBS2EJY
# oUhLVE+UzRihV8ooxoftsmKLb2xb7BoFS6UAo3Zz4afnOdqI7FGoi7g4vx/0MIdi
# kwTn5N56TdIv3mwfkZCFmrsKpN0zR8HD8WYsvH3xKkG7u/xdqmhPPqMmnI2jOFw/
# /n2aL8W7i1Pasja8PnRXH/QaVH0M1nanL+LI9TsMb/enWfXOW65Gne5cqMN9Uofv
# ENtdwwEmJ3bZrcI9u4LZAkujAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU6m4qAkpz4641iK2irF8eWsSBcBkw
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzUwMjkyNjAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# AFFo/6E4LX51IqFuoKvUsi80QytGI5ASQ9zsPpBa0z78hutiJd6w154JkcIx/f7r
# EBK4NhD4DIFNfRiVdI7EacEs7OAS6QHF7Nt+eFRNOTtgHb9PExRy4EI/jnMwzQJV
# NokTxu2WgHr/fBsWs6G9AcIgvHjWNN3qRSrhsgEdqHc0bRDUf8UILAdEZOMBvKLC
# rmf+kJPEvPldgK7hFO/L9kmcVe67BnKejDKO73Sa56AJOhM7CkeATrJFxO9GLXos
# oKvrwBvynxAg18W+pagTAkJefzneuWSmniTurPCUE2JnvW7DalvONDOtG01sIVAB
# +ahO2wcUPa2Zm9AiDVBWTMz9XUoKMcvngi2oqbsDLhbK+pYrRUgRpNt0y1sxZsXO
# raGRF8lM2cWvtEkV5UL+TQM1ppv5unDHkW8JS+QnfPbB8dZVRyRmMQ4aY/tx5x5+
# sX6semJ//FbiclSMxSI+zINu1jYerdUwuCi+P6p7SmQmClhDM+6Q+btE2FtpsU0W
# +r6RdYFf/P+nK6j2otl9Nvr3tWLu+WXmz8MGM+18ynJ+lYbSmFWcAj7SYziAfT0s
# IwlQRFkyC71tsIZUhBHtxPliGUu362lIO0Lpe0DOrg8lspnEWOkHnCT5JEnWCbzu
# iVt8RX1IV07uIveNZuOBWLVCzWJjEGa+HhaEtavjy6i7MIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGg0wghoJAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEILZK
# PaO1lDGioiJ3sa/pFLem8XeJXDit6nZnPbHW5YNtMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAjjd51IlgRY108tKFYTRMr4DSZvPEUZLoHJyb
# bDtuZ0dv2iZ/YtGGES30H/7xS6zqQA6UViFdFr1cY/wmc1eWgy6y/9n10dVunHDV
# phibIYYBygy0uMaHwu6LZdtAhAnV/cecoxQyaOQzC7RPAGC7xD/oLl/AHwNiWrly
# 7Ynsb7FIqGCBXorvKxsVxbUJPhvUrV/DOw539810NMChj56CuB1iCCfKyyyE2pBi
# xWXmcuYoPgXDpLB/s4hohOGBGnogjsseLdU7NCA/ceAhOYDx3MP9wLGhRPGhB4Cp
# PoL+yA56Jcni96cJFXrZlxzhIjXRvjCVShU6fGRPbAytfQRrqKGCF5cwgheTBgor
# BgEEAYI3AwMBMYIXgzCCF38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCCovCd0dqhXS6Hin2XKZaJ59KQP9NuoOjsl
# GO+eCe1CswIGZ1In2feIGBMyMDI0MTIwOTE4Mjk1Ni44NDdaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046RjAwMi0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHtMIIHIDCCBQigAwIBAgITMwAAAfI+MtdkrHCRlAAB
# AAAB8jANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1NThaFw0yNTAzMDUxODQ1NThaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046RjAwMi0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC85fPLFwppYgxwYxkSEeYv
# QBtnYJTtKKj2FKxzHx0fgV6XgIIrmCWmpKl9IOzvOfJ/k6iP0RnoRo5F89Ad29ed
# zGdlWbCj1Qyx5HUHNY8yu9ElJOmdgeuNvTK4RW4wu9iB5/z2SeCuYqyX/v8z6Ppv
# 29h1ttNWsSc/KPOeuhzSAXqkA265BSFT5kykxvzB0LxoxS6oWoXWK6wx172NRJRY
# cINfXDhURvUfD70jioE92rW/OgjcOKxZkfQxLlwaFSrSnGs7XhMrp9TsUgmwsycT
# EOBdGVmf1HCD7WOaz5EEcQyIS2BpRYYwsPMbB63uHiJ158qNh1SJXuoL5wGDu/bZ
# UzN+BzcLj96ixC7wJGQMBixWH9d++V8bl10RYdXDZlljRAvS6iFwNzrahu4DrYb7
# b8M7vvwhEL0xCOvb7WFMsstscXfkdE5g+NSacphgFfcoftQ5qPD2PNVmrG38DmHD
# oYhgj9uqPLP7vnoXf7j6+LW8Von158D0Wrmk7CumucQTiHRyepEaVDnnA2GkiJoe
# h/r3fShL6CHgPoTB7oYU/d6JOncRioDYqqRfV2wlpKVO8b+VYHL8hn11JRFx6p69
# mL8BRtSZ6dG/GFEVE+fVmgxYfICUrpghyQlETJPITEBS15IsaUuW0GvXlLSofGf2
# t5DAoDkuKCbC+3VdPmlYVQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFJVbhwAm6tAx
# BM5cH8Bg0+Y64oZ5MB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQA9S6eO4HsfB00X
# pOgPabcN3QZeyipgilcQSDZ8g6VCv9FVHzdSq9XpAsljZSKNWSClhJEz5Oo3Um/t
# aPnobF+8CkAdkcLQhLdkShfr91kzy9vDPrOmlCA2FQ9jVhFaat2QM33z1p+GCP5t
# uvirFaUWzUWVDFOpo/O5zDpzoPYtTr0cFg3uXaRLT54UQ3Y4uPYXqn6wunZtUQRM
# iJMzxpUlvdfWGUtCvnW3eDBikDkix1XE98VcYIz2+5fdcvrHVeUarGXy4LRtwzmw
# psCtUh7tR6whCrVYkb6FudBdWM7TVvji7pGgfjesgnASaD/ChLux66PGwaIaF+xL
# zk0bNxsAj0uhd6QdWr6TT39m/SNZ1/UXU7kzEod0vAY3mIn8X5A4I+9/e1nBNpUR
# J6YiDKQd5YVgxsuZCWv4Qwb0mXhHIe9CubfSqZjvDawf2I229N3LstDJUSr1vGFB
# 8iQ5W8ZLM5PwT8vtsKEBwHEYmwsuWmsxkimIF5BQbSzg9wz1O6jdWTxGG0OUt1cX
# WOMJUJzyEH4WSKZHOx53qcAvD9h0U6jEF2fuBjtJ/QDrWbb4urvAfrvqNn9lH7gV
# PplqNPDIvQ8DkZ3lvbQsYqlz617e76ga7SY0w71+QP165CPdzUY36et2Sm4pvspE
# K8hllq3IYcyX0v897+X9YeecM1Pb1jCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
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
# ELQdVTNYs6FwZvKhggNQMIICOAIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJp
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkYwMDItMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQBri943cFLH2TfQEfB05SLICg74CKCBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6wFDaTAi
# GA8yMDI0MTIwOTEwMjIzM1oYDzIwMjQxMjEwMTAyMjMzWjB3MD0GCisGAQQBhFkK
# BAExLzAtMAoCBQDrAUNpAgEAMAoCAQACAhvnAgH/MAcCAQACAhNwMAoCBQDrApTp
# AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSCh
# CjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAHXGCRfvx05JYsXnhdUasEDM
# Tjj2HOqzRMVDct/9B5juMLCRUzUngCHHI7THuGpo4UeRd/MARxzA8gqFgnXETv8n
# 5BeP8KeNBgQNkMydPmi1qmkdwJtFHkw82yFg/UNm3E044oB8SmykJDsc9Hc5KGIf
# vXnAutGGtoEGsWk5Y0CcY+QX7yfPHKCCzll56h/Dv6J41qhdqtQBgkAMFWSPmiXi
# xOyftBsmU68FHpjEhipzNnZd47Hsr4FMeQe0+g2PneNN7vVfrdFzrjONA2Pj6wds
# zMVzJ1wk9YgH8GhkjOPXXPaO4orYuBpsqln1ePvNToXDeavqE0glaGCZwvckK3Mx
# ggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAA
# AfI+MtdkrHCRlAABAAAB8jANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkD
# MQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCCXNMOJBX91j3ANq2voVEmh
# JE1xw83sSBewMvWnaQtqGjCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIPja
# Ph0uMVJc04+Y4Ru5BUUbHE4suZ6nRHSUu0XXSkNEMIGYMIGApH4wfDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHyPjLXZKxwkZQAAQAAAfIwIgQghGCP
# 2iAqLKW8IbMBI+a4pNUKY2H8oRYV84KyV5dtES8wDQYJKoZIhvcNAQELBQAEggIA
# nfXcZBFe+iZUxIppNRfkigONtzwXEqURFuSCY++PzII6p6RihVYIVMWMPdEvzUJb
# T+Hnm3uQPIHfGKZ8EBiust4HCG9eRB5L2b7g/56I1qnmgFBcRf1CtrzJeD0XsaYv
# BYRyYrsEY0zAvC7fc1Oqu5WoHFKS1uR1pvWwo4Jq4bcA+DACffJglDz3iajFvT+G
# Z51bcm58Q5P7XEfKwNOZujG1tFhLPadt8+CrTYhtUVY3l6icyOa4TLdD4MsfWkUW
# V9IpCN6zp/PABw45Ff9rzLTB0kVepO8m9n87lD+pk59WW8Wk26O0YMb6+3tiXh4f
# GX70xscfiDoO9QvOkj0oJbMh5iVbOvGU+1t6vQTihwSf9nIb4rBx1DNesRROZ9Hr
# RBNqa2TSaKT78h4BiDMcVGKV32OSoIAxzlwDs9vyU0uI6AcKDRa4k7zpkOhK+rst
# +AtDJFIKlPzSrjy1JAyAAeiE22+GL+9wosF8gRBVs71X/IIFRvG9+P5ksvxMNnEZ
# w3opJpnDBGUsj4JQpuXi9KX5qzat2rlTZM/MnzyGGhan/oh6E/MLNPOJ2BosPxtp
# ErLGwg9B9FZwIhTZq6rCSmOFVTHCCcMY+ahE8zzdPse79vDOxm+qrRknmPZ9gEhi
# AXlnYeC9FDUCvCWkYOidJyPSIB1mU3fBLHNIH2ffUAU=
# SIG # End signature block
