ConvertFrom-StringData @'
AadRegistrationSettingsReviewGuideMessage=Azure AD Oturum A�mayi etkinlestirmek i�in l�tfen Azure Uygulama Kaydi�na '/signin-oidc' yerel yolu (�rn. https://wac-portal-site.contoso.com/signin-oidc) i�eren ek Y�nlendirme URI'si olarak ekleyin.
AadRegistrationSettingsReviewMessage=Azure Uygulama Kayit Ayari ge�isten sonra g�zden ge�irilmelidir.
AlreadyPerformedMessage=Ge�is islemi zaten ger�eklestirilmis gibi g�r�n�yor.
BindingRemovedMessage=Windows Admin Center V1'in HTTP baglanti noktasi baglamasi kaldirildi; Windows Admin Center V1'i kurtarmak i�in Windows Admin Center V2'yi kaldirin ve Restore-WACV1Environment'i kullanin.
CannotFindFileMessage=Dosya {0} bulunamiyor
CompletedEndGuideMessage=Kalan g�rev yok.
CompletedMigrationMessage=Ge�is tamamlandi. Son durum su anda {0} {1}.
CompletedReviewGuideMessage=L�tfen bu dosyadaki {0} kalan g�revleri '{1}' bakin.
CompletedReviewMessage=Ge�is tamamlandi.
ExtensionInstallationReviewGuideMessage=L�tfen bu listede uzantilar paketini bulun ve kullanici arabiriminden Windows Admin Center y�kleyin.
ExtensionInstallationReviewMessage=Uzanti paketi ge�isten sonra y�klenemez.
ForcedMessage=Ge�isi yinelemeye zorladi. L�tfen �nceki ge�iste nelerin eksik oldugunu bir kez g�zden ge�irin.
MigratedPreInstalledCertifateMessage=�nceden y�klenmis sertifikali WACv1'den tasindi.
MigrationStartMessage=Ge�is, Windows Admin Center V2'nin �nceden y�klenmis ve yapilandirilmis olmasini gerektirir ve V1'i Windows Admin Center kaldirmaz.
MigrationStartMessage1= 1) Windows Kimlik Dogrulamasi (NTLM) modunda ayni baglanti noktasi numarasinin aktarilmasi durumunda Windows Admin Center V1'in HTTP baglanti noktasi baglamasini kaldirilir; Windows Admin Center V1'i geri getirmeniz gerekiyorsa Restore-WACV1Environment komutunu kullanabilirsiniz.
MigrationStartMessage2= 2) Ge�is, se�ili kategoriler Windows Admin Center V2'ye sifirlar ve V2'de ge�erli verilerin �zerine yazarak Windows Admin Center olabilir. Ayarlar ve veritabani gibi iki kategori var. Istem iletilerinde bir kategoriyi etkilesimli olarak atlayin.
MigrationTitle=Windows Admin Center V2'ye ge�iriliyor. (NonInteractive: {0})
MigrationWasNotMessage=Ge�is hen�z sistemde ger�eklestirilmedi.
NoLabel=&Hayir
NoServiceMessage=WindowsAdminCenter hizmeti bulunamadi veya bu hizmete erisilemedi.
NotFoundV1Message=Ara� �nceden y�klenmis Windows Admin Center V1'i bulamadi.
NotFoundV2Message=Windows Admin Center V2 y�kl� degil. V2'ye el ile Windows Admin Center y�klemelisiniz. Ge�ici bir baglanti noktasi numarasi kullanin. Ge�isin �zg�n baglanti noktasi numarasini V2 Windows Admin Center aktarin.
NotHealthV1Message=�nceden y�klenmis Windows Admin Center V1 d�zg�n sekilde bulunamadi.
NotStopServiceMessage=WindowsAdminCenter hizmeti durdurulamadi.
OlderV1Message=Windows Admin Center V1'in eski s�r�m� y�kl�. Ge�is yapmadan �nce Windows Admin Center V1'in en son s�r�m�ne y�kseltmelisiniz.
OlderV2Message=Windows Admin Center V2'nin eski s�r�m� y�kl�. Ge�is yapmadan �nce Windows Admin Center V2'nin en son s�r�m�ne y�kseltmelisiniz.
PathNotJsonMessage=Yol bir JSON dosyasi olmalidir: {0}
PortMigratedMessage=WindowsAuthentication altinda baglanti noktasi baglamasi ge�irildi.
ProxySettingsReviewGuideMessage=Bir proxy'i kimlik bilgileriyle yeniden Windows Admin Center i�in l�tfen kullanici arabiriminde Internet Proxy ayarlari men�s�n� ziyaret edin.
ProxySettingsReviewMessage=Ge�isten sonra proxy yapilandirmasinin g�zden ge�irilmesi gerekir.
QuitAllMessage=T�m�nden �ik
QuitLabel=&�ik
QuitMigrationMessage=Ge�isi durdurun. Ge�is iptal edildi.
SaveStateV1Message=Windows Admin Center V1 ve V2'nin durumu {0} kaydedildi
SelfSignedSubjectNameMessage=Windows Admin Center otomatik olarak imzalanan bir sertifika kullaniyor. Ge�is, ge�erli otomatik olarak imzalanan sertifikayi kullaniyor, SubjectName={0}.
SkipDatabaseMessage=Veritabanini g�ncellestirmeyi atlayin.
SkipLabel=&Atla
SkipSettingsMessage=Sistem yapilandirmasini ve ayarlari g�ncellestirmeyi atlayin.
StatusTitleCannotRepeat=Ge�is yinelenemez
StatusTitleNotApplicable=Ge�is sistemde uygulanamaz
StatusTitleNotReady=Ge�is sistemde hazir degil
StatusTitlePartial=Sistemde ge�is kismen tamamlandi
StatusTitleReady=Ge�is sistemde hazir
StopV1ProceedMessage=Windows AdminCenter V1'i durdurun ve ge�ise devam edin.
StopWindowsAdminCenterV1Message=Ge�erli durumu kaydetmeye baslaniyor, V1 Windows Admin Center durdurulacak.
SureProceedMessage=Devam etmek istediginizden emin misiniz?
TransferReadyMessage=T�m yapilandirma verileri V1'den ({0}) V2'ye aktariliyor ({1})
TransferringStatusMessage=Aktarma: (Ayarlar: {0}), (Veritabani: {1})
UnexpectedInstallationFolderMessage=Beklenmeyen InstallDir: {0}
UpdateDatabaseMessage=Veritabanini g�ncellestirin ve sifirlayin.
UpdateSettingsMessage=Sistem yapilandirmasini ve ayarlari g�ncellestirin.
UpdatingDatabaseMessage=Veritabani i�erigi g�ncellestiriliyor ve sifirlaniyor. Bu, V2'de kayit dahil olmak �zere Azure Uygulamasi �zerine yazarak Windows Admin Center olabilir.
UpdatingSettingsMessage=Yapilandirma ve ayarlar g�ncellestiriliyor. Bu se�enegi belirtirseniz ge�is, baglanti noktasi numarasini V2'Windows Admin Center aktaracak.
V1InstallErrorMessage=Windows Admin Center V1 d�zg�n baslatilmadi; Windows Admin Center V1'i y�kledikten veya y�kselttikten sonra ortamini baslatmak i�in en az bir kez kullanmalisiniz. Windows Admin Center V1 uzanti ayarlari olmadan kismen ge�irilecek.
V1StoppedMessage=Windows Admin Center V1 durduruldu ancak kaldirilamadi.
V2GuideMessage=L�tfen V2 Windows Admin Center test edin, her sey yolundaysa V1'Windows Admin Center kaldirabilirsiniz.
V2NotInstalledMessage=Windows Admin Center V2 y�klenmemistir.
WantToUpdateMessage=G�ncellestirmek istiyor musunuz?
WebSocketSettingsReviewGuideMessage=L�tfen izin verilen t�m kaynaklari, %Program Files%\\WindowsAdminCenter\\Service\\appsettings.json dosyasinin WebSocketAllowedOrigins konumuna el ile olarak ekleyin. Siteler Arasi WebSocket Ele Ge�irmeyi �nlemek amaciyla WebSocket istekleri i�in izin verilen t�m kaynak baslik degerlerini ayarlayin. Varsayilan olarak t�m kaynaklara izin verilir.
WebSocketSettingsReviewMessage=Ge�isten sonra WebSocket yapilandirmasinin g�zden ge�irilmesi gerekir.
WindowAuthenticationMessage=Windows Admin Center V2, Windows Kimlik Dogrulamasi (NTLM) ile yapilandirildi. Baglanti noktasini ge�irmek i�in Windows Admin Center V1'in baglanti noktasi baglamasini kaldiracaktir. Restore-WACV1Environment'i kullanarak ancak Windows Admin Center V2'yi kaldirdiktan sonra geri getirebilirsiniz.
YesLabel=&Evet
'@

