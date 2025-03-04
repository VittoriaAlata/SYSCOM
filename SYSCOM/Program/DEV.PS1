
function SITO {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Write-Host "┃                                                               ┃"
    Write-Host "┃1.  Download       (Scarica l'ultima versione di SYSCOM CLI)   ┃"
    Write-Host "┃2.  Manuale        (Scopri come installare e utilizzare SYSCOM)┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $fakechoise = Read-Host " "
    Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red

    switch ($fakechoise) {
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
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