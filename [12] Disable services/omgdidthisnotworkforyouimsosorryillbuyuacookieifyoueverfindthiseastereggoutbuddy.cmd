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
TITLE Enabling services...
sc config xbgm start=auto >nul 2>&1
sc config XboxGipSvc start=auto >nul 2>&1
sc config WaaSMedicSvc start=auto >nul 2>&1
sc config wuauserv start=auto >nul 2>&1
sc config W32Time start=auto >nul 2>&1
sc config spectrum start=auto >nul 2>&1
sc config wcncsvc start=auto >nul 2>&1
sc config WebClient start=auto >nul 2>&1
sc config SysMain start=auto >nul 2>&1
sc config NcaSvc start=auto >nul 2>&1
sc config wlidsvc start=auto >nul 2>&1
sc config SCardSvr start=auto >nul 2>&1
sc config NgcCtnrSvc start=auto >nul 2>&1
sc config diagsvc start=auto >nul 2>&1
sc config UserDataSvc_3228d start=auto >nul 2>&1
sc config stisvc start=auto >nul 2>&1
sc config AdobeFlashPlayerUpdateSvc start=auto >nul 2>&1
sc config TrkWks start=auto >nul 2>&1
sc config dmwappushservice start=auto >nul 2>&1
sc config PimIndexMaintenanceSvc_3228d start=auto >nul 2>&1
sc config DiagTrack start=auto >nul 2>&1
sc config VaultSvc start=auto >nul 2>&1
sc config GoogleChromeElevationService start=auto >nul 2>&1
sc config OneSyncSvc_3228d start=auto >nul 2>&1
sc config ibtsiva start=auto >nul 2>&1
sc config SNMPTRAP start=auto >nul 2>&1
sc config pla start=auto >nul 2>&1
sc config ssh-agent start=auto >nul 2>&1
sc config sshd start=auto >nul 2>&1
sc config DoSvc start=auto >nul 2>&1
sc config tzautoupdate start=auto >nul 2>&1
sc config CertPropSvc start=auto >nul 2>&1
sc config RemoteRegistry start=auto >nul 2>&1
sc config RemoteAccess start=auto >nul 2>&1
sc config TimeBrokerSvc start=auto >nul 2>&1
sc config WbioSrvc start=auto >nul 2>&1
sc config PcaSvc start=auto >nul 2>&1
sc config NetTcpPortSharing start=auto >nul 2>&1
sc config WerSvc start=auto >nul 2>&1
sc config gupdate start=auto >nul 2>&1
sc config gupdatem start=auto >nul 2>&1
sc config MSiSCSI start=auto >nul 2>&1
sc config WMPNetworkSvc start=auto >nul 2>&1
sc config CDPUserSvc_3228d start=auto >nul 2>&1
sc config WpnUserService_3228d start=auto >nul 2>&1
sc config shpamsvc start=auto >nul 2>&1
sc config LanmanWorkstation start=auto >nul 2>&1
sc config UnistoreSvc_3228d start=auto >nul 2>&1
sc config MapsBroker start=auto >nul 2>&1
sc config debugregsvc start=auto >nul 2>&1
sc config Schedule start=auto >nul 2>&1
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /d "00000002" /t REG_DWORD /f >nul 2>&1
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v "Start" /d "00000003" /t REG_DWORD /f >nul 2>&1
TITLE Success!
SET msgboxTitle=Success!
SET msgboxBody=Services Have Been Enabled Successfully!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
Del %~0
exit
Del %~0
