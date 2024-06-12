$OutputEncoding = [System.Text.Encoding]::UTF8

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')

if (-not $isAdmin) {
    Start-Process pwsh.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}
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
##    Write-Host "┃1.  SFC            (Analizza integrità file di sistema)        ┃" funzione SO
##    Write-Host "┃2.  CHKDSK (f)     (Controlla disco e visualizza rapporto)     ┃" funzione DSK nella funzione DSK-SO
##    Write-Host "┃3.  CHKDSK (r)     (Individua settori danneggiati)             ┃" funzione DSK nella funzione DSK-SO
##    Write-Host "┃4.  DISM           (Manutenzione immagini di sistema)          ┃" funzione SO nella funzione DSK-SO
##    Write-Host "┃5.  POWERCFG (e)   (Report energia del computer)               ┃" funzione HARDWARE nella funzione DSK-SO
##    Write-Host "┃6.  POWERCFG (b)   (Report stato batteria)                     ┃" funzione HARDWARE nella funzione DSK-SO
##    Write-Host "┃7.  MdSched.exe    (Diagnostica memoria centrale)              ┃" funzione HARDWARE nella funzione DSK-SO
##    Write-Host "┃8.  cleanmgr.exe   (Cancella file non necessari dal disco)     ┃" funzione per la cancellazionenella funzione DSK dei file nella funzione DSK-SO
##    Write-Host "┃9.  dfrgui.exe     (Deframmenta e ottimizza unità)             ┃" funzione DSK nella funzione DSK-SO
#    Write-Host "┃10. recdisc.exe     (Strumento di riparazione del disco)        ┃" VA NELLA PARTE DI BACKUP IN UNA NUOVA FUNZIONE NELLA FUNZIONE SECURE
##    Write-Host "┃11. dxdiag.exe     (Strumento di diagnostica Direct X)         ┃" funzione HARDWARE nella funzione DSK-SO
##    Write-Host "┃12. Win 11         (Strumenti Windows 11)                      ┃" funzione SO nella funzione DSK-SO
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
        
