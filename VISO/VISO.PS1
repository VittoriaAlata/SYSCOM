# Tenta di ottenere la directory di installazione di Windows Terminal dal registro di sistema
Import-Module %ProgramFiles%


$wtRegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\wt.exe"
$wtDirectory = (Get-ItemProperty -Path $wtRegistryPath -ErrorAction SilentlyContinue).Path
$PWSHDirectory = %ProgramFiles%\PowerShell\7\\
$pwshPath = %ProgramFiles%\PowerShell\7\pwsh.exe


# Se non riesci a trovare la directory tramite il registro di sistema, cerca in altre posizioni comuni
if (-not $wtDirectory) {
    $commonPaths = @(
        "$env:ProgramFiles\WindowsApps\Microsoft.WindowsTerminal_*",
        "$env:LOCALAPPDATA\Microsoft\WindowsApps\Microsoft.WindowsTerminal_*"
    )

    foreach ($path in $commonPaths) {
        $wtDirectories = Get-ChildItem -Path $path -Directory | Where-Object { $_.Name -like "Microsoft.WindowsTerminal_*" }

        if ($wtDirectories) {
            $wtDirectory = $wtDirectories[0].FullName
            break
        }
    }
}

if (-not $wtDirectory) {
    Write-Host "Impossibile trovare la directory di installazione di Windows Terminal."
    exit
}

# Apre la directory di installazione di Windows Terminal
#Invoke-Item $wtDirectory

# Controlla se l'utente ha già i privilegi di amministratore
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Richiedi l'elevazione dei privilegi per avviare il file batch
   #Start-Process wt.exe -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    $command = "echo ciao"
Start-Process wt.exe -ArgumentList "new-tab", "$env:UserProfile\Desktop\VISO\VISO.BAT" -Verb RunAs
   #Start-Process wt.exe -ArgumentList "new-tab" -Verb RunAs -WorkingDirectory "$env:ProgramFiles\PowerShell\7\\"
   #Start-Process wt.exe -ArgumentList "new-tab" -Verb RunAs
} else {
    Write-Host "L'utente ha già i privilegi di amministratore."
    # Puoi eseguire altre azioni qui se necessario
}
pause
# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDJTQ+KDg7LimyH
# 4MGkWWQ9DjrTBNNo68/cl045rbUci6CCBVowggVWMIIDPqADAgECAhAx+LahzdtA
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
# BgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCDC/tWlZRiTXS9KZiTtUqmw6CYX
# /zLZgz28RG5aZgiTVTANBgkqhkiG9w0BAQEFAASCAgBpFXlq6zy4ELcYAfoLkj3c
# FSwTGicmOb3zmPPzTGI9+mKWtzLoZ+yE1P3x8qLJRIu2Sc/hu3Y9OORGLmyQ/1UY
# pUiRfGg+6S7pPKXw6wLCsnGE/vSwus2EQca7GumdLINM0ANPagqE3UFX/4cfp7v0
# Np8lJ5zbg/g7QBGrExyBIunUpuZOV20ehJTyT5hK3eEgVD6BiUjUerjl27XQROYv
# tyiR+/mcrNXP8eZ0R5aJLxxIT2cNrltWxRxoAOOISyNcEe8xYGaUwPXq6GU/vCn1
# y5a6YBMwDdQN59//gbquSMQFHZArloTo9ZUW1mV8/nLEUGUtr6aWKNSy7tw0S6pW
# pYrP0irsI0Lk/xke//1kg6kWOUY17rhQvbwNnY1RPvQoOq4m9zJ7MsplOhotUNKq
# jDZl1lYsxRmpowFMZ6gpOXK80dq9qBApan+hPDG0Tp0s0eKnvRYWF/AyN57QYNFu
# DuCJVW00EfdkzMLC5MSgjEXC8rZdwvleDLaJGQVa+yz1ORB/52FVYV0SgoS7Rwmm
# Af8HvBDK2D1QD8bYSsdlZ6gf4lY9AyLh3Q4MzOaqtsKROuFXfUBP78h+F1n5Fyjj
# 4virYCY+WiSPFwtMmRqHXbezxhxvmhp8C4UJ0SJW3ZAecZd1eskAKgMjpckmapgV
# PmWczxdQqH8tFhkoPQUM5w==
# SIG # End signature block
