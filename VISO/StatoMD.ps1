# Ottieni lo stato corrente di Microsoft Defender
$status = Get-MpComputerStatus

# Estrai lo stato delle varie impostazioni
$serviceStatus = $status.AMServiceEnabled
$antivirusStatus = $status.AntivirusEnabled
$antispywareStatus = $status.AntispywareEnabled
$monitoraggioStatus = $status.BehaviorMonitorEnabled
$IOAVStatus = $status.IoavProtectionEnabled
$NISStatus = $status.NISEnabled
$OAPStatus = $status.OnAccessProtectionEnabled
$IRLProtectionStatus = $status.RealTimeProtectionEnabled

# Funzione per convertire lo stato in una stringa più comprensibile
function GetStatusString($status) {
    if ($status -eq $true) {
        return "Attivata"
    } else {
        return "Disattivata"
    }
}

# Visualizza lo stato delle impostazioni con descrizioni
Write-Host "Stato delle impostazioni di Microsoft Defender:"
Write-host "S E R V I Z I O                S T A T O (DESCRIZIONE S E R V I Z I O)"
Write-Host "--------------------------------------------------------------------------"
Write-Host "Servizio antimalware:          $(GetStatusString $serviceStatus)"
Write-Host "Antivirus:                     $(GetStatusString $antivirusStatus)  (Protezione contro i virus)"
Write-Host "Antispyware:                   $(GetStatusString $antispywareStatus)  (Protezione contro lo spyware)"
Write-Host "Monitoraggio comportamentale:  $(GetStatusString $monitoraggioStatus)  (Rilevamento comportamentale)"
Write-Host "Protezione IOAV:               $(GetStatusString $IOAVStatus)  (Protezione degli allegati di posta elettronica)"
Write-Host "Protezione NIS:                $(GetStatusString $NISStatus)  (Protezione da minacce della rete)"
Write-Host "Protezione OAP:                $(GetStatusString $OAPStatus)  (Protezione dell'accesso)"
Write-Host "Protezione in tempo reale:     $(GetStatusString $IRLProtectionStatus)  (Protezione in tempo reale)"

