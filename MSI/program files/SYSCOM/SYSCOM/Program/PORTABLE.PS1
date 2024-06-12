# Funzione per controllare la versione di PowerShell
function Check-PowerShellVersion {
    $psVersion = $PSVersionTable.PSVersion
    $requiredVersion = [Version]"7.4.2"
    if ($psVersion -lt $requiredVersion) {
        Write-Output "Questo setup richiede PowerShell 7.4.2 o superiore. La tua versione attuale è $psVersion."
        Write-Output "Aggiorna PowerShell e riprova."
        Pause
        exit
    }
}

# Verifica la versione di PowerShell
Check-PowerShellVersion

Add-Type -AssemblyName PresentationFramework

# XAML per la GUI
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Installazione del Programma" Height="300" Width="400">
    <Grid>
        <TextBlock Text="Seleziona la cartella di installazione:" VerticalAlignment="Top" Margin="10,10,10,0"/>
        <TextBox Name="InstallPathTextBox" Text="C:\SYSCOM" VerticalAlignment="Top" Margin="10,30,10,0" Height="25"/>
        <Button Name="BrowseButton" Content="Sfoglia" Width="75" Height="25" VerticalAlignment="Top" Margin="10,60,10,0" HorizontalAlignment="Left"/>
        <TextBlock Name="StatusText" Text="Pronto per l'installazione." VerticalAlignment="Top" Margin="10,100,10,0" TextWrapping="Wrap"/>
        <Button Name="InstallButton" Content="Installa" Width="100" Height="30" VerticalAlignment="Bottom" Margin="10" HorizontalAlignment="Left"/>
        <Button Name="CancelButton" Content="Annulla" Width="100" Height="30" VerticalAlignment="Bottom" Margin="10" HorizontalAlignment="Right"/>
    </Grid>
</Window>
"@

# Leggi e carica il XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Funzione per gestire il clic sul pulsante Sfoglia
$BrowseButton_Click = {
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.ShowDialog() | Out-Null
    if ($folderBrowser.SelectedPath -ne "") {
        $window.InstallPathTextBox.Text = $folderBrowser.SelectedPath
    }
}

# Funzione per gestire il clic sul pulsante Installa
$InstallButton_Click = {
    $installFolder = $window.FindName("InstallPathTextBox").Text
    $statusText = $window.FindName("StatusText")
    $statusText.Text = "Scaricamento e installazione in corso..."

    # URL del file zip del programma
    $url = "https://vittoriaalata.github.io/VWS/SYSCOM/SYSCOM.zip"
    # Percorso del file zip scaricato
    $outputFile = "$installFolder\SYSCOM.zip"
    # Directory del desktop dell'utente
    $desktopPath = [System.Environment]::GetFolderPath("Desktop")

    try {
        # Crea la directory di installazione se non esiste
        if (-not (Test-Path $installFolder)) {
            New-Item -Path $installFolder -ItemType Directory | Out-Null
        }

        # Scarica il file zip
        Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop

        # Decomprimi il file zip nella cartella specificata
        Expand-Archive -Path $outputFile -DestinationPath $installFolder -Force

        # Rimuovi il file zip dopo l'estrazione
        Remove-Item $outputFile

        $statusText.Text += "`nInstallazione completata."

        # Crea un collegamento sul desktop
        $shortcutPath = Join-Path $desktopPath "SYSCOM.lnk"
        $shell = New-Object -ComObject WScript.Shell
        $shortcut = $shell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = "$installFolder\SYSCOM.PS1"
        $shortcut.WorkingDirectory = $installFolder
        $shortcut.Save()

        $statusText.Text += "`nCollegamento sul desktop creato."
    }
    catch {
        $statusText.Text += "`nSi è verificato un errore durante l'installazione: $_"
    }
}

# Funzione per gestire il clic sul pulsante Annulla
$CancelButton_Click = {
    $window.Close()
}

# Associa le funzioni agli eventi dei pulsanti
$window.FindName("BrowseButton").Add_Click($BrowseButton_Click)
$window.FindName("InstallButton").Add_Click($InstallButton_Click)
$window.FindName("CancelButton").Add_Click($CancelButton_Click)

# Mostra la finestra
$window.ShowDialog() | Out-Null
