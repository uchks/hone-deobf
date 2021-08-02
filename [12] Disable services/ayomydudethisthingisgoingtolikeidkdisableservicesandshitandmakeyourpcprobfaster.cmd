@echo off
color 06
TITLE Requesting Administrator Rights...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting Administrative Privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
TITLE Disabling services...
sc config xbgm start=disabled >nul 2>&1
sc config XboxGipSvc start=disabled >nul 2>&1
sc config WaaSMedicSvc start=disabled >nul 2>&1
sc config wuauserv start=disabled >nul 2>&1
sc config W32Time start=disabled >nul 2>&1
sc config spectrum start=disabled >nul 2>&1
sc config wcncsvc start=disabled >nul 2>&1
sc config WebClient start=disabled >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
sc config NcaSvc start=disabled >nul 2>&1
sc config wlidsvc start=disabled >nul 2>&1
sc config SCardSvr start=disabled >nul 2>&1
sc config NgcCtnrSvc start=disabled >nul 2>&1
sc config diagsvc start=disabled >nul 2>&1
sc config UserDataSvc_3228d start=disabled >nul 2>&1
sc config stisvc start=disabled >nul 2>&1
sc config AdobeFlashPlayerUpdateSvc start=disabled >nul 2>&1
sc config TrkWks start=disabled >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
sc config PimIndexMaintenanceSvc_3228d start=disabled >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc config VaultSvc start=disabled >nul 2>&1
sc config GoogleChromeElevationService start=disabled >nul 2>&1
sc config OneSyncSvc_3228d start=disabled >nul 2>&1
sc config ibtsiva start=disabled >nul 2>&1
sc config SNMPTRAP start=disabled >nul 2>&1
sc config pla start=disabled >nul 2>&1
sc config ssh-agent start=disabled >nul 2>&1
sc config sshd start=disabled >nul 2>&1
sc config DoSvc start=disabled >nul 2>&1
sc config tzautoupdate start=disabled >nul 2>&1
sc config CertPropSvc start=disabled >nul 2>&1
sc config RemoteRegistry start=disabled >nul 2>&1
sc config RemoteAccess start=disabled >nul 2>&1
sc config TimeBrokerSvc start=disabled >nul 2>&1
sc config WbioSrvc start=disabled >nul 2>&1
sc config PcaSvc start=disabled >nul 2>&1
sc config NetTcpPortSharing start=disabled >nul 2>&1
sc config WerSvc start=disabled >nul 2>&1
sc config gupdate start=disabled >nul 2>&1
sc config gupdatem start=disabled >nul 2>&1
sc config MSiSCSI start=disabled >nul 2>&1
sc config WMPNetworkSvc start=disabled >nul 2>&1
sc config CDPUserSvc_3228d start=disabled >nul 2>&1
sc config WpnUserService_3228d start=disabled >nul 2>&1
sc config shpamsvc start=disabled >nul 2>&1
sc config LanmanWorkstation start=disabled >nul 2>&1
sc config UnistoreSvc_3228d start=disabled >nul 2>&1
sc config MapsBroker start=disabled >nul 2>&1
sc config debugregsvc start=disabled >nul 2>&1
sc config Schedule start=disabled >nul 2>&1
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /d "00000002" /t REG_DWORD /f >nul 2>&1
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v "Start" /d "00000003" /t REG_DWORD /f >nul 2>&1
TITLE Success!
SET msgboxTitle=Success!
SET msgboxBody=Services Have Been Disabled Successfully!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
Del %~0
exit
Del %~0
