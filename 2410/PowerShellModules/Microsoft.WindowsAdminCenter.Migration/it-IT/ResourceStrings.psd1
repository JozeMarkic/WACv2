ConvertFrom-StringData @'
AadRegistrationSettingsReviewGuideMessage=Aggiungere come URI di reindirizzamento aggiuntivo il percorso locale '/signin-oidc', (ad esempio https://wac-portal-site.contoso.com/signin-oidc) nella registrazione app Azure per abilitare l'accesso ad Azure AD.
AadRegistrationSettingsReviewMessage=app Azure'impostazione di registrazione deve essere verificata dopo la migrazione.
AlreadyPerformedMessage=Sembra che la migrazione sia già stata eseguita.
BindingRemovedMessage=Il binding della porta HTTP di Windows Admin Center V1 è stato rimosso. Per ripristinare Windows Admin Center V1, disinstalla Windows Admin Center V2 e usa Restore-WACV1Environment.
CannotFindFileMessage=Impossibile trovare il file in {0}
CompletedEndGuideMessage=Non è rimasta alcuna attività.
CompletedMigrationMessage=Migrazione completata. Lo stato più recente è stato salvato in {0} e {1}.
CompletedReviewGuideMessage=Vedi {0} attività rimanente/i dal file '{1}'.
CompletedReviewMessage=La migrazione è stata completata.
ExtensionInstallationReviewGuideMessage=Individuare e installare manualmente il pacchetto di estensioni in questo elenco da Windows Admin Center'interfaccia utente.
ExtensionInstallationReviewMessage=Il pacchetto di estensione deve essere installato dopo la migrazione.
ForcedMessage=È stata effettuata la migrazione forzata. Esamina una volta gli elementi mancanti nella migrazione precedente.
MigratedPreInstalledCertifateMessage=È stata eseguita la migrazione dei certificati preinstallati da WACv1.
MigrationStartMessage=La migrazione richiede Windows Admin Center V2 è preinstallata e configurata e non verrà disinstallata Windows Admin Center V1.
MigrationStartMessage1= 1) In caso di trasferimento dello stesso numero di porta in modalità autenticazione di Windows (NTLM), verrà rimossa l'associazione di porte HTTP di Windows Admin Center V1 e, se è necessario ripristinare Windows Admin Center V1, è possibile usare il comando Restore-WACV1Environment.
MigrationStartMessage2= 2) La migrazione ripristinerà Windows Admin Center V2 per le categorie selezionate e potrebbe sovrascrivere e rimuovere i dati correnti in Windows Admin Center V2. Esistono due categorie, ad esempio impostazioni e database. Puoi ignorare interattivamente una categoria ai messaggi di richiesta.
MigrationTitle=Migrazione a Windows Admin Center V2. (NonInteractive: {0})
MigrationWasNotMessage=La migrazione non è stata ancora eseguita nel sistema.
NoLabel=&No
NoServiceMessage=Impossibile trovare o accedere al servizio WindowsAdminCenter.
NotFoundV1Message=Lo strumento non è riuscito a trovare la Windows Admin Center V1 preinstallta.
NotFoundV2Message=Windows Admin Center V2 non è installato. È necessario preinstallare manualmente Windows Admin Center V2. Usa un numero di porta temporaneo, il numero di porta originale del trasferimento della migrazione per Windows Admin Center V2.
NotHealthV1Message=Non è stato possibile trovare la proprietà di Windows Admin Center V1.
NotStopServiceMessage=Impossibile arrestare il servizio WindowsAdminCenter.
OlderV1Message=È installata una versione precedente di Windows Admin Center V1. Prima della migrazione, è necessario eseguire l'aggiornamento alla versione più recente di Windows Admin Center V1.
OlderV2Message=È installata una versione precedente di Windows Admin Center V2. Prima della migrazione, è necessario eseguire l'aggiornamento alla versione più recente di Windows Admin Center V2.
PathNotJsonMessage=Il percorso deve essere un file JSON: {0}
PortMigratedMessage=È stata eseguita la migrazione del binding di porte in WindowsAuthentication.
ProxySettingsReviewGuideMessage=Per riconfigurare un proxy con le credenziali, visitare il menu Impostazioni proxy Internet Windows Admin Center'interfaccia utente.
ProxySettingsReviewMessage=La configurazione del proxy deve essere verificata dopo la migrazione.
QuitAllMessage=Chiudi tutte
QuitLabel=&Esci
QuitMigrationMessage=Chiudi la migrazione. Il trasferimento è stato annullato.
SaveStateV1Message=Lo stato di Windows Admin Center V1 e V2 è stato salvato in {0}
SelfSignedSubjectNameMessage=Windows Admin Center utilizza un certificato autofirmato. La migrazione usa il certificato autofirmato corrente, SubjectName={0}.
SkipDatabaseMessage=Ignora l'aggiornamento del database.
SkipLabel=&Ignora
SkipSettingsMessage=Ignora l'aggiornamento della configurazione e delle impostazioni.
StatusTitleCannotRepeat=Non è possibile ripetere la migrazione
StatusTitleNotApplicable=La migrazione non è applicabile nel sistema
StatusTitleNotReady=La migrazione non è pronta nel sistema
StatusTitlePartial=La migrazione è stata parzialmente completata nel sistema
StatusTitleReady=La migrazione è pronta nel sistema
StopV1ProceedMessage=Arresta Windows AdminCenter V1 e procedi con la migrazione.
StopWindowsAdminCenterV1Message=Avvia il salvataggio dello stato corrente. L'operazione verrà interrotta Windows Admin Center V1.
SureProceedMessage=Vuoi continuare?
TransferReadyMessage=Trasferimento di tutti i dati di configurazione da V1 ({0}) a V2 ({1})
TransferringStatusMessage=Trasferimento: (impostazioni: {0}), (database: {1})
UnexpectedInstallationFolderMessage=InstallDir imprevisto: {0}
UpdateDatabaseMessage=Aggiorna e reimposta il database.
UpdateSettingsMessage=Aggiorna la configurazione e le impostazioni.
UpdatingDatabaseMessage=Aggiornamento e reimpostazione del contenuto del database. Questa operazione potrebbe sovrascrivere e rimuovere i dati esistenti, inclusa la registrazione app Azure da Windows Admin Center V2.
UpdatingSettingsMessage=Aggiornamento della configurazione e delle impostazioni. Se si seleziona questa opzione, il numero di porta verrà trasferito a Windows Admin Center V2.
V1InstallErrorMessage=Windows Admin Center V1 non è stato inizializzato correttamente; è necessario usare Windows Admin Center V1 almeno una volta dopo l'installazione o l'aggiornamento per inizializzare l'ambiente. Verrà eseguita la migrazione parziale di Windows Admin Center V1 senza le impostazioni delle estensioni.
V1StoppedMessage=Windows Admin Center V1 sono stati arrestati ma non disinstallati.
V2GuideMessage=Testare ora Windows Admin Center V2. Se è tutto a posto, è possibile disinstallare Windows Admin Center V1.
V2NotInstalledMessage=Windows Admin Center V2 non è stato installato.
WantToUpdateMessage=Vuoi aggiornarli?
WebSocketSettingsReviewGuideMessage=Aggiungi manualmente tutte le origini consentite in WebSocketAllowedOrigins del file %Program Files%\\WindowsAdminCenter\\Service\\appsettings.json. Imposta tutti i valori di intestazione di origine consentiti per le richieste WebSocket per impedire l'hijack di WebSocket tra siti. Per impostazione predefinita, sono consentite tutte le origini.
WebSocketSettingsReviewMessage=La configurazione di WebSocket deve essere verificata dopo la migrazione.
WindowAuthenticationMessage=Windows Admin Center V2 è configurato con l'autenticazione di Windows (NTLM). Per eseguire la migrazione della porta, verrà eseguito il binging delle porte di Windows Admin Center V1. Puoi ripristinarlo usando Restore-WACV1Environment ma dopo la disinstallazione di Windows Admin Center V2.
YesLabel=&Sì
'@

