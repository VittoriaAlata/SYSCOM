Write-Host "Impostazione del punto di ripristino..."
Set-MpPreference -DisableRestorePoint $false 

Write-Host "Attivazione del monitoraggio in tempo reale..."
Set-MpPreference -DisableRealtimeMonitoring $false 

Write-Host "Abilitazione del monitoraggio del comportamento..."
Set-MpPreference -DisableBehaviorMonitoring $false 

Write-Host "Disattivazione del blocco automatico delle minacce alla prima visualizzazione..."
Set-MpPreference -DisableBlockAtFirstSeen $false 

Write-Host "Attivazione della protezione dalle minacce in ingresso e in uscita..."
Set-MpPreference -DisableIOAVProtection $false 

Write-Host "Disabilitazione della modalità privacy..."
Set-MpPreference -DisablePrivacyMode $false 

Write-Host "Abilitazione dell'aggiornamento delle firme delle minacce all'avvio del sistema..."
Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $false 

Write-Host "Configurazione del consenso per inviare campioni di file sospetti a Microsoft..."
Set-MpPreference -SubmitSamplesConsent 2 

Write-Host "Impostazione del livello di partecipazione ai miglioramenti dell'intelligenza delle minacce..."
Set-MpPreference -MAPSReporting 2 

Write-Host "Impostazione dell'azione predefinita per le minacce di alto livello..."
Set-MpPreference -HighThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce di livello moderato..."
Set-MpPreference -ModerateThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce di basso livello..."
Set-MpPreference -LowThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce gravi..."
Set-MpPreference -SevereThreatDefaultAction 6 

Write-Host "Abilitazione della protezione contro le applicazioni potenzialmente indesiderate..."
Set-MpPreference -PUAProtection 1 

Write-Host "Abilitazione della scansione degli archivi per rilevare minacce nascoste..."
Set-MpPreference -DisableArchiveScanning $false 

Write-Host "Abilitazione del sistema di prevenzione delle intrusioni..."
Set-MpPreference -DisableIntrusionPreventionSystem $false 

Write-Host "Abilitazione dell'accesso controllato alle cartelle..."
Set-MpPreference -EnableControlledFolderAccess Enabled 

Write-Host "Abilitazione della protezione di rete..."
Set-MpPreference -EnableNetworkProtection Enabled 

