# Imposta i percorsi delle DLL
$assemblyPath = "C:\Users\pierl\Downloads\Terminal.Gui-1.17.0\Terminal.Gui-1.17.0\Terminal.Gui\bin\Debug\netstandard2.0\Terminal.Gui.dll"
$nstackPath = "C:\Users\pierl\Downloads\Terminal.Gui-1.17.0\Terminal.Gui-1.17.0\UnitTests\bin\Debug\net8.0\NStack.dll"

# Importa le DLL
Add-Type -Path $assemblyPath
Add-Type -Path $nstackPath

# Definisci la funzione per mostrare il menu SYSCOM
function Show-SyscomMenu {
    [Terminal.Gui.Application]::Init()

    $top = [Terminal.Gui.Application]::Top

    # Crea una finestra per il menu SYSCOM
    $win = New-Object Terminal.Gui.Window -Property @{
        Title = "SYSCOM Menu"
        X = 0
        Y = 1
        Width = [Terminal.Gui.Dim]::Fill()
        Height = [Terminal.Gui.Dim]::Fill()
    }
    $top.Add($win)

    # Definisci i pulsanti anziché gli elementi di menu
    $button1 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 1
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "1. Manutenzione del Sistema Operativo e dei Dischi"
        Clicked = {
            Write-Host "Manutenzione del Sistema Operativo e dei Dischi"
            # Aggiungi qui la logica per la funzione DSK_SO
        }
    }
    $top.Add($button1)

    $button2 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 2
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "2. Gestione di Rete e Applicazioni"
        Clicked = {
            Write-Host "Gestione di Rete e Applicazioni"
            # Aggiungi qui la logica per la funzione GestioneReteApplicazioni
        }
    }
    $top.Add($button2)

    $button3 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 3
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "3. Sicurezza e Protezione"
        Clicked = {
            Write-Host "Sicurezza e Protezione"
            # Aggiungi qui la logica per la funzione SicurezzaProtezione
        }
    }
    $top.Add($button3)

    $button4 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 4
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "FS. Schermo Intero"
        Clicked = {
            Write-Host "Schermo Intero"
            Start-Process -FilePath ".\VISO\F11.vbs"
        }
    }
    $top.Add($button4)

    $button5 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 5
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "32. Imposta la risoluzione"
        Clicked = {
            Write-Host "Imposta la risoluzione"
            # Aggiungi qui la logica per la funzione Guida3_2
        }
    }
    $top.Add($button5)

    $button6 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 6
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "V0. Info"
        Clicked = {
            Write-Host "Info"
            # Aggiungi qui la logica per la funzione INFO
        }
    }
    $top.Add($button6)

    $button7 = New-Object Terminal.Gui.Button -Property @{
        X = 0
        Y = 7
        Width = [Terminal.Gui.Dim]::Fill()
        Text = "0. Esci"
        Clicked = {
            [Terminal.Gui.Application]::RequestStop()
        }
    }
    $top.Add($button7)

    # Esegui l'applicazione TUI
    [Terminal.Gui.Application]::Run()
}


# Chiamare la funzione per mostrare il menu SYSCOM
Show-SyscomMenu