# SIG # Begin signature block
# MIIoOwYJKoZIhvcNAQcCoIIoLDCCKCgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCaLC9RwtNKsaDH
# ao1Pu14VMmovOAAA4P2TneahBOwtBKCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGgwwghoIAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIOMc
# 6aE7NMpdTrqqYmqE+sGTG5blDjm5mTllU04tzX0xMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAX4MVbyS1E2s0qAT1H41yuQx1AVVRI7c2WRwD
# 2izJAdcR6rzSggLpkqivKSUM8FxmpwL0k3QPmZ0yPz1sq0QJZe8tsFIqa4aS3xf6
# FAycpj2Ll+9Pf2Co/DbC4aWEzwbNmu8OGt3oXULvr40LCvWO6791GTMsnPFv9aDo
# wx2grTRkFknfdTr2GCFCKkRO2cUvuprC+fIvwCX64IwwsmwmQU4Ao/zEQ78ZTDce
# ZPwcDCYUe8ZHKMSduLcBFu21Jbw+yBapr3SqeLubN6tslPqaSHVqJ/hte4pt6ehC
# WfhybwkY3bhfUIFTPz3AePMUZ3Czi+vNPUqcREO9NyzAU5SwqqGCF5YwgheSBgor
# BgEEAYI3AwMBMYIXgjCCF34GCSqGSIb3DQEHAqCCF28wghdrAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFRBgsqhkiG9w0BCRABBKCCAUAEggE8MIIBOAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCD/6pH2wIH8dq8TJLE8Ws6TDf+L536MnoOk
# wCAJ7aoyAwIGZz9ZqM7+GBIyMDI0MTIwOTE4Mjk1OC44MlowBIACAfSggdGkgc4w
# gcsxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsT
# HE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsTHm5TaGllbGQg
# VFNTIEVTTjpFMDAyLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZaCCEe0wggcgMIIFCKADAgECAhMzAAAB7gXTAjCymp2nAAEA
# AAHuMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTIzMTIwNjE4NDU0NFoXDTI1MDMwNTE4NDU0NFowgcsxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVy
# aWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjpFMDAyLTA1
# RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAL7xvKXXooSJrzEpLi9UvtEQ
# 45HsvNgItcS1aB6rI5WWvO4TP4CgJri0EYRKNsdNcQJ4w7A/1M94popqV9NTldIa
# OkmGkbHn1/EwmhNhY/PMPQ7ZECXIGY4EGaIsNdENAkvVG24CO8KIu6VVB6I8jxXv
# 4eFNHf3VNsLVt5LHBd90ompjWieMNrCoMkCa3CwD+CapeAfAX19lZzApK5eJkFNt
# Tl9ybduGGVE3Dl3Tgt3XllbNWX9UOn+JF6sajYiz/RbCf9rd4Y50eu9/Aht+TqVW
# rBs1ATXU552fa69GMpYTB6tcvvQ64Nny8vPGvLTIR29DyTL5V+ryZ8RdL3Ttjus3
# 8dhfpwKwLayjJcbc7AK0sDujT/6Qolm46sPkdStLPeR+qAOWZbLrvPxlk+OSIMLV
# 1hbWM3vu3mJKXlanUcoGnslTxGJEj69jaLVxvlfZESTDdas1b+Nuh9cSz23huB37
# JTyyAqf0y1WdDrmzpAbvYz/JpRkbYcwjfW2b2aigfb288E72MMw4i7QvDNROQhZ+
# WB3+8RZ9M1w9YRCPt+xa5KhW4ne4GrA2ZFKmZAPNJ8xojO7KzSm9XWMVaq2rDAJx
# pj9Zexv9rGTEH/MJN0dIFQnxObeLg8z2ySK6ddj5xKofnyNaSkdtssDc5+yzt74l
# syMqZN1yOZKRvmg3ypTXAgMBAAGjggFJMIIBRTAdBgNVHQ4EFgQUEIjNPxrZ3CCe
# vfvF37a/X9x2pggwHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYD
# VR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9j
# cmwvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwG
# CCsGAQUFBwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIw
# MjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcD
# CDAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAHdnIC9rYQo5ZJWk
# GdiTNfx/wZmNo6znvsX2jXgCeH2UrLq1LfjBeg9cTJCnW/WIjusnNlUbuulTOdrL
# af1yx+fenrLuRiQeq1K6AIaZOKIGTCEV9IHIo8jTwySWC8m8pNlvrvfIZ+kXA+ND
# Bl4joQ+P84C2liRPshReoySLUJEwkqB5jjBREJxwi6N1ZGShW/gner/zsoTSo9CY
# BH1+ow3GMjdkKVXEDjCIze01WVFsX1KCk6eNWjc/8jmnwl3jWE1JULH/yPeoztot
# Iq0PM4RQ2z5m2OHOeZmBR3v8BYcOHAEd0vntMj2HueJmR85k5edxiwrEbiCvJOyF
# TobqwBilup0wT/7+DW56vtUYgdS0urdbQCebyUB9L0+q2GyRm3ngkXbwId2wWr/t
# dUG0WXEv8qBxDKUk2eJr5qeLFQbrTJQO3cUwZIkjfjEb00ezPcGmpJa54a0mFDlk
# 3QryO7S81WAX4O/TmyKs+DR+1Ip/0VUQKn3ejyiAXjyOHwJP8HfaXPUPpOu6TgTN
# zDsTU6G04x/sMeA8xZ/pY51id/4dpInHtlNcImxbmg6QzSwuK3EGlKkZyPZiOc3O
# cKmwQ9lq3SH7p3u6VFpZHlEcBTIUVD2NFrspZo0Z0QtOz6cdKViNh5CkrlBJeOKB
# 0qUtA8GVf73M6gYAmGhl+umOridAMIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJ
# mQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNh
# dGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1
# WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAOThpkzntHIhC3miy9ckeb0O1YLT/e6cBwfSqWxOdcjK
# NVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+Slr+uDZnhUYjDLWNE893MsAQGOhg
# fWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3oAo4bo3t1w/YJlN8OWECesSq/XJp
# rx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+tuhiJdxqD89d9P6OU8/W7IVWTe/d
# vI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0hyTD4MmPfrVUj9z6BVWYbWg7mka9
# 7aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLNueKNiOSWrAFKu75xqRdbZ2De+JKR
# Hh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZnkXftnIv231fgLrbqn427DZM9itu
# qBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n6Jl8P0zbr17C89XYcz1DTsEzOUyO
# ArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC4jMYctenIPDC+hIK12NvDMk2ZItb
# oKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6
# bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtFtvUeh17aj54WcmnGrnu3tz5q4i6t
# AgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQW
# BBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacb
# UzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3TIN9AQEwQTA/BggrBgEFBQcCARYz
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnku
# aHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIA
# QwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2
# VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwu
# bWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEw
# LTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYt
# MjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCdVX38Kq3hLB9nATEkW+Geckv8qW/q
# XBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6
# U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnue99qb74py27YP0h1AdkY3m2CDPVt
# I1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYoVSfQJL1AoL8ZthISEV09J+BAljis
# 9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTp
# kbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0
# sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/ZPkkvnNtyo4JvbMBV0lUZNlz138e
# W0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJ
# sWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7
# Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0
# dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqKOghif9lwY1NNje6CbaUFEMFxBmoQ
# tB1VM1izoXBm8qGCA1AwggI4AgEBMIH5oYHRpIHOMIHLMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmlj
# YSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046RTAwMi0wNUUw
# LUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAIijptU29+UXFtRYINDdhgrLo76ToIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQELBQACBQDrAZHlMCIY
# DzIwMjQxMjA5MTU1NzI1WhgPMjAyNDEyMTAxNTU3MjVaMHcwPQYKKwYBBAGEWQoE
# ATEvMC0wCgIFAOsBkeUCAQAwCgIBAAICCCQCAf8wBwIBAAICElUwCgIFAOsC42UC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEAnZXZMkIXLpM4ZEA1I1OxiWKL
# +TJDWKC8cdei1ZkrBb1U66jBVB6byxgcsUVLl+iuu2IkAryHILs0SpuRg5J/4Hc+
# E9MA6rYBC+lPbItCCU4LJX3ehqq7GXKW8ky8i5ZibGM9mDeeiUj1wsHMmtVAAzI6
# HkOJAVWV6r5c8Rxf6dbVq7NDXL15rmxTVwCcq3ohtvhWFaXg4onNTS5mjIKM4kWQ
# RaAoWu053hIH0p2+NaXJAerMK+aZANumLZkyF7aEr7bDAB5W3GSrF8OqbyomZhc+
# JigLGWB5VYEm7lEZ43Dqb61cF2zPW3qAmqLMrlmE+2v1PasOc1e4f5tIETAIMjGC
# BA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# 7gXTAjCymp2nAAEAAAHuMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMx
# DQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIGukZIhdYDOhZiejiCuEGTvN
# YFY1lYYIpPd/nWnMOaFHMIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQgT1B3
# FJWF+r5V1/4M+z7kQiQHP2gJL85B+UeRVGF+MCEwgZgwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAe4F0wIwspqdpwABAAAB7jAiBCBh+Sel
# 8ikB+2D81CuclqOEXAhaY0ILhJDfbpPz/VGoqDANBgkqhkiG9w0BAQsFAASCAgCF
# VRwk6ctfy5GZLHoDBzLYuR8Crc1e/+U5MbsuEyLzt0C1KKW2gQxQfLDcygMT8dWd
# QjS1aGfu9HUhgLvMjOOFoU/TaRuaTeVV4J/HR6Py2sogjvA02SdLfxqZsgQJhkz8
# aL5wN8Qmn9UlsfBsoiqRxcR7Mbjec8y4M8I+NwujefMpzm+HnZaNNYo0bE6+6nGm
# cenraewTncaGao2E2c9q1+Cstq75eoqo93S+fOmLtUGg+moVGvr/3T4wZiPOxnMt
# qRSVkdOYx7zNPwQU6NJwU7EQLiEBkPujUuCHf0/v2YgDe/hRGF07C/6a98nZI7IV
# jJffwsaQTWYdZbLVQEybPqWb8ZTD3fvjjOaYlNlemJPrVxjZcvNP7vVAwsBWA8JH
# Gqq1P/sTbQxHEs5qWnqMh1Q2Gvp8jhe2XKULegqCUI1h0FkIa83gmAFq698mxjos
# XMZpSa9PAc4wywR98wNTRArAdcyVi325hZVdZcvxJ2tL8c7WIVwsHrig/uYFY7DL
# zPlInZave5KjnCaYvZaNwAnyxLdIDryRB+dwdF4RRcOmVL34N7pT54LKwmgYtE8h
# IBjoDc6uCpUW/o3zig65sjl+rYemIwSEkN3VIQSSfbYaUD+9xNQCrs9U+uKWs1NC
# 4XSs81I+P2UsLkEZilLPZkb96N6ImziVCZDGiobE8Q==
# SIG # End signature block
