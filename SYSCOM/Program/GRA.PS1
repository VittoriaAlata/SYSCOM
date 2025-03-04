#Funzioni di Gestione Rete e Applicazioni
function GRA {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\RETEAPP"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.  COMANDO      (DESCRIZIONE COMANDO)                       ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━        ┃"
    Write-Host "┃1.    App          (Strumenti per pachetti e programmi)        ┃"
    Write-Host "┃2.    NET          (Strumenti per il network e dischi di rete) ┃"
    Write-Host "┃3.    Copilot      (Strumenti Copilot)                         ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

    $GRA = Read-Host " "
    switch ($GRA) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        MAIN
    }
    {$_ -eq "1" -or $_ -eq "A" -or $_ -eq "a"} {
        App
    }
    {$_ -eq "2" -or $_ -eq "N" -or $_ -eq "n"} {
        NET_Menu
    }
    {$_ -eq "3" -or $_ -eq "C" -or $_ -eq "c"} {
        Copilot
    }
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $APP = Read-Host " "
    switch ($APP) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        GRA
    }
    {$_ -eq "1" -or $_ -eq "W" -or $_ -eq "w"} {
        WG
    }
    {$_ -eq "2" -or $_ -eq "D" -or $_ -eq "d"} {
        DISINSTALLA
        Invoke-Expression "$env:windir\System32\appwiz.cpl"
        Start-Sleep -Seconds 1     
        App
    }
        # "2" {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $WINGET = Read-Host " "
    switch ($WINGET) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        App
    }
    {$_ -eq "1" -or $_ -eq "I" -or $_ -eq "i"} {
            Clear-Host
            .\SYSCOM\Program\WINSTALL.PS1
            Pause
            Start-Sleep -Seconds 1
            WG
    }
    {$_ -eq "2" -or $_ -eq "A" -or $_ -eq "a"} {
            Clear-Host
            winget upgrade --all --include-unknown
            Pause
            Start-Sleep -Seconds 1     
            WG
    }
    {$_ -eq "3" -or $_ -eq "L" -or $_ -eq "l"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $WGLIST = Read-Host " "
    switch ($WGLIST) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        WG
    }
    {$_ -eq "1" -or $_ -eq "L" -or $_ -eq "l"} {
            Clear-Host
            .\SYSCOM\Program\WGLIST.PS1
            Pause
            Start-Sleep -Seconds 1
            WGLIST
    }
    {$_ -eq "2" -or $_ -eq "E" -or $_ -eq "e"} {
            Clear-Host
            .\SYSCOM\Program\WGEXP.PS1
            Pause
            Start-Sleep -Seconds 1
            WGLIST
    }
    {$_ -eq "3" -or $_ -eq "I" -or $_ -eq "i"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $NET = Read-Host " "
    switch ($NET) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        GRA
    }
    {$_ -eq "1" -or $_ -eq "P" -or $_ -eq "p"} {
            PULIZIANET
    }
    {$_ -eq "2" -or $_ -eq "C" -or $_ -eq "C"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $PULIZIANET = Read-Host " "
    switch ($PULIZIANET) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        NET_Menu
    }
    {$_ -eq "1" -or $_ -eq "S" -or $_ -eq "s"} {
            Clear-Host
            netsh winsock reset
            Pause
            Start-Sleep -Seconds 1  
            PULIZIANET
    }
    {$_ -eq "2" -or $_ -eq "F" -or $_ -eq "f"} {
            Clear-Host
            ipconfig /flushdns
            Pause
            Start-Sleep -Seconds 1     
            PULIZIANET
    }
    {$_ -eq "3" -or $_ -eq "U" -or $_ -eq "u"} {
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CARTELLECONDIVISE = Read-Host " "
    switch ($CARTELLECONDIVISE) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        NET_Menu
    }
    {$_ -eq "1" -or $_ -eq "I" -or $_ -eq "i"} {
            control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced
            Start-Sleep -Seconds 1     
            GRA
    }
    {$_ -eq "2" -or $_ -eq "S" -or $_ -eq "s"} {
            shrpubw.exe
            Start-Sleep -Seconds 1     
            GRA
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
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $CPLT = Read-Host " "
    switch ($CPLT) {
    {$_ -eq "0" -or $_ -eq "" -or $_ -eq "q"} {
        GRA
    }
    {$_ -eq "1" -or $_ -eq "V" -or $_ -eq "v"} {
            Start-Process .\SYSCOM\Copilot.url
            Start-Sleep -Seconds 1     
            COPILOT
    }
    {$_ -eq "2" -or $_ -eq "T" -or $_ -eq "t"} {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '1'
            Start-Sleep -Seconds 1     
            COPILOT
    }
    {$_ -eq "3" -or $_ -eq "D" -or $_ -eq "d"} {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '0'
            Start-Sleep -Seconds 1     
            COPILOT
    }
    {$_ -eq "4" -or $_ -eq "B" -or $_ -eq "b"} {
            Start-Process https://github.com/thebookisclosed/ViVe
            Start-Sleep -Seconds 1     
            COPILOT
    }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}
