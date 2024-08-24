$OutputEncoding = [System.Text.Encoding]::UTF8

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')

if (-not $isAdmin) {
        $proc = Start-Process pwsh.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs -PassThru
        $proc.WaitForExit()
}

# Il resto del tuo script va qui


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
$festa = "┃                           &L. Licenza                         ┃"
# Controlla se il giorno e il mese correnti corrispondono a quelli specificati
if ($currentDate.Day -eq 2 -and $currentDate.Month -eq 6) {
    $festa = "┃             Buona festa della Repubblica Italiana             ┃"
}

function DSK_SO {
    Clear-Host
    Write-Host ""
    Write-Host "" 
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\DSK_SO"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━        ┃"
    Write-Host "┃1.  SO             (Strumenti per il SISTEMA OPERATIVO)        ┃"
    Write-Host "┃2.  DSK            (Strumenti per i Dischi e Volumi)           ┃"
    Write-Host "┃3.  HARDWARE       (Strumenti per il l'Hardware)               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
#    Write-Host "┃10. recdisc.exe     (Strumento di riparazione del disco)        ┃" VA NELLA PARTE DI BACKUP IN UNA NUOVA FUNZIONE NELLA FUNZIONE SECURE
    $MDeSO = Read-Host " "
    switch ($MDeSO) {
        "0" {
            .\SYSCOM.PS1 
        }
        "" {
            .\SYSCOM.PS1 
        }
        "q" {
            .\SYSCOM.PS1
        }
        "1" {
            SO
        }
        "2" {
            DSK
        }
        "3" {
            HARDWARE
        }
        "10" {
            Invoke-Expression "$env:windir\System32\recdisc.exe"
            Start-Sleep -Seconds 1     
            DSK_SO
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function SO {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\SO"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━        ┃"
    Write-Host "┃1.  SFC            (Analizza integrità file di sistema)        ┃" 
    Write-Host "┃2.  DISM           (Manutenzione immagini di sistema)          ┃"
    Write-Host "┃3.  Windows        (Immagini di Windows Ufficiali)             ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $SO = Read-Host " "
    switch ($SO) {
        "0" {
            DSK_SO
        }
        "" {
            DSK_SO 
        }
        "q" {
            DSK_SO
        }
        "1" { 
            Clear-Host
            sfc /scannow
            Pause
            Start-Sleep -Seconds 1     
            SO
        }
        "2" {
            Clear-Host
            dism /online /cleanup-image /restorehealth /Loglevel:2
            Start-Sleep -Seconds 1
            Pause     
            SO
        }
        "3" {
            WINDOWS11
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function DSK {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\DSK"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.  CHKDSK         (Individua settori e controlla disco)       ┃" 
    Write-Host "┃2.  Canc           (Strumenti per la cancellazzione file)      ┃"
    Write-Host "┃3.  dfrgui.exe     (Deframmenta e ottimizza unità)             ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $DSK = Read-Host " "
    switch ($DSK) {
        "0" {
            DSK_SO
        }
        "" {
            DSK_SO 
        }
        "q" {
            DSK_SO
        }
        "1"{
            CHKDSK
        }
        "2"{
            Canc
        }
        "3" {
            Invoke-Expression "$env:windir\System32\dfrgui.exe"
            Start-Sleep -Seconds 1     
            DSK
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function CHKDSK {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\CHKDSK"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.  CHKDSK (f)     (Controlla disco e visualizza rapporto)     ┃" 
    Write-Host "┃2.  CHKDSK (r)     (Individua settori danneggiati)             ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CHKDSK = Read-Host " "
    switch ($CHKDSK) {
        "0" {
            DSK
        }
        "" {
            DSK
        }
        "q" {
            DSK
        }
       "1" {
            Clear-Host
            chkdsk /f
            Pause
            Start-Sleep -Seconds 1     
            CHKDSK
        }
        "2" {
            Clear-Host
            chkdsk /r
            Pause
            Start-Sleep -Seconds 1     
            CHKDSK
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
   }
}

function Canc {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\CANC"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.  cleanmgr.exe   (Cancella file non necessari dal disco)     ┃" 
    Write-Host "┃2.  dTeP           (Canc file temporanei e file di prefetch)   ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CANC = Read-Host " "
    switch ($CANC) {
    "0" {
        DSK
    }
    "" {
        DSK
    }
    "q" {
        DSK
    }
    "1"{
            Invoke-Expression "$env:windir\System32\cleanmgr.exe"
            Start-Sleep -Seconds 1     
            Canc
    }
    "2"{
        Clear-Host
        Remove-Item -Path "$env:TEMP\*" -Force -Recurse
        Remove-Item -Path "$env:WINDIR\temp\*" -Force -Recurse        
            Canc
    }
    Default {
        Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
    }
    }
}
function HARDWARE {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\HDWE"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1. dxdiag.exe     (Strumento di diagnostica Direct X)          ┃" 
    Write-Host "┃2. Report         (Strumenti di diagnostica componenti)        ┃"
    Write-Host "┃3. hotplug.dll    (Rimozione sicura dell`hardware)              ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $HDWE = Read-Host " "
    switch ($HDWE) {
        "0" {
            DSK_SO
        }
        "" {
            DSK_SO
        }
        "q" {
            DSK_SO
        }
        "1"{
            Invoke-Expression "$env:windir\System32\dxdiag.exe"
            Start-Sleep -Seconds 1     
            HARDWARE
        }
        "2"{
            REPORT
        }
        "3" {
            Invoke-Expression "$env:windir\System32\RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll"
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function REPORT {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "`a┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\REPORT"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.  POWERCFG (e)   (Report energia del computer)               ┃" 
    Write-Host "┃2.  POWERCFG (b)   (Report stato batteria)                     ┃"
    Write-Host "┃3.  MdSched.exe    (Diagnostica memoria centrale)              ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $RPRT = Read-Host " "
    switch ($RPRT) {
        "0" {
            HARDWARE
        }
        "" {
            HARDWARE
        }
        "q" {
            HARDWARE
        }
        "1" {
            Clear-Host
            powercfg /energy
            Pause
            Start-Sleep -Seconds 1     
            REPORT
        }
        "2" {
            Clear-Host
            powercfg /batteryreport
            Pause
            Start-Sleep -Seconds 1     
            REPORT
        }
        "3" {
            Invoke-Expression "$env:windir\System32\MdSched.exe"
            Start-Sleep -Seconds 1     
            REPORT
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}
function WINDOWS11 {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\WINDOWS11.ANS"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO       (DESCRIZIONE COMANDO)                     ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━              ┃"
    Write-Host "┃1.  ISO              (ISO scaricabili di Windows)              ┃"
    Write-Host "┃2.  TPM              (Utilità per rimuovere il TPM)            ┃"
    Write-Host "┃3.  Guida            (Guida per la compatibilità Windows 11)   ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

    $WIN11 = Read-Host " "
    

    switch ($WIN11) {
        "0" {
            SO 
        }
        "" {
           SO
        }
        "1" {
            ISOWIN11
        }
        "2" {
            Start-Process https://github.com/harsha2koo/W11x64.bat/blob/main/W11_x64-TPM.cmd
            Start-Sleep -Seconds 1     
            WINDOWS11
        }
        "3" {
            GUIDAWIN11
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
    
}

function ISOWIN11 {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\ISO"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO       (DESCRIZIONE COMANDO)                     ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.  ISO Ufficiale    (Scarica Windows 11 ufficiale)            ┃"
    Write-Host "┃2.  Windows          (Scarica versioni di Windows precedenti)  ┃"
    Write-Host "┃3.  Scarica ISO      (ISO dai server della Microsoft)          ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $ISOWIN11 = Read-Host " "
    switch ($ISOWIN11) {
        "0" {
            WINDOWS11 
        }
        "" {
           WINDOWS11
        }
        "1" {
            Start-Process https://www.microsoft.com/it-it/software-download/windows11
            Start-Sleep -Seconds 1     
            ISOWIN11
        }
        "2" {
            Start-Process https://www.microsoft.com/it-it/software-download/
            Start-Sleep -Seconds 1
            ISOWIN11
        }
        "3" {
            Start-Process https://uupdump.net
            Start-Sleep -Seconds 1
            ISOWIN11
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function GUIDAWIN11 {
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 1. Scarica il media creation tool dal sito  "
    Write-Host "    della Microsoft mediante l'opzione 1.    "
    Write-Host "    Questo strumento ti permetterà di creare "
    Write-Host "    un'immagine ISO di Windows 11.           "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 2. Scarica l'eseguibile TPM mediante         "
    Write-Host "    l'opzione 2. Questo programma ti servirà "
    Write-Host "    per modificare le impostazioni TPM        "
    Write-Host "    del tuo sistema.                          "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 3. Dopo aver scaricato i programmi, crea     "
    Write-Host "    l'immagine ISO di Windows 11 seguendo     "
    Write-Host "    le istruzioni del media creation tool.    "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 4. Monta per la prima volta la ISO facendo   "
    Write-Host "    clic destro su di essa e selezionando     "
    Write-Host "    'Monta'.                                  "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 5. Chiudi l'immagine montata e esegui        "
    Write-Host "    l'eseguibile TPM. Segui le istruzioni     "
    Write-Host "    sullo schermo per eliminare il TPM.       "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 6. Dopo l'avviso di corretta eliminazione    "
    Write-Host "    del TPM, rimonta la ISO facendo clic      "
    Write-Host "    destro su di essa e selezionando 'Monta'. "
    Write-Host "=============================================="
    Write-Host ""
    pause
    
    Clear-Host
    Write-Host "=============================================="
    Write-Host " 7. Apri il file setup.exe dalla ISO montata  "
    Write-Host "    e segui le istruzioni dell'installazione  "
    Write-Host "    guidata per completare l'installazione    "
    Write-Host "    di Windows 11.                            "
    Write-Host "=============================================="
    Write-Host ""
    pause

    WINDOWS11
}

function GestioneReteApplicazioni {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\RETEAPP"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━        ┃"
    # Write-Host "3.     taskmgr.exe  (Gestione attività)"
    # Write-Host "4.     msconfig.exe (Config. di sistema)"
    Write-Host "┃1.    App          (Strumenti per pachetti e programmi)        ┃"
    Write-Host "┃2.    NET          (Strumenti per il network e dischi di rete) ┃"
    Write-Host "┃3.    Copilot      (Strumenti Copilot)                         ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

    $GRA = Read-Host " "
    switch ($GRA) {
        "0" {
           .\SYSCOM.PS1 
        }
        "" {
           .\SYSCOM.PS1 
        }
        "1" {
            App
        }
        "2" {
            NET_Menu
        }
        "3" {
            COPILOT
        }
        # "3" {
            # Invoke-Expression "$env:windir\System32\taskmgr.exe"
            # Start-Sleep -Seconds 1     
            # GestioneReteApplicazioni
        # }
        # "4" {
            # Invoke-Expression "$env:windir\System32\msconfig.exe"
            # Start-Sleep -Seconds 1     
            # GestioneReteApplicazioni
        # }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}
 function App {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\APP"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO       (DESCRIZIONE COMANDO)                     ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.     WINGET        (Strumenti utili per pachetti)            ┃"
    Write-Host "┃2.     DISINSTALLA   (Disistalla o modifica programma)         ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $APP = Read-Host " "
    switch ($APP) {
        "0" {
            GestioneReteApplicazioni
        }
         "" {
            GestioneReteApplicazioni
        }
        "1" {
            WG
        }
        "2" {
            DISINSTALLA
        }
        # "2" {
        #     Invoke-Expression "$env:windir\System32\appwiz.cpl"
        #     Start-Sleep -Seconds 1     
        #     App
        # }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function DISINSTALLA {
}

function WG {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\WINGET"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO       (DESCRIZIONE COMANDO)                     ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.     INSTALLA      (Installa un pachetto)                    ┃"
    Write-Host "┃2.     AGGIORNA      (Aggiorna i pachetti installati)          ┃"
    Write-Host "┃3.     LISTA                                                   ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $WINGET = Read-Host " "
    switch ($WINGET) {
        "0" {
            App
        }
         "" {
            App
        }
        "1" {
            Clear-Host
            .\SYSCOM\Program\WINSTALL.PS1
            Pause
            Start-Sleep -Seconds 1
            WG
        }
        "2" {
            Clear-Host
            winget upgrade --all --include-unknown
            Pause
            Start-Sleep -Seconds 1     
            WG
        }
        "3" {
            WGLIST
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function WGLIST {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\WINGET_LIST"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO       (DESCRIZIONE COMANDO)                     ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ┃"
    Write-Host "┃1.     Lista         (Crea una lista dei pachetti installati)  ┃"
    Write-Host "┃2.     Esporta       (Esporta elenco dei pacchetti installati  ┃"
    Write-Host "┃                     da  poter  reinstallare successivamente)  ┃"
    Write-Host "┃3.     Importa       (Installa  tutti i  pachetti da un  file  ┃"
    Write-Host "┃                                   esportato  in  precedenza)  ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $WGLIST = Read-Host " "
    switch ($WGLIST) {
        "0" {
            WG
        }
         "" {
            WG
        }
        "1" {
            Clear-Host
            .\SYSCOM\Program\WGLIST.PS1
            Pause
            Start-Sleep -Seconds 1
            WGLIST
        }
        "2" {
            Clear-Host
            .\SYSCOM\Program\WGEXP.PS1
            Pause
            Start-Sleep -Seconds 1
            WGLIST
        }
        "3" {
            Clear-Host
            .\SYSCOM\Program\WGIMP.PS1
            Pause
            Start-Sleep -Seconds 1
            WGLIST
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function NET_Menu {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\NET"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO                    (DESCRIZIONE COMANDO)        ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.     Pulizia                    (Pulizia del Network)        ┃"
    Write-Host "┃2.     Condivisione Cartelle      (Imp. Cartelle Condivise)    ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $NET = Read-Host " "
    switch ($NET) {
        "0" {
            GestioneReteApplicazioni
        }
         "" {
            GestioneReteApplicazioni
        }
        "1" {
            PULIZIANET
        }
        "2" {
            CARTCONDIVISE
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function PULIZIANET {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\PULIZIA_NET"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO      (DESCR. COMANDO)                           ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━                          ┃"
    Write-Host "┃1.     NETSH        (Pulisce winsock)                          ┃"
    Write-Host "┃2.     flushdns     (Svuota cache, reimposta registro DNS)     ┃"
    Write-Host "┃3.     net use      (Elimina connessioni dischi di rete attive)┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $PULIZIANET = Read-Host " "
    switch ($PULIZIANET) {
        "0" {
            NET_Menu
        }
         "" {
            NET_Menu
        }
        "1" {
            Clear-Host
            netsh winsock reset
            Pause
            Start-Sleep -Seconds 1  
            PULIZIANET
        }
        "2" {
            Clear-Host
            ipconfig /flushdns
            Pause
            Start-Sleep -Seconds 1     
            PULIZIANET
        }
        "3" {
            Clear-Host
            net use * /delete
            Pause
            Start-Sleep -Seconds 1  
            PULIZIANET
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function CARTCONDIVISE {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\CARTCONDIVISE"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO      (DESCRIZIONE COMANDO)                      ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "┃1.     ICiRA        (Imp. condivisione in rete avanzate)       ┃"
    Write-Host "┃2.     shrpubw.exe  (Creazione guidata cartella condivisa)     ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CARTELLECONDIVISE = Read-Host " "
    switch ($CARTELLECONDIVISE) {
        "1" {
            control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "2" {
            shrpubw.exe
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function COPILOT {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Get-Content ".\SYSCOM\Banners\COPILOT.ANS"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CPLT = Read-Host " "
    switch ($CPLT) {
        "0" {
           GestioneReteApplicazioni 
        }
        "" {
           GestioneReteApplicazioni 
        }
        "1" {
            Start-Process .\SYSCOM\Copilot.url
            Start-Sleep -Seconds 1     
            COPILOT
        }
        "2" {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '1'
            Start-Sleep -Seconds 1     
            COPILOT
        }
        "3" {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '0'
            Start-Sleep -Seconds 1     
            COPILOT
        }
        "4" {
            Start-Process https://github.com/thebookisclosed/ViVe
            Start-Sleep -Seconds 1     
            COPILOT
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function SicurezzaProtezione {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\SECURE"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO                    (DESCRIZIONE COMANDO)        ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━       ┃"
    Write-Host "1.  wscui.cpl            (Sicurezza e manutenzione)"
#    Write-Host "2.  hotplug.dll          (Rimozione sicura dell`hardware)" Va nella parte HARDWARE DI DSK_SO
    Write-Host "3.  sigverif.exe         (Verifica firma file)"
    Write-Host "4.  MRT.exe              (Strumento di rimozione malware Microsoft Windows)"
    Write-Host "5.  SPP                  (Protezione Sistema)"
    Write-Host "6.  Imp. di Criptaggio   (Impostazioni di crittografia del dispositivo)"
    Write-Host "7.  Microsoft Defender   (Strumenti Microsoft Defender)"
    Write-Host "8.  Punti di Ripristino  (Strumenti Punti di Ripristino)"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    Write-Host ""
    $SeP = Read-Host " "

    switch ($SeP) {
        "0" {
           .\SYSCOM.PS1 
        }
        "" {
           .\SYSCOM.PS1 
        }
        "1" {
            Invoke-Expression "$env:windir\System32\wscui.cpl"
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        "3" {
            Invoke-Expression "$env:windir\System32\sigverif.exe"
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        "4" {
            Invoke-Expression "$env:windir\System32\MRT.exe"
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        "5" {
            SystemPropertiesProtection
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        "6" {
            control.exe /name Microsoft.DeviceEncryption
            Start-Sleep -Seconds 1
            SicurezzaProtezione
        }
        "7" {
            Start-Sleep -Seconds 1
            MSD
            SicurezzaProtezione
        }
        "8" {
            Start-Sleep -Seconds 1
            PDR
            SicurezzaProtezione
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function MSD {
    Clear-Host
    Get-Content ".\SYSCOM\Banners\MSD.ANS"
    Write-Host "`n`nNUM.   COMANDO         (DESCRIZIONE COMANDO)"
    Write-Host "------------------------------------------------------------"
    Write-Host "1.  Scansione MD (c) (Scansione Microsoft Defender, COMPLETA)"
    Write-Host "2.  Attiva MD (Attiva la protezione massima di Microsoft Defender)"
    Write-Host "3.  Scansione MD (v) (Scansione Microsoft Defender, VELOCE)"
    Write-Host "4.  Stato MD (Visualizza lo Stato attuale di Microsoft Defender)"
    Write-Host "0.  Esci"
    Write-Host ""
    $MSD = Read-Host "Inserisci il numero per l'operazione"
    switch ($MSD) {
        "0" {
           SicurezzaProtezione 
        }
        "" {
           SicurezzaProtezione 
        }
        "1" {
            Clear-Host
            .\VISO\MDsC.BAT
            Pause
            Start-Sleep -Seconds 1
            MSD
        }
        "2" {
            Clear-Host
            .\VISO\AttivaMD.ps1
            Pause
            Start-Sleep -Seconds 1
            MSD
        }
        "3" {
            Clear-Host
            .\VISO\MDsV.BAT
            Pause
            Start-Sleep -Seconds 1
            MSD
        }
        "4" {
            Clear-Host
            .\VISO\StatoMD.ps1
            Pause
            Start-Sleep -Seconds 1
            MSD
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
} 

function PDR {
    Clear-Host
    Get-Content ".\SYSCOM\Banners\PDR.ANS"
    Write-Host "`n`nNUM.   COMANDO         (DESCRIZIONE COMANDO)"
    Write-Host "------------------------------------------------------------"
    Write-Host "1.  Crea Checkpoint      (Crea un nuovo punto di ripristino)"
    Write-Host "2.  Elenca Checkpoint    (Elenca tutti i punti di ripristino)"
    Write-Host "3.  Elimina Checkpoint   (Elimina tutti i punti di ripristino)"
    Write-Host "0.  Esci"
    Write-Host ""
    $PDR = Read-Host "Inserisci il numero per l'operazione"
    switch ($PDR) {
        "0" {
           SicurezzaProtezione 
        }
        "" {
           SicurezzaProtezione 
        }
        "1" {
            Clear-Host
            .\VISO\PDR.ps1
            Start-Sleep -Seconds 1
            Pause
            PDR
        }
        "2" {
            Clear-Host
            vssadmin list shadows
            Start-Sleep -Seconds 1
            Pause
            PDR
        }
        "3" {
            Clear-Host
            vssadmin delete shadows /all
            Start-Sleep -Seconds 1
            Pause
            PDR
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}
function Guida4_3 {
    Clear-Host
    Write-Host "`nTra poco sarai reinderizzato alla pagina di DEBUG..." -ForegroundColor Yellow
    Write-Host "`n`nHAI SELEZIONATO LA MODALITÀ 4:3"
    Write-Host "`n`a!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LA MODALITÀ SCHERMO INTERO PRIMA DI PASSARE AL DEBUG" -ForegroundColor Red

    $4_3 = Read-Host "`nVuoi passare alla schermata di DEBUG per i monitor 4:3 [S/N]"
    switch ($4_3) {
        "S" {
            Debug4_3
        }
        "N" {
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

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



function Debug4_3 {
    Clear-Host
    Write-Host "`n      Schermata per capire la risoluzione massima supportata da SYSCOM     " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "<<<--------------------DEVO-VEDERMI-IN-UNA-SOLA-RIGA-------------------->>>"
    Write-Host ""
    Write-Host "`a!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LARGHEZZA SHELL PER VISUALIZZARE TUTTA LA LINEA IN UNA SOLA RIGA" -ForegroundColor Red
    Write-Host "`n`n"
    Write-Host "`nUtilizza le seguenti combinazioni di tasti"
    Write-Host "per regolare la dimensione del testo nel terminale:"
    Write-Host ""
    Write-Host ""
    Write-Host "CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "CTRL + +  : Aumenta la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "CTRL + -  : Diminuisce la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "`n`n"
    Write-Host "Quando hai impostato correttamente la larghezza batti un tasto" -ForegroundColor GREEN
    CTRLPause
}
function Guida16_9 {
    Clear-Host
    Write-Host "`nTra poco sarai reinderizzato alla pagina di DEBUG..." -ForegroundColor Yellow
    Write-Host "`n`nHAI SELEZIONATO LA MODALITÀ 16:9"
    Write-Host "`n`a!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LA MODALITÀ SCHERMO INTERO PRIMA DI PASSARE AL DEBUG" -ForegroundColor Red

    $16_9 = Read-Host "`nVuoi passare alla schermata di DEBUG per i monitor 16:9 [S/N]"
    switch ($16_9) {
        "S" {
            Debug16_9
        }
        "N" {
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}
function Debug16_9 {
    Clear-Host
    Write-Host "`n                            Schermata per capire la risoluzione massima supportata da SYSCOM                           " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "<<<-----------------------------------------DEVO-VEDERMI-IN-UNA-SOLA-RIGA----------------------------------------->>>"
    Write-Host ""
    Write-Host "`a!                                              ! WARNING / ATTENZIONE !                                               !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LARGHEZZA SHELL PER VISUALIZZARE TUTTA LA LINEA IN UNA SOLA RIGA" -ForegroundColor Red
    Write-Host "`n`n"
    Write-Host "`nUtilizza le seguenti combinazioni di tasti"
    Write-Host "per regolare la dimensione del testo nel terminale:"
    Write-Host ""
    Write-Host ""
    Write-Host "CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "CTRL + +     : Aumenta la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "CTRL + -     : Diminuisce la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "`n`n"
    Write-Host "Quando hai impostato correttamente la larghezza premi un tasto" -ForegroundColor GREEN
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

function TEST {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"    
    Write-Host "LARGHEZZA RIGA  3:2, 65 caratteri di lunghezza"
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "LARGHEZZA RIGA 4:3, 75 caratteri di lunghezza"
    Write-host "ALTEZZA RIGA: 5" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 6" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 7" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 8" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 9" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 10" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 11" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 12" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 13" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 14" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 15" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 16" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 17" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 18" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 19" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 20" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 21" -ForegroundColor Green
    Write-host "ALTEZZA RIGA: 22" -ForegroundColor Red
    Write-host "ALTEZZA RIGA: 23" -ForegroundColor Green



}

function TEST2 {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃RIGA 1 ASCII ART                                               ┃"
    Write-Host "┃RIGA 2 ASCII ART                                               ┃"
    Write-Host "┃RIGA 3 ASCII ART                                               ┃"
    Write-Host "┃RIGA 4 ASCII ART                                               ┃"
    Write-Host "┃RIGA 5 ASCII ART                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO     (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┃"
    Write-Host "┃`t1. Manutenzione del Sistema Operativo e dei Dischi      ┃"
    Write-Host "┃`t2. Gestione di Rete e Applicazioni                      ┃"
    Write-Host "┃`t3. Sicurezza e Protezione                               ┃"
    Write-Host "┃`t4. Manutenzione del Sistema Operativo e dei Dischi      ┃"
    Write-Host "┃`t5. Manutenzione del Sistema Operativo e dei Dischi      ┃"
    Write-Host "┃`t6. Manutenzione del Sistema Operativo e dei Dischi      ┃"
#    Write-Host $festa
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $fakechoise = Read-Host " "
    Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red

    switch ($fakechoise) {
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function MENU {
    Clear-Host
    Write-Host ""
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃                                                               ┃"
    Get-Content ".\SYSCOM\Banners\SYSCOM"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Get-Content .\SYSCOM\Banners\MENU.ANS
    Write-Host "┃                                                               ┃"
    Write-Host $festa
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $choice = Read-Host " "
    switch ($choice) {
            "1" { DSK_SO }
            "2" { GestioneReteApplicazioni }
            "3" { SicurezzaProtezione }
            "0" { exit }
            "&FS" {
                Start-Process .\VISO\F11.vbs
            }
            "&L" {
                Clear-Host
                Write-Host ""
                Get-Content ".\VISO\LICENZA"
                }
            "&32" { Guida3_2 }
            "&V0" {
                INFO
            }
            "404" {WINGET UNINSTALL SYSCOM}
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
 
}

function CRT {
    Clear-Host
        Get-Content ".\SYSCOM\Banners\CRT_COLORS.utf8ans"
}

function SITO {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃                                                               ┃"
    Write-Host "┃1.  Download       (Scarica l'ultima versione di SYSCOM CLI)   ┃"
    Write-Host "┃2.  Manuale        (Scopri come installare e utilizzare SYSCOM)┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
}

do {
    Clear-Host
    Write-Host ""
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
    Write-Host "┃`tQ. Esci \ \ \ \ \ \ \ \ \ \ 404. Disintalla SYSCOM      ┃"
    Write-Host "┃                                                               ┃"
    Write-Host $festa
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci il numero per l'operazione                          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $choice = Read-Host " "
    while ($choice.Length -gt 5) {
        .\SYSCOM.PS1
        exit
    }
    switch ($choice) {
        "1" { DSK_SO }
        "2" { GestioneReteApplicazioni }
        "3" { SicurezzaProtezione }
        "&FS" {Start-Process .\VISO\F11.vbs}
        "VISO" {
            Set-Location .\VISO
            Start-Process  .\VISO.BAT
            cd..
        }
        "&L" {
            Clear-Host
            Write-Host ""
            Get-Content ".\VISO\LICENZA"
            }
        "&AU" {
            Clear-Host
            Write-Host ""
            Get-Content ".\VISO\AUTRICE.ANS"
        }
        "0.0" {
            .\SYSCOM.PS1
            exit
        }
        "&32" { Guida3_2 }
        "&43" { Guida4_3 }
        "&16" { Guida16_9 }
        "&V0" {INFO}
        "&PO" { ./PORTABLE.PS1}
        "&TEST" { TEST }
        "&TEST2" { TEST2 }
        "COLOR" { MENU }
        "D32" {Debug3_2}
        "404" {WINGET UNINSTALL SYSCOM}
        "&CRT" {CRT}
        "APP" {App}
        "NET" {NET_Menu}
        "WGLIST" {WGLIST}
        "WG" {WG}
        "WIN11" {WINDOWS11}
        "SITO" {SITO}
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
        "Q" {
            exit
            return $false
        }
    }

    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
 
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