# SIG # Begin signature block
# MIIoOQYJKoZIhvcNAQcCoIIoKjCCKCYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCIW/CkoTFAbQRF
# VUq4M850wuZCqOxKXdQOp5V5UTSuVaCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGgowghoGAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIGsJ
# e1ktVa9CqG7UywYpW7zKe/N59jrDTE8zDY7e9SHxMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAEVF42caiIgW2IFau7/Rft3RVQSrOZEUr4Jec
# fQMdJYkxIzw9lm7aqC5CmK6WHTzDwsmj/4FBF/ZVBUs/wDWCetBBsFvgMGrx6YoN
# H4QRbjtpJqdYYAtQ9TffKroPEofDjAPvEa3OisAuEgqPjmwP5yhrtEWzYsIRE7P5
# u4H36r241h1Pn1F/oe5dg7hp7Yf3We1narbm1aqVjK/GJ5lBLIfZerrZLYhXJ5to
# I/LK1UJ8DAFFgYSOKZGVVtgbA9OmsWPqHiUd4MFdjFEeotpWp8qkSUXZI2/qJCW7
# Nv4LKgY17fXZ67U0qiXKWEva5KKKteqe7GJulwxZ50kE1RzSEaGCF5QwgheQBgor
# BgEEAYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCBw8o92BKP7QpI5egu+15oVpKB9IkS0Qtnk
# fm0Lu1OLQAIGZz9J4YxmGBMyMDI0MTIwOTE4Mjk1OC41MTJaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046OTYwMC0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIBAgITMwAAAe+JP1ahWMyo2gAB
# AAAB7zANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1NDhaFw0yNTAzMDUxODQ1NDhaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OTYwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCjC1jinwzgHwhOakZqy17o
# E4BIBKsm5kX4DUmCBWI0lFVpEiK5mZ2Kh59soL4ns52phFMQYGG5kypCipungwP9
# Nob4VGVE6aoMo5hZ9NytXR5ZRgb9Z8NR6EmLKICRhD4sojPMg/RnGRTcdf7/TYvy
# M10jLjmLyKEegMHfvIwPmM+AP7hzQLfExDdqCJ2u64Gd5XlnrFOku5U9jLOKk1y7
# 0c+Twt04/RLqruv1fGP8LmYmtHvrB4TcBsADXSmcFjh0VgQkX4zXFwqnIG8rgY+z
# DqJYQNZP8O1Yo4kSckHT43XC0oM40ye2+9l/rTYiDFM3nlZe2jhtOkGCO6GqiTp5
# 0xI9ITpJXi0vEek8AejT4PKMEO2bPxU63p63uZbjdN5L+lgIcCNMCNI0SIopS4ga
# VR4Sy/IoDv1vDWpe+I28/Ky8jWTeed0O3HxPJMZqX4QB3I6DnwZrHiKn6oE38tgB
# TCCAKvEoYOTg7r2lF0Iubt/3+VPvKtTCUbZPFOG8jZt9q6AFodlvQntiolYIYtqS
# rLyXAQIlXGhZ4gNcv4dv1YAilnbWA9CsnYh+OKEFr/4w4M69lI+yaoZ3L/t/UfXp
# T/+yc7hS/FolcmrGFJTBYlS4nE1cuKblwZ/UOG26SLhDONWXGZDKMJKN53oOLSSk
# 4ldR0HlsbT4heLlWlOElJQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFO1MWqKFwrCb
# trw9P8A63bAVSJzLMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQAYGZa3aCDudbk9
# EVdkP8xcQGZuIAIPRx9K1CA7uRzBt80fC0aWkuYYhQMvHHJRHUobSM4Uw3zN7fHE
# N8hhaBDb9NRaGnFWdtHxmJ9eMz6Jpn6KiIyi9U5Og7QCTZMl17n2w4eddq5vtk4r
# RWOVvpiDBGJARKiXWB9u2ix0WH2EMFGHqjIhjWUXhPgR4C6NKFNXHvWvXecJ2WXr
# JnvvQGXAfNJGETJZGpR41nUN3ijfiCSjFDxamGPsy5iYu904Hv9uuSXYd5m0Jxf2
# WNJSXkPGlNhrO27pPxgT111myAR61S3S2hc572zN9yoJEObE98Vy5KEM3ZX53cLe
# fN81F1C9p/cAKkE6u9V6ryyl/qSgxu1UqeOZCtG/iaHSKMoxM7Mq4SMFsPT/8ieO
# dwClYpcw0CjZe5KBx2xLa4B1neFib8J8/gSosjMdF3nHiyHx1YedZDtxSSgegeJs
# i0fbUgdzsVMJYvqVw52WqQNu0GRC79ZuVreUVKdCJmUMBHBpTp6VFopL0Jf4Srgg
# +zRD9iwbc9uZrn+89odpInbznYrnPKHiO26qe1ekNwl/d7ro2ItP/lghz0DoD7kE
# GeikKJWHdto7eVJoJhkrUcanTuUH08g+NYwG6S+PjBSB/NyNF6bHa/xR+ceAYhcj
# x0iBiv90Mn0JiGfnA2/hLj5evhTcAjCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
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
# ELQdVTNYs6FwZvKhggNNMIICNQIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJp
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjk2MDAtMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQBLcI81gxbea1Ex2mFbXx7ck+0g/6CBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6wGCGjAi
# GA8yMDI0MTIwOTE0NTAwMloYDzIwMjQxMjEwMTQ1MDAyWjB0MDoGCisGAQQBhFkK
# BAExLDAqMAoCBQDrAYIaAgEAMAcCAQACAgRpMAcCAQACAhQmMAoCBQDrAtOaAgEA
# MDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAI
# AgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAIlDIeBEQUqJ/vXYnO/gMRRpk+qo
# JtVSJeJJkbPuYCdcMWaukEHHxT+/4q3gSL8dfU++oqIEXy+HM91X7F1lU4TicBzR
# xLh6jGX579HsHITWQwUzYwGGp8LzurIz1NyPUAIJNduo98RHXnCAMHtOFDWbHxld
# nDgPdr/IH/34XFJ4ec/u/dTuCojx75h5gWMyUUPXD6eB+rRzMubL7bmP5qTFDOPn
# swTjAovubCJvgk0lUVrv4iq2ZeGH4UGD+TrT/qgeLCI0L7RBOzRN6rmSaS7kObX1
# Cop5pATrWJ2gN1BwH8QCgFlg4t2fKZCr2snfRK6bplNqNNKN7jVBmkVm4hsxggQN
# MIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAe+J
# P1ahWMyo2gABAAAB7zANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0G
# CyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCATVS14jK0LN+IDd/0eHA0oea+C
# bEts3GxP7FO8Q67hpjCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIPBhKEW4
# Fo3wUz09NQx2a0DbcdsX8jovM5LizHmnyX+jMIGYMIGApH4wfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAHviT9WoVjMqNoAAQAAAe8wIgQgjbpE5iqU
# WRG4zi7memZzd2vX3y9bX6Q2dwV7cJlBgjMwDQYJKoZIhvcNAQELBQAEggIATxQA
# Hz2XE79P57SzW1dBQllDM9NKctLNG5RvXrEnoYWv8ikiJAiwV/c8UNGfS2LL4fhi
# XjbtSgJKhgmg/aThvwEXvA7BqPvi9kg7jf8JQ6VB3wh3fiJcXsli4BiqQKvpgld6
# ZXla5wwbxy5KXg1SP1T2+Q/0FjDq4gSsxn8O4BDlpqt5LVcPyIWs6d3B+5XM9dZZ
# XTj+DyZve9lJsPRuOuzujOuMs/SUDHPQo2QQe+ZC378bPnHZBCnKuzA+u23hpQzu
# tPdcxePhFkb8MNe/qKBJd8R2PLYweIq+QlA8KxNyiLbealAAlEpMNMbnbvxThava
# nFw4YPYymv+lg5+TqKFkAL+EKEBTnKaCSIjNiHUyg1N6XuaxWaumlbz8Oi0g8Rdg
# ThK+8UBefpfgPBQhFpknNeQYN+JVf5a7gGSkD5A4SOoqe3jRDhlHkp/SAw1K80Q/
# XgNr8mBcy+05rcELUFwrJBKsgWLeF2tfjt8X52zn7Jl/9NxE0ybD2CwcUA02upjd
# sl0dVjbbdMQH9vtcBgTZoF9BC8Wvk4CRKX4Lvv276V+ioU5qDOBoTXqodgwzTqND
# pmkPI8/VlwhUgs+slreWRu+niuYLmypVRTBNXAP+U5hf99xf/hz6iqvI0dujLsWG
# uMcQ4jiRyVJwpZbB5HVmaHAorUrF32YD2Wbv4P8=
# SIG # End signature block
