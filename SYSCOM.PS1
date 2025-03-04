$OutputEncoding = [System.Text.Encoding]::UTF8

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')

if (-not $isAdmin) {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show("Per alcuni comandi è preferibile avere privilegi di amministratore.", "Avviso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
}
# Definisce una funzione per cambiare il titolo della finestra della console
function Set-ConsoleTitle {
    param (
        [string]$Title
    )
    
    $typeDefinition = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern bool SetConsoleTitle(string lpConsoleTitle);
}
"@
    
    Add-Type -TypeDefinition $typeDefinition
    [Win32]::SetConsoleTitle($Title)
}

# Chiama la funzione con il titolo desiderato
Set-ConsoleTitle -Title "SYSCOM"

function CTRLPause {
    do {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } while ($key.VirtualKeyCode -eq 17) # 17 è il codice virtuale per CTRL
}

# Ottieni la data corrente
$currentDate = Get-Date
$festa = "┃                                                               ┃"
# Controlla se il giorno e il mese correnti corrispondono a quelli specificati
if ($currentDate.Day -eq 2 -and $currentDate.Month -eq 6) {
    $festa = "┃             Buona festa della Repubblica Italiana             ┃"
}

function MAIN {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃                                                               ┃"
    Get-Content ".\SYSCOM\Banners\SYSCOM"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃`t1. Manutenzione del Sistema Operativo e dei Dischi      ┃"
    Write-Host "┃`t2. Gestione di Rete e Applicazioni                      ┃"
    Write-Host "┃`t3. Sicurezza e Protezione                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃ &FS. Schermo Intero | &32. Imposta la risoluzione | &V0. Info ┃"
    Write-Host "┃       &VISO. VISO | &AU. Autrice ANSI art | &L. Licenza       ┃"
    Write-Host "┃`tQ. Esci \ \ \ \ \ \ \ \ \ \ 404. Disintalla SYSCOM      ┃"
    Write-Host $festa
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $choice = Read-Host " "
    while ($choice.Length -gt 5) {.\SYSCOM.PS1;exit}
    switch ($choice) {
        "1" { DSK_SO }
        "2" { GRA }
        "3" { SeP }
        "&FS" {Start-Process .\VISO\F11.vbs}
        "&VISO" {Set-Location .\VISO;Start-Process  .\VISO.BAT;cd..}
        "&L" {Clear-Host;Write-Host "";Get-Content ".\VISO\LICENZA"}
        "&AU" {Clear-Host;Write-Host "";Get-Content ".\VISO\AUTRICE.ANS"}
        "0.0" {.\SYSCOM.PS1;exit}
        "&32" { Guida3_2 }
        "&V0" {INFO}
        "404" {WINGET UNINSTALL SYSCOM} #DISINTALLA SYSCOM
        "&CRT" {CRT} #CRT NO SIGBNAL ANSI ART
        #DEV FUNCTIONS
        "&43" { Guida4_3 } #Inutilizzato
        "&16" { Guida16_9 } #Inutilizzato
        "&PO" { ./PORTABLE.PS1} #Non Funzionante
        "&TEST" { TEST } #Test Interno righe e colonne 
        "&TEST2" { TEST2 } #Test Interno MAIN posizionamento
        "COLOR" { MENU } #Test Interno MAIN COLORATO
        "D32" {Debug3_2} #DEBUG 3:2 senza guida
        "APP" {App} #DEBUG INTERNO per verificare schermate
        "NET" {NET_Menu} #DEBUG INTERNO per verificare schermate
        "WGLIST" {WGLIST} #DEBUG INTERNO per verificare schermate
        "WG" {WG} #DEBUG INTERNO per verificare schermate
        "WIN11" {WINDOWS11} #DEBUG INTERNO per verificare schermate
        "SITO" {SITO} #DEBUG INTERNO per verificare schermate
        "S" {SICUREZZA}
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
        "Q" {
            exit
            return $false
        }
    }

    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Script per funzioni supplementari da sviluppatore
. .\SYSCOM\Program\DEV.PS1  # Dot-source il file delle funzioni

# Script per funzioni principali DSK_SO UTENTE
. .\SYSCOM\Program\DSK_SO.PS1  # Dot-source il file delle funzioni

# Script per funzioni principali GRA UTENTE
. .\SYSCOM\Program\GRA.PS1  # Dot-source il file delle funzioni

# Script per funzioni principali SeP UTENTE
. .\SYSCOM\Program\SeP.PS1  # Dot-source il file delle funzioni

function Guida3_2 {
    Clear-Host
    Write-Host "`nTra poco sarai reinderizzato alla pagina di DEBUG..." -ForegroundColor Yellow
    Write-Host "`n`nHAI SELEZIONATO LA MODALITÀ 3:2"
    Write-Host "`n`a!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LA MODALITÀ SCHERMO INTERO PRIMA DI PASSARE AL DEBUG" -ForegroundColor Red

    $3_2 = Read-Host "`nVuoi passare alla schermata di DEBUG [S/N]"
    switch ($3_2) {
        "S" {
            Debug3_2
        }
        "N" {
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function Debug3_2 {
    Clear-Host
    Write-Host ""
    Write-Host "Schermata per capire la risoluzione massima supportata da SYSCOM" -ForegroundColor Yellow
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "<<━━━━━━━━━━━━━━━DEVO━VEDERMI━IN━UNA━SOLA━RIGA━━━━━━━━━━━━━━━━>>"
    Write-Host ""
    Write-Host "`a!                  ! WARNING / ATTENZIONE !                    !" -ForegroundColor Red
    Write-Host ""
    Write-Host "!     ASSICURATI DI VISUALIZZARE TUTTA LA LINEA IN UNA SOLA RIGA" -ForegroundColor Red
    Write-Host ""
    Write-Host ""
    Write-Host "Utilizza le seguenti combinazioni di tasti"
    Write-Host "per regolare la dimensione del testo nel terminale:"
    Write-Host ""
    Write-Host ""
    Write-Host "CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "CTRL + +  : Aumenta la dimensione del testo"
    Write-Host "CTRL + -  : Diminuisce la dimensione del testo"
    Write-Host ""
    Write-Host ""
    Write-Host "Quando hai impostato correttamente la larghezza batti un tasto" -ForegroundColor GREEN
    Write-Host ""
    CTRLPause
    Debug3_2_2

}

function Debug3_2_2 {
    Clear-Host
    Write-Host "↑" -ForegroundColor GREEN
    Write-Host "↑"
    Write-Host "↑`a     !               ! WARNING / ATTENZIONE !                !" -ForegroundColor Red
    Write-Host "↑"
    Write-Host "↑   !     ASSICURATI DI VISUALIZZARE TUTTA LA LINEA VERTICALE" -ForegroundColor Red
    Write-Host "↑"
    Write-Host "↑   !     SE NON VEDI COMPLETAMENTE LA PRIMA E L'ULTIMA RIGA" -ForegroundColor Red
    Write-Host "↑   !     NON È UN PROBLEMA" -ForegroundColor Red
    Write-Host "↑"
    Write-Host "↑   !     La prima freccia dall'alto è verde" -ForegroundColor Red
    Write-Host "↑   !     La prima freccia dal basso è rossa" -ForegroundColor Red
    Write-Host "┃"
    Write-Host "↓   Utilizza le seguenti combinazioni di tasti"
    Write-Host "↓   per regolare la dimensione del testo nel terminale:"
    Write-Host "↓"
    Write-Host "↓"
    Write-Host "↓   CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "↓   CTRL + +  : Aumenta la dimensione del testo"
    Write-Host "↓   CTRL + -  : Diminuisce la dimensione del testo"
    Write-Host "↓"
    Write-Host "↓"
    Write-Host "↓Quando hai impostato correttamente la larghezza batti un tasto" -ForegroundColor GREEN
    Write-Host "↓" -ForegroundColor Red
    CTRLPause

}

function INFO {
    Clear-Host
    Write-Host "`n       Schermata per capire la versione attualmente in uso di SYSCOM       " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "`nNome programma: SYSCOM"
    Write-Host "`nNome funzione: INFO"
    Write-Host "`nOra ultima scrittura: 10/06/2024 - 19:51"
    Write-Host "`nVersione: 0.0.4"
}

function CRT {
    Clear-Host
        Get-Content ".\SYSCOM\Banners\CRT_COLORS.utf8ans"
}

do {
MAIN
} while ($true)
# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCPzpfU8kYuWuXi
# iEpz5TAOPeCZ/NuKFWkPJaBXIn80H6CCBVowggVWMIIDPqADAgECAhAx+LahzdtA
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
# BgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCD6FwwYqJBTCj4Mx4UuHvh4Fl5h
# sBMoK6dPMAb5Urq81jANBgkqhkiG9w0BAQEFAASCAgCX181tUu8RIFGJFkxFdRIb
# 2r1306CQH5uQsxAWkqfkOqRjueAeBpBpZA48FYq9xP2Z2IK4TKPA8ssCCOSD4bMn
# xlLtOVJHtbgRv4rWtPClM+jIwEsexZlnfLC63EiE+x00VvNGz3EIpV+rCuqlYgDR
# OinfIiMkBnhBbGJ/Hn+02smkoUn6hBke3YMo3OWnaOBV9mea385rThjzaNbiDk4D
# 4ZmdO7wGxjI37Twxt1EOWr1ONZvgImcE7sg6gIpezTyQD8nYAESyRF5MWwy4cNye
# kb0CWcnV2wifOom92v03G4qkgMLUoUCFsfuIACTsnfp3KMkPQVC8pCV/xtSvZpa9
# dh09cVouKcA1fVR3E0pnsvEtOljKbbKHa5jHNhbyw1llsUBCUxqECpm3vIN0zTfs
# y+Re0RS/HjVDVWYaIUcKDr3I59wsH8ix8dS4RR83qRUfGxVBuGfMcpAe5R5fKULz
# yaAZ9Nn7oV3cdrnFPBRLbsd/MIVm1NQBpcx4Gb6nHaMSxB916XLuMyJ4oo6G5zm0
# zi4YK8r5vKTTDOgdKXZ9c9Bga6AvAdCEIGYpdpLD6sQ85Eg2FyVJyvHfaR+A6eeo
# VnFY29ETyPx24WatlansW7Ol6D8AUO0c58Zy+ezCKIQ7RwulCzZFpjBQPJdqWMAI
# TimvjNUGoOtyUCf49POjog==
# SIG # End signature block