Write-Host "Impostazioni applicate con successo!"
Set-MpPreference -Force
# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCy22u3knzCd+wP
# 26BmvNKyk5orlsvwP/toTzyVWx0l/aCCBVowggVWMIIDPqADAgECAhAx+LahzdtA
# skQAuoaJx6JUMA0GCSqGSIb3DQEBCwUAMEIxETAPBgNVBAMMCFZpdHRvcmlhMS0w
# KwYJKoZIhvcNAQkBFh52aXR0b3JpYWFsYXRhYXp6dXJyYUBnbWFpbC5jb20wIBcN
# MjQwNjEwMTU1MDI5WhgPMjEzMTEyMzEyMjAwMDBaMEIxETAPBgNVBAMMCFZpdHRv
# cmlhMS0wKwYJKoZIhvcNAQkBFh52aXR0b3JpYWFsYXRhYXp6dXJyYUBnbWFpbC5j
# b20wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCasjtcoSKdyM6lvmgw
# 6EO5EwacgRN2b8nXK3AYyEYSR2JK5Ru/xBmmEvPs88lnxuqAFYKiJ1MR1gKr2R1/
# HifqmapvlQCiXLbEq9/tc47xezxdaLAY15U3mTFNMb7yanh+/IamEHi97Ofr/Tnk
# uNZ++s+Gy/MU14OZMF6S44ZaKa0SCcg6TvhgH2pgiFXoZY/i+94IVTqn1ZRQNhP3
# 2o6B6EJZ9x5g0szbxvzFjTikER3lqk803NP2E6M/cMpwMYYlaUc2H0vvns6S9kEH
# c4fASunUgJnPUma8TF3ddANPrSW74qNXxWezV2/FG/G+TMvk8IDxjNUryo82Fsxk
# eoPvUViiJ16YgAE3B6oLdM/Of0Q+jHimGJ6C8Zu+u6JxLCWvTNdpBPH6Unnu5I7l
# QL1Wg+uuphLOLTp5FRHU2zmmwzwiu12rZiKmfF9Wwy7GK5D4d2eJzHFdDzsRpWU6
# QNdg/GY5LPDDm+qwmvPPRSyZvoTMfNdMPnBm1zO/u+iPPdoOhRK1ju+EgPaB5C4L
# rww+hxxVYzNt/zqtH1kKpFMGXyukEWVxLMdCTKRG6hZNO3za5gT7pxf24dGIkHJJ
# H0OtloKHEGDZRDAjYEmdE1RX5jivlhr0fRhoXmDHMXQPNyGYoLNt4R9UrwCB6ADV
# HQ2XZrG1AlXd4pr7nvZxWHVgAQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCBaAwEwYD
# VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFPnBBrv2wCDEew7wFaehvfdafdIO
# MA0GCSqGSIb3DQEBCwUAA4ICAQCY4WLzeoc9ubdvUDJW75ohIYkZ9iTTxg84LwUY
# pTnjh1UZOS7j36hUYv7EAi+LpTXrzB0yPn4wzNL9i+/XZon2IMlFd3Zu+8Djo/J+
# /f6cVE3pw8+tE+FRYhnC2EBivK0pLu4aXM3wPc5b/b/58c5yRWo97UYIX3mRBxVS
# 13Kf6t7qewWqvoJ/nSbRiQb9q3jeJ5yNCxUxxQVZ11FGV9kbPboutd/cbbdJYB0M
# +TmSOJ2ivE1XfWfuktlTDkSZauVUv8l+aM8T4NMlpG+NDf+Ark3IxkPMxPMLE9Rs
# 3Mrsqq4gDfxj1jOcfyajvY8tqk+K/tfOPPWztXFeoQjofw58YL1/XNmgJWXbuGXk
# Mn6jpQYNT4SHiCkDVIp/QD/U0kJ77XFTyIm62T3UCZyt4yJkMwZFSg3+JW0CqyUU
# fb1WSkURY7HKjIbuI6ha5Rq/ZSFyji9ncCWpzH8YeWvBu2Y1QiYvaf06x31//kwR
# 6ukAyvy3FxX6d2DnbS4N2j97nsONL/Bm2lrIaYkwJVTLqzNBwjd1HluY87IkaM6L
# 2hOWAB/obWA0pM3RfZR8xiu7j6CPYRE7xvdJolkletOTSS5QbhtMFKddqCmh72xy
# vlFQan2rquR6ASdW2YLJU7wb6ImnfeJLQzauvTCN5N+AbeyzFSpF+lD1d4QPwYGT
# rzgl1zGCAwgwggMEAgEBMFYwQjERMA8GA1UEAwwIVml0dG9yaWExLTArBgkqhkiG
# 9w0BCQEWHnZpdHRvcmlhYWxhdGFhenp1cnJhQGdtYWlsLmNvbQIQMfi2oc3bQLJE
# ALqGiceiVDANBglghkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgACh
# AoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAM
# BgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCBjtwCHB2comqT7WCUtCbSgKjY4
# vyVSylLVyl6Di+FtLTANBgkqhkiG9w0BAQEFAASCAgBb/B47+5p/aqbfXBdEQOYZ
# YcF/fsUOlU2UR6qLXj6P9emthB7GtuW+U0ZSAKawNmDAAFoC9Cf0GhvEwAijGSwY
# n642L0E8VNrn7ECOGp/GpZSTu+tTvd8olm2G9sJBRdkYPhqAapp2VVXrif4lt8ut
# uvLefa02LjVZOW5C7scNU37X+mGpF+2qaL5jS221CqY7DbQS+14p3HjY2AdJiO11
# z7A3D/sH1tUXAtjiSTpCKr5lRKWmJLs8pYkhpMb2OLPKpZAKVCLZF8ZExepklfGy
# dG658u5JURzMLg2MFm0f2KN1o0l9iw+H4LAL2Km6rd0JSYQA7LYqkyBLcHDlLDz5
# EvNargvZpHO0kVpRsgfVyWQasDlCR1XE4u4dZ1HuP0sR3XCsOFTMfVUnxf+KXzL9
# nYWJ3phPpw7BpbEMsMxddqNEPvFlHpivSzSHCY6J/IFBl+e6V//j+n7mpO9t8/jC
# /kurlvAPeIm8GS/DjawPHDp1foputbu+029Sles9pXeeOW8+pYCOja4APfujqdJc
# dG14DyQJaLopiy47fb579rpbe21Bdr/SDkVDeyb7D9Haf8702G5cmNGZ8ep+lTWv
# ZneNQbgHK+X7FKx3+UqmlVL5W7sk+ce2b/2WYTkuC8vvIaqZ1hsT6JetDyJkAcET
# eU8HtW1W40D4iOL8NE3qGg==
# SIG # End signature block
