@echo off

:: BatchGotAdmin (Run as Admin code starts)
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
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
:: BatchGotAdmin (Run as Admin code ends)

@echo off
:: Article: http://www.techgainer.com/create-batch-file-automatically-run-administrator
:: Your code starts from here
Echo Active Win & Office
cscript //nologo %windir%\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
cscript //nologo %windir%\system32\slmgr.vbs /skms kms.digiboy.ir >nul
cscript //nologo %windir%\system32\slmgr.vbs /ato >nul
cscript //nologo %windir%\system32\slmgr.vbs /dlv
cd "C:\Program Files\Microsoft Office\Office16"
cscript ospp.vbs /sethst:kms.digiboy.ir
cscript ospp.vbs /act
