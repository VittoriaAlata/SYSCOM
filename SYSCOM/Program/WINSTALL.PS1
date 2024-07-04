Write-Host "BAtti il nome del pachetto da installare tramite WINGET"
$Pachetto = Read-Host " "

winget.exe install $Pachetto