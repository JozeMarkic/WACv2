ConvertFrom-StringData @'
AadRegistrationSettingsReviewGuideMessage=Tambahkan sebagai URI Pengalihan tambahan dengan jalur lokal '/signin-oidc' (mis. https://wac-portal-site.contoso.com/signin-oidc) di Pendaftaran Aplikasi Azure untuk mengaktifkan Proses Masuk Azure AD.
AadRegistrationSettingsReviewMessage=Pengaturan Pendaftaran Aplikasi Azure harus ditinjau setelah migrasi.
AlreadyPerformedMessage=Sepertinya migrasi telah dilakukan.
BindingRemovedMessage=Pengikatan port HTTP Pusat Admin Windows V1 telah dihapus, untuk memulihkan Pusat Admin Windows V1 hapus instalan Pusat Admin Windows V2 dan gunakan Restore-WACV1Environment.
CannotFindFileMessage=Tidak dapat menemukan file di {0}
CompletedEndGuideMessage=Tidak ada tugas yang tersisa.
CompletedMigrationMessage=Migrasi selesai. Status terbaru telah disimpan di {0} dan {1}.
CompletedReviewGuideMessage=Silakan lihat tugas {0} yang tersisa dari file '{1}'.
CompletedReviewMessage=Migrasi telah selesai.
ExtensionInstallationReviewGuideMessage=Silakan temukan dan instal paket ekstensi dalam daftar ini secara manual dari UI Pusat Admin Windows.
ExtensionInstallationReviewMessage=Paket ekstensi harus diinstal setelah migrasi.
ForcedMessage=Terpaksa mengulangi migrasi. Silakan tinjau apa yang hilang pada migrasi sebelumnya sekali.
MigratedPreInstalledCertifateMessage=Sertifikat yang telah diinstal sebelumnya telah dimigrasikan dari WACv1.
MigrationStartMessage=Migrasi memerlukan Windows Admin Center V2 telah diinstal dan dikonfigurasi sebelumnya, dan tidak akan menghapus instalan Windows Admin Center V1.
MigrationStartMessage1= 1) Jika Anda mentransfer nomor port yang sama dalam mode Autentikasi Windows (NTLM), hal ini akan menghapus pengikatan port HTTP Pusat Admin Windows V1 dan jika Anda perlu mengembalikan Pusat Admin Windows V1, Anda dapat menggunakan perintah Restore-WACV1Environment.
MigrationStartMessage2= 2) Migrasi akan mengatur ulang Windows Admin Center V2 untuk kategori yang dipilih, dan dapat menimpa dan menghapus data saat ini di Windows Admin Center V2. Ada dua kategori seperti pengaturan, dan database. Anda dapat secara interaktif melewati satu kategori pada pesan perintah.
MigrationTitle=Memigrasikan ke Windows Admin Center V2. (NonInteraktif: {0})
MigrationWasNotMessage=Migrasi belum dilakukan pada sistem.
NoLabel=&Tidak
NoServiceMessage=Tidak dapat menemukan atau mengakses layanan WindowsAdminCenter.
NotFoundV1Message=Alat tidak dapat menemukan Windows Admin Center V1 yang telah diinstal sebelumnya.
NotFoundV2Message=Windows Admin Center V2 tidak terinstal. Anda harus menginstal Windows Admin Center V2 secara manual. Gunakan nomor port sementara, nomor port asli transfer migrasi ke Windows Admin Center V2.
NotHealthV1Message=Tidak dapat menemukan Windows Admin Center V1 yang telah diinstal sebelumnya dengan benar.
NotStopServiceMessage=Tidak dapat menghentikan layanan WindowsAdminCenter.
OlderV1Message=Versi Lama Windows Admin Center V1 telah diinstal. Sebelum migrasi, Anda harus melakukan peningkatan ke versi terbaru Windows Admin Center V1.
OlderV2Message=Versi Lama Windows Admin Center V2 diinstal. Sebelum migrasi, Anda harus melakukan peningkatan ke versi terbaru Windows Admin Center V2.
PathNotJsonMessage=Jalur harus berupa file JSON: {0}
PortMigratedMessage=Memigrasikan pengikatan port di bawah WindowsAuthentication.
ProxySettingsReviewGuideMessage=Kunjungi menu pengaturan Proksi Internet di Windows Admin Center UI untuk mengonfigurasi ulang proksi dengan kredensial.
ProxySettingsReviewMessage=Konfigurasi proksi harus ditinjau setelah migrasi.
QuitAllMessage=Keluar dari semua
QuitLabel=&Keluar
QuitMigrationMessage=Keluar dari migrasi. Transfer dibatalkan.
SaveStateV1Message=Menyimpan status Windows Admin Center V1 dan V2 ke {0}
SelfSignedSubjectNameMessage=Pusat Admin Windows menggunakan sertifikat yang ditandatangani sendiri. Migrasi menggunakan sertifikat yang ditandatangani sendiri saat ini, SubjectName={0}.
SkipDatabaseMessage=Lewati pembaruan database.
SkipLabel=&Lewat
SkipSettingsMessage=Lewati pembaruan konfigurasi dan pengaturan.
StatusTitleCannotRepeat=Migrasi tidak dapat diulang
StatusTitleNotApplicable=Migrasi tidak berlaku pada sistem
StatusTitleNotReady=Migrasi tidak siap pada sistem
StatusTitlePartial=Migrasi telah selesai sebagian pada sistem
StatusTitleReady=Migrasi siap di sistem
StopV1ProceedMessage=Hentikan Windows AdminCenter V1 dan lanjutkan migrasi.
StopWindowsAdminCenterV1Message=Mulai menyimpan status saat ini, akan menghentikan Windows Admin Center V1.
SureProceedMessage=Yakin ingin melanjutkan?
TransferReadyMessage=Mentransfer semua data konfigurasi dari V1 ({0}) ke V2 ({1})
TransferringStatusMessage=Mentransfer: (Pengaturan: {0}), (Database: {1})
UnexpectedInstallationFolderMessage=InstallDir tak terduga: {0}
UpdateDatabaseMessage=Perbarui dan reset database.
UpdateSettingsMessage=Perbarui konfigurasi dan pengaturan.
UpdatingDatabaseMessage=Memperbarui dan mengatur ulang konten database. Tindakan ini dapat menimpa dan menghapus data yang ada termasuk pendaftaran Aplikasi Azure dari Windows Admin Center V2.
UpdatingSettingsMessage=Memperbarui konfigurasi dan pengaturan. Jika Anda memilih, migrasi akan mentransfer nomor port ke Windows Admin Center V2.
V1InstallErrorMessage=Pusat Admin Windows V1 belum diinisialisasi dengan benar, Anda harus menggunakan Pusat Admin Windows V1 setidaknya sekali setelah diinstal atau dimutakhirkan untuk menginisialisasi lingkungannya. Pusat Admin Windows V1 akan dimigrasikan sebagian tanpa pengaturan ekstensi.
V1StoppedMessage=Windows Admin Center V1 telah dihentikan tetapi tidak dihapus instalannya.
V2GuideMessage=Silakan uji Windows Admin Center V2 sekarang, jika semuanya baik, Anda dapat menghapus instalan Windows Admin Center V1.
V2NotInstalledMessage=Pusat Admin Windows V2 belum diinstal.
WantToUpdateMessage=Anda ingin memperbaruinya?
WebSocketSettingsReviewGuideMessage=Tambahkan semua asal yang diizinkan secara manual di WebSocketAllowedOrigins dari file %Program Files%\\WindowsAdminCenter\\Service\\appsettings.json. Atur semua nilai header asal yang diizinkan untuk permintaan WebSocket untuk mencegah Pembajakan WebSocket Lintas Situs. Secara default, semua asal diizinkan.
WebSocketSettingsReviewMessage=Konfigurasi WebSocket harus ditinjau setelah migrasi.
WindowAuthenticationMessage=Pusat Admin Windows V2 dikonfigurasi dengan Autentikasi Windows (NTLM). Untuk melakukan migrasi port, port akan menghapus port binging Pusat Admin Windows V1. Anda dapat mengembalikannya menggunakan Restore-WACV1Environment tetapi setelah menghapus instalan Pusat Admin Windows V2.
YesLabel=&Ya
'@

# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAFYTSLePASpOQa
# 9m4yAjuuuZjSGL/M9QUMxLbNBWwNwqCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIE4qnkqQIghx6A4iMcLo5i+
# lIZzn8UrKZUU51B4y1LAMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAG+z8I4zrUFpdVfdzvhHr0sjnWS+7EJGlQ7GTYwBlDuzhI8x31CSeg8qO
# NahQhlLi98Kg33YqsXuVcLhqf6ImMo22Imq7ChMOOA2b55g+cv0FBLYuDBX+53Ty
# JcdTbqlLgAY7ZhpwgKwk9MICJnqugFzub6NUgpNL2lLJrwoJYy7dhuNad2bD5c8D
# n7CbEUyCcqk888v/be3L2EXvqt579KIeH5AMphkc4ja9ppaw/oquv/w+MNi0LnrZ
# yzryC2U/yMQv9Qw1nhQITmPoyY9i2hEFCiPfI5ZZ7jtJzpxNz/KCcQVuWI4fWLyr
# pw/fxHasCxmorMSCYRQiVXfwkHfHc6GCF7AwghesBgorBgEEAYI3AwMBMYIXnDCC
# F5gGCSqGSIb3DQEHAqCCF4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsq
# hkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCC+rlPvhYarwS1LK1NydEzB7YmbSC/UjcmPch9eJCrSXwIGZ0osJD/f
# GBMyMDI0MTIwOTE4Mjk1Ni44MjNaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJV
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
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgtppgax/D
# FEfXtMhw/ixmn9su3DB2L8c+TvuY7oPAre0wgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCDUyO3sNZ3burBNDGUCV4NfM2gH4aWuRudIk/9KAk/ZJzCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAACAAvXqn8bKhdWAAEA
# AAIAMCIEIPKNzIg+1vOLIYNJCzj2Njc2NO5+0l7ipFPTgDhFrma1MA0GCSqGSIb3
# DQEBCwUABIICAEBNxh4abfMHohaSVb80nvVAksCtZklUKLKYkEBBCQudJH2wKvpt
# t2SpRS0oFGvbOPcXRNRZYzROklvR4Xcw/qDqBfN4x3CDMDfl4kr8S1hJKuOSxVYU
# BxtEVddoI+iyJY6Vbo11azyYnoAXo2g7Ce5yUS5F1rK+uy1LDis2u2QStf94083y
# xsAL7ySt00iN3yIBUzLjB5DDnFW6HsYFITWYr1d4+agahCYS5hRaZRAKXDpagJ60
# DkfQEvWTk8KYLnE323j+JXWue1DfO6MFUKTtA7l1oBwdTuog2rkam45dfRaYsfAE
# i99wCPE8porcoxBBtLLewnEhvcrEt62qv8/V5XxPtFNNpGArH+3p5Rf2MC7Ox6I9
# DVe6+XiK7GOSB4IGbgTBdGRTiZYSlgXl/iyi3YjO2BDb1TfoaNqrXuF9mWpL4otQ
# Nw5GwgQ7YAwoYng2fg0oN0YUENJvgfmg+FtVG+BVwuRVGxFbvyXPMbFduQ2iUVl8
# ZnHw0JaWypWaYVqvWhw7h4/aV5+RGbOiouplh0uUh+W4BwMMY06/75Grft+34H7E
# 6/+dnqvKQT2I4c0trDg58xU98TqOkm9OZNWiobYVBoXaYdPctgtQ9GQOPMfqFHQ4
# fIdT/QixyfPupdlRA8d5ran97O0k9VM6JalLFmOQ3phBiS46Fro1uhbf
# SIG # End signature block
