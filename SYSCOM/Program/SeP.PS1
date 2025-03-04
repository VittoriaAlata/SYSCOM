#Funzioni di Sicurezza e Protezione
function SeP {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\SECURE"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO           (DESCRIZIONE COMANDO)                 ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.  wscui.cpl            (Sicurezza e manutenzione)		┃"
    Write-Host "┃2.  sigverif.exe         (Verifica firma file)			┃"
    Write-Host "┃3.  MRT.exe              (Rimozione malware Microsoft Windows) ┃"
    Write-Host "┃4.  Backup               (Strumentti di Backup			┃"
    Write-Host "┃5.  Imp. di Criptaggio   (Crittografia del dispositivo)	┃"
    Write-Host "┃6.  Microsoft Defender   (Strumenti Microsoft Defender)	┃" 
    Write-Host "┃7.  Punti di Ripristino  (Strumenti Punti di Ripristino)	┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $SeP = Read-Host " "

    switch ($SeP) {
        "0" {MAIN}
        "" {MAIN}
        "1" {
            Invoke-Expression "$env:windir\System32\wscui.cpl"
            Start-Sleep -Seconds 1
            SeP
        }
        "2" {
            Invoke-Expression "$env:windir\System32\sigverif.exe"
            Start-Sleep -Seconds 1
            SeP
        }
        "3" {
            Invoke-Expression "$env:windir\System32\MRT.exe"
            Start-Sleep -Seconds 1
            SeP
        }
        "4" {
            Start-Sleep -Seconds 1
            BU
            SeP
        }
        "5" {
            control.exe /name Microsoft.DeviceEncryption
            Start-Sleep -Seconds 1
            SeP
        }
        "6" {
            Start-Sleep -Seconds 1
            MSD
            SeP
        }
        "7" {
            Start-Sleep -Seconds 1
            PDR
            SeP
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function Sicurezza {
	Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\SECURE"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO           (DESCRIZIONE COMANDO)                 ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.  msconfig.exe         (configurazione di sistema)           ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
	Write-Host ""
	$S=Read-Host " "
	switch ($S) {
	 "1" {
            Invoke-Expression "$env:windir\System32\msconfig.exe"
            Start-Sleep -Seconds 1     
            SeP
         }
	}
}

function BU {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\BU"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO           (DESCRIZIONE COMANDO)                 ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1. recdisc.exe     (Strumento di riparazione del disco)        ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    Clear-Host
    $MSD = Read-Host " "
    switch ($MSD) {
        "0" {
           SeP 
        }
        "" {
           SeP 
        }
        "1" {
            Invoke-Expression "$env:windir\System32\recdisc.exe"
            Start-Sleep -Seconds 1     
            SeP
        }
        Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}

function MSD {
    Clear-Host
    Write-Host "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    Get-Content ".\SYSCOM\Banners\MSD.ANS"
    Write-Host "┃                                                               ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┃NUM.   COMANDO           (DESCRIZIONE COMANDO)                 ┃"
    Write-Host "┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━            ┃"
    Write-Host "┃1.  Scansione MD (c) (Scansione Microsoft Defender, COMPLETA)  ┃"
    Write-Host "┃2.  Attiva MD (Attiva protezione massima Microsoft Defender)   ┃"
    Write-Host "┃3.  Scansione MD (v) (Scansione Microsoft Defender, VELOCE)    ┃"
    Write-Host "┃4.  Stato MD (Visualizza Stato attuale Microsoft Defender)     ┃"
    Write-Host "┃                                                               ┃"
    Write-Host "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    Write-Host "┃ Inserisci numero o iniziale del COMANDO per eseguire          ┃"
    Write-Host "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    $MSD = Read-Host " "
    switch ($MSD) {
        "0" {
           SeP 
        }
        "" {
           SeP 
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
    Write-Host "4.  SPP                  (Protezione Sistema)"
    Write-Host "0.  Esci"
    Write-Host ""
    $PDR = Read-Host "Inserisci il numero per l'operazione"
    switch ($PDR) {
        "0" {
           SeP 
        }
        "" {
           SeP 
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
        "4" {
            SystemPropertiesProtection
            Start-Sleep -Seconds 1
            PDR
        }
	Default {
            Write-Host "━━━━━━━━━━━━━━━━━━INSERISCI━UN━OPERAZIONE━VALIDA━━━━━━━━━━━━━━━━━" -ForegroundColor Red
        }
    }
}