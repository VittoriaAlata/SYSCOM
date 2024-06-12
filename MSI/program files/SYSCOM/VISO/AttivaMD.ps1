Write-Host "Impostazione del punto di ripristino..."
Set-MpPreference -DisableRestorePoint $false 

Write-Host "Attivazione del monitoraggio in tempo reale..."
Set-MpPreference -DisableRealtimeMonitoring $false 

Write-Host "Abilitazione del monitoraggio del comportamento..."
Set-MpPreference -DisableBehaviorMonitoring $false 

Write-Host "Disattivazione del blocco automatico delle minacce alla prima visualizzazione..."
Set-MpPreference -DisableBlockAtFirstSeen $false 

Write-Host "Attivazione della protezione dalle minacce in ingresso e in uscita..."
Set-MpPreference -DisableIOAVProtection $false 

Write-Host "Disabilitazione della modalità privacy..."
Set-MpPreference -DisablePrivacyMode $false 

Write-Host "Abilitazione dell'aggiornamento delle firme delle minacce all'avvio del sistema..."
Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $false 

Write-Host "Configurazione del consenso per inviare campioni di file sospetti a Microsoft..."
Set-MpPreference -SubmitSamplesConsent 2 

Write-Host "Impostazione del livello di partecipazione ai miglioramenti dell'intelligenza delle minacce..."
Set-MpPreference -MAPSReporting 2 

Write-Host "Impostazione dell'azione predefinita per le minacce di alto livello..."
Set-MpPreference -HighThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce di livello moderato..."
Set-MpPreference -ModerateThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce di basso livello..."
Set-MpPreference -LowThreatDefaultAction 6 

Write-Host "Impostazione dell'azione predefinita per le minacce gravi..."
Set-MpPreference -SevereThreatDefaultAction 6 

Write-Host "Abilitazione della protezione contro le applicazioni potenzialmente indesiderate..."
Set-MpPreference -PUAProtection 1 

Write-Host "Abilitazione della scansione degli archivi per rilevare minacce nascoste..."
Set-MpPreference -DisableArchiveScanning $false 

Write-Host "Abilitazione del sistema di prevenzione delle intrusioni..."
Set-MpPreference -DisableIntrusionPreventionSystem $false 

Write-Host "Abilitazione dell'accesso controllato alle cartelle..."
Set-MpPreference -EnableControlledFolderAccess Enabled 

Write-Host "Abilitazione della protezione di rete..."
Set-MpPreference -EnableNetworkProtection Enabled 

Write-Host "Impostazioni applicate con successo!"
Set-MpPreference -Force