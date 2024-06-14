# Ottieni lo stato corrente di Microsoft Defender
$status = Get-MpComputerStatus

# Estrai lo stato delle varie impostazioni
$serviceStatus = $status.AMServiceEnabled
$antivirusStatus = $status.AntivirusEnabled
$antispywareStatus = $status.AntispywareEnabled
$monitoraggioStatus = $status.BehaviorMonitorEnabled
$IOAVStatus = $status.IoavProtectionEnabled
$NISStatus = $status.NISEnabled
$OAPStatus = $status.OnAccessProtectionEnabled
$IRLProtectionStatus = $status.RealTimeProtectionEnabled

# Funzione per convertire lo stato in una stringa più comprensibile
function GetStatusString($status) {
    if ($status -eq $true) {
        return "Attivata"
    } else {
        return "Disattivata"
    }
}

# Visualizza lo stato delle impostazioni con descrizioni
Write-Host "Stato delle impostazioni di Microsoft Defender:"
Write-host "S E R V I Z I O                S T A T O (DESCRIZIONE S E R V I Z I O)"
Write-Host "--------------------------------------------------------------------------"
Write-Host "Servizio antimalware:          $(GetStatusString $serviceStatus)"
Write-Host "Antivirus:                     $(GetStatusString $antivirusStatus)  (Protezione contro i virus)"
Write-Host "Antispyware:                   $(GetStatusString $antispywareStatus)  (Protezione contro lo spyware)"
Write-Host "Monitoraggio comportamentale:  $(GetStatusString $monitoraggioStatus)  (Rilevamento comportamentale)"
Write-Host "Protezione IOAV:               $(GetStatusString $IOAVStatus)  (Protezione degli allegati di posta elettronica)"
Write-Host "Protezione NIS:                $(GetStatusString $NISStatus)  (Protezione da minacce della rete)"
Write-Host "Protezione OAP:                $(GetStatusString $OAPStatus)  (Protezione dell'accesso)"
Write-Host "Protezione in tempo reale:     $(GetStatusString $IRLProtectionStatus)  (Protezione in tempo reale)"


# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBY18vM9WnPotSR
# Rxo8UjnLOPEiW86hHEnoi+skqnSI8KCCBVowggVWMIIDPqADAgECAhAx+LahzdtA
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
# BgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCCQLqnSXl4P+LGLxcXJQdJ2QW4n
# QV6gVzq4+v29I/mrETANBgkqhkiG9w0BAQEFAASCAgCYgpx3sD6Zx8PeM9DlkhlG
# Cxf58vtM6dfvxHtR+s0va+93LvG/rke2GPAHBZjyI7NYI/VmReC8NwwFXfsaza6v
# PRWPLYRKpS+i+mE5oty3y3q6pmjR46/c2dznN3nD8bUqHfzWQ51RDaXd+nl/ROEw
# i3GcWwe7BgiC/uyMn1ZY4zX3q7zZBt5+Sy7O/du9KQOKzozLMkA2VkRT3HG7SoaV
# gM/OPdgcEjPuXFFcUeaNMC8EMcs7fHljPzapxa3aY9sIrt6KoApNUeC1zTuaVAdP
# CZNgGiY74dfSRZ6ddyYJbCSj/kNfglknwPgtn+JXRsDL9K5u2XGKT1C43knzOoQt
# xQr4CJp/61+ldSvMWmMkgNpZq7tklZKRbZ9x/N/cx4HmU8VkwMas8Rhb4GPQdQOf
# Wgp55gRgstX1bMpAdQOZvcdGzGUn5EOBK6Le/yyAyJO9JK3O+CrX6WzkKdustADq
# HyWfd3AVj+xJ9E3P2a8mDCrOzyEz1JKyoMiePRKA2xoXXg2U0r0DjOhiOxWcZ3I0
# sVNwkwN3NKLhtGLrIR55EoMzBRtmSQJa998NVbkB41f++pgyAuaR3iZRhrdAdfxe
# Luh9176ivcVGf9FaiPLmbzOs4aG7r1fImFnKCgh4ddK0FwqBRbqVfzE9L8a8LPJu
# H3M8GitHqdP79cGOrDpy3A==
# SIG # End signature block
