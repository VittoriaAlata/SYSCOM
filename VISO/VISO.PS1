# Tenta di ottenere la directory di installazione di Windows Terminal dal registro di sistema
Import-Module %ProgramFiles%


$wtRegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\wt.exe"
$wtDirectory = (Get-ItemProperty -Path $wtRegistryPath -ErrorAction SilentlyContinue).Path
$PWSHDirectory = %ProgramFiles%\PowerShell\7\\
$pwshPath = %ProgramFiles%\PowerShell\7\pwsh.exe


# Se non riesci a trovare la directory tramite il registro di sistema, cerca in altre posizioni comuni
if (-not $wtDirectory) {
    $commonPaths = @(
        "$env:ProgramFiles\WindowsApps\Microsoft.WindowsTerminal_*",
        "$env:LOCALAPPDATA\Microsoft\WindowsApps\Microsoft.WindowsTerminal_*"
    )

    foreach ($path in $commonPaths) {
        $wtDirectories = Get-ChildItem -Path $path -Directory | Where-Object { $_.Name -like "Microsoft.WindowsTerminal_*" }

        if ($wtDirectories) {
            $wtDirectory = $wtDirectories[0].FullName
            break
        }
    }
}

if (-not $wtDirectory) {
    Write-Host "Impossibile trovare la directory di installazione di Windows Terminal."
    exit
}

# Apre la directory di installazione di Windows Terminal
#Invoke-Item $wtDirectory

# Controlla se l'utente ha già i privilegi di amministratore
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Richiedi l'elevazione dei privilegi per avviare il file batch
   #Start-Process wt.exe -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    $command = "echo ciao"
Start-Process wt.exe -ArgumentList "new-tab", "$env:UserProfile\Desktop\VISO\VISO.BAT" -Verb RunAs
   #Start-Process wt.exe -ArgumentList "new-tab" -Verb RunAs -WorkingDirectory "$env:ProgramFiles\PowerShell\7\\"
   #Start-Process wt.exe -ArgumentList "new-tab" -Verb RunAs
} else {
    Write-Host "L'utente ha già i privilegi di amministratore."
    # Puoi eseguire altre azioni qui se necessario
}
pause