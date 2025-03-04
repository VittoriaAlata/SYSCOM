#Funzioni per Dischi e S.O.
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $MDeSO = Read-Host " "
    switch ($MDeSO) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        MAIN
    }
    {$_ -eq "1" -or $_ -eq "S" -or $_ -eq "s"} {
        SO
    }
    {$_ -eq "2" -or $_ -eq "D" -or $_ -eq "d"} {
        DSK
    }
    {$_ -eq "3" -or $_ -eq "H" -or $_ -eq "h"} {
        HARDWARE
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $SO = Read-Host " "
    switch ($SO) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        DSK_SO
    }
    {$_ -eq "1" -or $_ -eq "S" -or $_ -eq "s"} {
            Clear-Host
            sfc /scannow
            Pause
            Start-Sleep -Seconds 1     
            SO
    }
    {$_ -eq "2" -or $_ -eq "D" -or $_ -eq "d"} {
            Clear-Host
            dism /online /cleanup-image /restorehealth /Loglevel:2
            Start-Sleep -Seconds 1
            Pause     
            SO
    }
    {$_ -eq "3" -or $_ -eq "W" -or $_ -eq "w"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $DSK = Read-Host " "
    switch ($DSK) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        DSK_SO
    }
    {$_ -eq "1" -or $_ -eq "H" -or $_ -eq "h"} {
        CHKDSK
    }
    {$_ -eq "2" -or $_ -eq "A" -or $_ -eq "a"} {
        Canc
    }
    {$_ -eq "3" -or $_ -eq "D" -or $_ -eq "d"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CHKDSK = Read-Host " "
    switch ($CHKDSK) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        DSK
    }
    {$_ -eq "1" -or $_ -eq "F" -or $_ -eq "f"} {
            Clear-Host
            chkdsk /f
            Pause
            Start-Sleep -Seconds 1     
            CHKDSK
    }
    {$_ -eq "2" -or $_ -eq "R" -or $_ -eq "r"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CANC = Read-Host " "
    switch ($CANC) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        DSK
    }
    {$_ -eq "1" -or $_ -eq "C" -or $_ -eq "c"} {
            Invoke-Expression "$env:windir\System32\cleanmgr.exe"
            Start-Sleep -Seconds 1     
            Canc
    }
    {$_ -eq "2" -or $_ -eq "D" -or $_ -eq "d"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $HDWE = Read-Host " "
    switch ($HDWE) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        DSK_SO
    }
    {$_ -eq "1" -or $_ -eq "D" -or $_ -eq "d"} {
            Invoke-Expression "$env:windir\System32\dxdiag.exe"
            Start-Sleep -Seconds 1     
            HARDWARE
    }
    {$_ -eq "2" -or $_ -eq "R" -or $_ -eq "r"} {
            REPORT
    }
    {$_ -eq "3" -or $_ -eq "H" -or $_ -eq "h"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $RPRT = Read-Host " "
    switch ($RPRT) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        HARDWARE
    }
    {$_ -eq "1" -or $_ -eq "E" -or $_ -eq "e"} {
            Clear-Host
            powercfg /energy
            Pause
            Start-Sleep -Seconds 1     
            REPORT
    }
    {$_ -eq "2" -or $_ -eq "B" -or $_ -eq "b"} {
            Clear-Host
            powercfg /batteryreport
            Pause
            Start-Sleep -Seconds 1     
            REPORT
    }
    {$_ -eq "3" -or $_ -eq "M" -or $_ -eq "m"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

    $WIN11 = Read-Host " "
    

    switch ($WIN11) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        SO
    }
    {$_ -eq "1" -or $_ -eq "I" -or $_ -eq "i"} {
            ISOWIN11
    }
    {$_ -eq "2" -or $_ -eq "T" -or $_ -eq "t"} {
            Start-Process https://github.com/harsha2koo/W11x64.bat/blob/main/W11_x64-TPM.cmd
            Start-Sleep -Seconds 1     
            WINDOWS11
    }
    {$_ -eq "3" -or $_ -eq "G" -or $_ -eq "g"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $ISOWIN11 = Read-Host " "
    switch ($ISOWIN11) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        WINDOWS11
    }
    {$_ -eq "1" -or $_ -eq "I" -or $_ -eq "i"} {
            Start-Process https://www.microsoft.com/it-it/software-download/windows11
            Start-Sleep -Seconds 1     
            ISOWIN11
    }
    {$_ -eq "2" -or $_ -eq "W" -or $_ -eq "w"} {
            Start-Process https://www.microsoft.com/it-it/software-download/
            Start-Sleep -Seconds 1
            ISOWIN11
    }
    {$_ -eq "3" -or $_ -eq "S" -or $_ -eq "s"} {
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
