@echo off
:VBSDynamicBuild

CSCRIPT //nologo ".\F11.vbs"

:home
chcp 65001 > nul
if %ERRORLEVEL% equ 255 (
    echo INSERISCI NEL PROMPT DELLA SCELTA DELLE OPERAZIONI UN NUMERO.
)
cls
title VISO
echo                   V E R I F I C A T O R E      I N T E G R I T À      DEL      S I S T E M A      O P E R A T I V O
echo                   V E R I F I C A T O R E      I N T E G R I T À      DEL      S I S T E M A      O P E R A T I V O
echo                   V E R I F I C A T O R E      I N T E G R I T À      DEL      S I S T E M A      O P E R A T I V O
::echo (c) 2024 Vittoria. Tutti i diritti riservati.
echo.
echo  NUM  C O M A N D O        ( D E S C R I Z I O N E      C O M A N D O )
echo -----------------------------------------------------------------------------------------------------------
echo   1.  SFC                  (Analizza l'integrità di tutti i file di sistema protetti
echo                            e sostituisce le versioni difettose con versioni Microsoft corrette)
echo   2.  CHKDSK (f)           (Controlla un disco fisicamente e visualizza il relativo rapporto sullo stato)
echo   3.  CHKDSK (r)           (Individua i settori danneggiati e recupera le informazioni leggibili)
echo                            DA USARE SOLO SE SONO STATI RISCONTRATI ERRORI PRECEDENTEMENTE NELL'OPERAZIONE 2
echo   4.  DISM                 (Gestisce e si occupa della manutenzione delle immagini di sistema)
echo   5.  WINGET               (Controlla e installa applicazioni o aggiornamenti di app e del SO)
echo   6.  POWERCFG (e)         (Crea un report sull energia del computer)
echo   7.  POWERCFG (b)         (Crea un report sullo stato della batteria del computer)
echo   8.  MdSched.exe          (Diagnostica la memoria centrale e individua eventuali problemi) 
echo   9.  NETSH                (Assiste risolvento problemi di connessione del network pulendo il winsock)
echo   10. cleanmgr.exe         (Cancella i file non necessari dal disco rigido del computer)
echo   11. dfrgui.exe           (Deframmenta e ottimizza unità, individa e consolida file frammentati nei
echo                            volumi locali per migliorare le prestazioni del sistema)
echo   12. ipconfig/flushdns    (Svuota la cache e imposta nuovamente il registro DNS tramite DNS flush)
echo   13. Micros. Defender (v) (Antimalware propretario di Windows. SCANSIONE VELOCE)
echo   14. Micros. Defender (c) (Antimalware propretario di Windows. SCANSIONE COMPLETA)
echo   15. wscui.cpl            (Sicurezza e manutenzione)
echo   16. taskmgr.exe          (Gestione attività)
echo   17. msconfig.exe         (Configurazione di sistema)
echo   18. appwiz.cpl           (Disistalla o modifica unprogramma)
echo   19. net use              (Elimina tutte le connessioni di dischi di rete attive)
echo   20. del temp e prefetch  (Elimina tutti i file temporanei e i file di prefetch)
echo   21. Stato MD             (Visualizza lo Stato attuale di Microsoft Defender)
echo   22. Attiva MD            (Attiva la protezione massima di Microsoft Defender)
echo   23. Crea Checkpoint      (Crea un nuovo punto di ripristino)
echo   24. Elenca Checkpoint    (Elenca tutti i punti di ripristino)
echo   25. Elimina Checkpoint   (Elimina tutti i punti di ripristino)
echo   26. recdisc.exe          (Strumento di riparazione del disco)
echo   27. dxdiag.exe           (Strumento di diagnostica Direct X)
echo   28. hotplug.dll          (Rimozione sicura dell`hardware)
echo   29. sigverif.exe         (Verifica firma file)
echo   30. MRT.exe              (Strumento di rimozione malware Microsoft Windows)
echo   31. shrpubw.exe          (Creazione guidata cartella condivisa)
echo   32. SPP                  (Protezione Sistema)
echo   33. Imp. di Criptaggio   (Impostazioni di crittografia del dispositivo)
echo   34. ICiRA                (Impostazioni condivisione in rete avanzate)
echo.
set/p "operazione=Inserisci il numero corrispondente all'operazione che vuoi eseguire, (0 per uscire): "
IF "%operazione%"=="P" (
    cls
	goto :home
)
IF "%operazione%"=="Vittoria" ( cls && TYPE .\AUTRICE.ANS && pause && cls && goto :home)
IF "%operazione%"=="LICENZA" ( cls && TYPE .\LICENZA && echo. && pause && cls && goto :home)
if %operazione% EQU 0 (
    cls
    :VBSDynamicBuild
    CSCRIPT //nologo ".\F11.vbs"
    exit /b 0
)
IF %operazione% GTR 34 ( echo. && echo 		ERRORE: INSERISCI UN'OPERAZIONE VALIDA && echo. && pause && exit)
IF %operazione% EQU 1 ( cls && sfc /scannow )
IF %operazione% EQU 2 ( cls && chkdsk /f )
IF %operazione% EQU 3 ( cls && chkdsk /r )
IF %operazione% EQU 4 ( cls && dism /online /cleanup-image /restorehealth /Loglevel:2 )
IF %operazione% EQU 5 ( cls && winget upgrade --all --include-unknown )
IF %operazione% EQU 6 ( cls && powercfg /energy )
IF %operazione% EQU 7 ( cls && powercfg /batteryreport )
IF %operazione% EQU 8 ( cls && %windir%\system32\MdSched.exe )
IF %operazione% EQU 9 ( cls && netsh winsock reset )
IF %operazione% EQU 10 ( cls && %windir%\system32\cleanmgr.exe )
IF %operazione% EQU 11 ( cls && %windir%\system32\dfrgui.exe )
IF %operazione% EQU 12 ( cls && ipconfig/flushdns )
IF %operazione% EQU 13 ( cls && cd %programdata%\microsoft\windows defender\platform\4* && mpcmdrun -scan -scantype 1 )
IF %operazione% EQU 14 ( cls && cd %programdata%\microsoft\windows defender\platform\4* && mpcmdrun -scan -scantype 2 )
IF %operazione% EQU 15 ( cls && %windir%\system32\wscui.cpl )
IF %operazione% EQU 16 ( cls && %windir%\system32\taskmgr.exe )
IF %operazione% EQU 17 ( cls && %windir%\system32\msconfig.exe )
IF %operazione% EQU 18 ( cls && %windir%\System32\appwiz.cpl )
IF %operazione% EQU 19 ( cls && net use * /delete )
IF %operazione% EQU 20 ( cls && del /q /f /s %temp%\* && del /s /q %windir%\temp\* )
IF %operazione% EQU 21 ( cls && .\StatoMD.ps1 )
IF %operazione% EQU 22 ( cls && .\AttivaMD.ps1 )
IF %operazione% EQU 23 ( CLS && .\PDR.ps1 )
IF %operazione% EQU 24 ( CLS && vssadmin list shadows )
IF %operazione% EQU 25 ( CLS && vssadmin delete shadows /all )
IF %operazione% EQU 26 ( CLS && %windir%\System32\recdisc.exe )
IF %operazione% EQU 27 ( CLS && %windir%\System32\dxdiag.exe )
IF %operazione% EQU 28 ( CLS && RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll )
IF %operazione% EQU 29 ( CLS && sigverif.exe )
IF %operazione% EQU 30 ( CLS && MRT.exe )
IF %operazione% EQU 31 ( CLS && shrpubw.exe )
IF %operazione% EQU 32 ( CLS && SystemPropertiesProtection )
IF %operazione% EQU 33 ( CLS && control.exe /name Microsoft.DeviceEncryption )
IF %operazione% EQU 34 ( CLS && control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced )
echo.
echo 	Le operazioni sono state eseguite con successo! 
echo 	La verifica/correzzione è stata eseguita il %DATE% alle %TIME%
echo.
pause
cls 
goto :home