#        "1" { 
#            Clear-Host
#            sfc /scannow
#            Pause
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "2" {
#            Clear-Host
#            chkdsk /f
#            Pause
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "3" {
#            Clear-Host
#            chkdsk /r
#            Pause
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "4" {
#            Clear-Host
#            dism /online /cleanup-image /restorehealth /Loglevel:2
#            Start-Sleep -Seconds 1
#            Pause     
#            DSK_SO
#        }
#        "5" {
#            Clear-Host
#            powercfg /energy
#            Pause
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "6" {
#            Clear-Host
#            powercfg /batteryreport
#            Pause
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "7" {
#            Invoke-Expression "$env:windir\System32\MdSched.exe"
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "8"{
#            Invoke-Expression "$env:windir\System32\cleanmgr.exe"
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "9" {
#            Invoke-Expression "$env:windir\System32\dfrgui.exe"
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "10" {
#            Invoke-Expression "$env:windir\System32\recdisc.exe"
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "11" {
#            Invoke-Expression "$env:windir\System32\dxdiag.exe"
#            Start-Sleep -Seconds 1     
#            DSK_SO
#        }
#        "12" {
#            WINDOWS11
#        }
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
    Write-Host "┃3.  Win 11         (Strumenti Windows 11)                      ┃"
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
    Write-Host "┃                                                               ┃"
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
    Write-Host "┃                                                               ┃"
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
    Get-Content ".\SYSCOM\Banners\WINDOWS11.ANS"
    Write-Host "`n`nNUM  COMANDO        (DESCRIZIONE COMANDO)"
    Write-Host "-------------------------------------------"
    Write-Host "1.  ISO Ufficiale    (Scarica Windows 11 ufficiale)"
    Write-Host "2.  TPM              (Compatibilità Windows 11)"
    Write-Host "3.  Guida            (Guida compatibilità Windows 11)"
    Write-Host "4.  Scarica software (Scarica versioni Windows)"
    Write-Host "5.  Scarica ISO      (Scarica ISO Windows 10/11)"
    Write-Host "0.  Esci"
    Write-Host ""
    $WIN11 = Read-Host "Inserisci il numero per l'operazione"
    

    switch ($WIN11) {
        "0" {
            SO 
        }
        "" {
           SO
        }
        "1" {
            Start-Process https://www.microsoft.com/it-it/software-download/windows11
            Start-Sleep -Seconds 1     
            WINDOWS11
        }
        "2" {
            Start-Process https://github.com/harsha2koo/W11x64.bat/blob/main/W11_x64-TPM.cmd
            Start-Sleep -Seconds 1     
            WINDOWS11
        }
        "3" {
            Clear-Host
            Write-Host "1. Scarica il media creation tool dal sito della Microsoft mediante l'opzione 1"
            Write-Host "2. Scarica l'eseguibile TPM mediante l'opzione 2"
            Write-Host "3. Dopo aver scaricato i programmi crea l'immagine ISO di Windows 11"
            Write-Host "4. Montare per la prima volta la ISO premendoci sopra con il tasto destro e cliccando 'Monta'"
            Write-Host "5. Chiudere l'immagine montata e eseguire l'eseguibile TPM"
            Write-Host "6. Dopo l'avviso di corretta eliminazione del TPM rimontare la ISO"
            Write-Host "7. Premere su setup.exe e proseguire con l'istallazione guidata"
            pause
            Start-Sleep -Seconds 1     
            WINDOWS11
        }
        "4" {
            Start-Process https://www.microsoft.com/it-it/software-download/
            Start-Sleep -Seconds 1
            WINDOWS11
        }
        "5" {
            Start-Process https://uupdump.net
            Start-Sleep -Seconds 1
            WINDOWS11
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
    
}

function GestioneReteApplicazioni {
    Clear-Host
    Get-Content ".\SYSCOM\Banners\RETEAPP"
    Write-Host "`n`nNUM.   COMANDO      (DESCRIZIONE COMANDO)"
    Write-Host "-------------------------------------------"
    Write-Host "1.     WINGET       (Installa/aggiorna app)"
    Write-Host "2.     appwiz.cpl   (Disistalla o Modifica programma)"
    Write-Host "3.     taskmgr.exe  (Gestione attività)"
    Write-Host "4.     msconfig.exe (Config. di sistema)"
    Write-Host "5.     NETSH        (Pulisce winsock)"
    Write-Host "6.     flushdns     (Svuota cache, reimposta registro DNS)"
    Write-Host "7.     ICiRA        (Impostazioni condivisione in rete avanzate)"
    Write-Host "8.     net use      (Elimina connessioni dischi di rete attive)"
    Write-Host "9.     shrpubw.exe  (Creazione guidata cartella condivisa)"
#    Write-Host "10.    dTeP         (Canc file temporanei e file di prefetch)" INSERIRE OPERAZIONE IN UNA NUOVA FUNZIONE PER I FILE TEMPORANEI
    Write-Host "11.    Copilot      (Strumenti Copilot)"
    Write-Host "0.     Esci"
    Write-Host ""
    $GRA = Read-Host "Inserisci il numero per l'operazione"
    

    switch ($GRA) {
        "0" {
           .\SYSCOM.PS1 
        }
        "" {
           .\SYSCOM.PS1 
        }
        "1" {
            Clear-Host
            winget upgrade --all --include-unknown
            Pause
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "2" {
            Invoke-Expression "$env:windir\System32\appwiz.cpl"
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "3" {
            Invoke-Expression "$env:windir\System32\taskmgr.exe"
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "4" {
            Invoke-Expression "$env:windir\System32\msconfig.exe"
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "5" {
            Clear-Host
            netsh winsock reset
            Pause
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "6" {
            Clear-Host
            ipconfig /flushdns
            Pause
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "7" {
            control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "8" {
            Clear-Host
            net use * /delete
            Pause
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "9" {
            shrpubw.exe
            Start-Sleep -Seconds 1     
            GestioneReteApplicazioni
        }
        "10" {
            Clear-Host
            Start-Sleep -Seconds 1  
            GestioneReteApplicazioni
        }
        "11" {
            COPILOT
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function COPILOT {
    Clear-Host
    Get-Content ".\SYSCOM\Banners\COPILOT.ANS"
    Write-Host "`n`nNUM.   COMANDO              (DESCRIZIONE COMANDO)"
    Write-Host "--------------------------------------------------"
    Write-Host "1.     Avvia Copilot        (Avvia url di Copilot)"
    Write-Host "2.     Attiva Copilot       (Imposta IsUserEligible a 1)"
    Write-Host "3.     Disattiva Copilot    (Imposta IsUserEligible a 0)"
    Write-Host "4.     ViVe Tool            (Abilita funzionalità sperimentali di Windows)"
    Write-Host "0.     Esci"
    Write-Host ""
    $CPLT = Read-Host "Inserisci il numero per l'operazione"
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
    Get-Content ".\SYSCOM\Banners\SECURE"
    Write-Host "`n`nNUM.   COMANDO           (DESCRIZIONE COMANDO)"
    Write-Host "--------------------------------------------------------"
    Write-Host "1.  wscui.cpl            (Sicurezza e manutenzione)"
    Write-Host "2.  hotplug.dll          (Rimozione sicura dell`hardware)"
    Write-Host "3.  sigverif.exe         (Verifica firma file)"
    Write-Host "4.  MRT.exe              (Strumento di rimozione malware Microsoft Windows)"
    Write-Host "5.  SPP                  (Protezione Sistema)"
    Write-Host "6.  Imp. di Criptaggio   (Impostazioni di crittografia del dispositivo)"
    Write-Host "7.  Microsoft Defender   (Strumenti Microsoft Defender)"
    Write-Host "8.  Punti di Ripristino  (Strumenti Punti di Ripristino)"
    Write-Host "0.  Esci"
    Write-Host ""
    $SeP = Read-Host "Inserisci il numero per l'operazione"

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
        "2" {
            Invoke-Expression "$env:windir\System32\RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll"
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
    Write-Host "┃`t0. Esci \ \ \ \ \ \ \ \ \ \ 404. Disintalla SYSCOM      ┃"
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
        "&V0" {
            INFO
        }
        "&PO" { ./PORTABLE.PS1}
        "&TEST" { TEST }
        "&TEST2" { TEST2 }
        "COLOR" { MENU
        }
        "D32" {Debug3_2}
        "404" {WINGET UNINSTALL SYSCOM}
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }

    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
 
} while ($true)

# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBPqq74lVKWz3UP
# Ed5aW0bz23qSYm0ErRY1StKAq7eKyaCCBVowggVWMIIDPqADAgECAhAx+LahzdtA
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
# BgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCDwlmBCkVW9+G/gZplaBSVaT6F9
# b+XwDiwH1Zg/HMUL6jANBgkqhkiG9w0BAQEFAASCAgBjXyvsFaJublaBPKoMsj5Y
# SFYRyP/UZdxqCGwW+mgIfif61Fg2hVX7NlbTNbaC2Phwm03aZUx2Wyg9hvcmdgI6
# 9xUsPGg8htom7csplmxr6XWnpJYK8n3y1mibWyL+TK1CA4dkhjxQGmnuKkKCU25S
# pqbIFWqXkJvgw/HrDTXv2t/vyDhBJD9s9UqcRE2uJM7S5Oi6T3KHNPepM85u03du
# YLIBfzzgZ77AU84yYapfZ8PXwtVXtw26wtelAoVHKOU1W9cj+n2GMCQBaCKR1iKL
# DWycmz2mAOvXz9niCfTUL6nW/TaSmU1UeB+56p8oPd8HZsgpRLUrTTrZj6bGwVzh
# A1MGfCJDIVyGBAdLfMAWZWceQpNWxDS3JKEwy31+nXQK7C7baRDWgb4/VoKWviq6
# jFjw2i/btu01R5YmpEZWGIn6W+eFUfT8bI07qhfRKXWrxfH4hqi9SBhlZK0o2Hlh
# KI3FT0ceHMHkdPE/Ee0L5nHSJSDXgp/YWpo4BJn3ts9OK87bjItUsZqW8MMJzlyJ
# ewTnSEkpABUvbVAJY3YL5NuJWHqsM8jli1a3ebHJVcjl+Gqqj7cpm8HV5nuTe/e+
# 9rJmi+swb5XWRSzP34otrNcA4hZpQN/sb/v6IrmUKfewyrZEFoNYzb0QNc6LBceO
# /CY3wE5YvoVgzOKULh1K+A==
# SIG # End signature block
