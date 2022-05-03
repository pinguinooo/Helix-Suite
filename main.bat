@echo off
@title Helix Suite
net session >nul 2>&1
if %errorLevel% == 0 (
goto top
) else (
echo ===================================================================================
echo +Administrative permissions required, please close and run Helix as administrator.+
echo ===================================================================================
)
pause >nul
cls
:top
set version=1.0.0
echo                                          Welcome to the Helix Suite
echo                                               Version : %Version%
pause
cd %programfiles%
if exist HelixTools (goto start) else (md HelixTools)
:start
cls
echo 1.Helix App Installer
echo 2.Semi Windows Repair (requires restarts)
echo 3.Full Windows Repair - Not Automated (requires restarts)
echo 4.Ip Lookup
echo 5.Tron
echo 6.
echo 7.
echo 8.
echo 9.
ECHO 0.Credits
set choice=
set /p choice=Type the number to pick a preset : 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Helix
if '%choice%'=='2' goto Windowsrepair
if '%choice%'=='3' goto windowsrepairfull
if '%choice%'=='4' goto iplookupstart
if '%choice%'=='5' goto tron
if '%choice%'=='6' goto 
if '%choice%'=='7' goto 
if '%choice%'=='8' goto 
if '%choice%'=='9' goto 
if '%choice%'=='0' goto 
cls
ECHO "%choice%" is not valid, try again
ECHO.
timeout 2 >nul
goto top

:Helix
cls
cd %programfiles%/HelixTools
echo not done
pause
goto top

:Windowsrepair
cls
echo I am not liable for any damages/file loss to your system
echo By pressing any key you agree to this
pause
cd assets
cls
DISM /Online /Cleanup-Image /RestoreHealth
cd %appdata%
cd Microsoft\Windows\Start Menu\Programs\Startup
curl -s https://raw.githubusercontent.com/pinguinooo/Helix-Suite/main/assets/autostart.bat -o autostart.bat
cls
echo Part 1/2 Completed please save all your work and press anykey to restart.
echo You will get a UAC Prompt when your computer restarts please accept it or the repair will fail and you will need to restart your computer again.
pause
shutdown /r


:windowsrepairfull
cls
color 3


:iplookupstart
cls
title IP Lookup
color 3
mode con lines=13 cols=70
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
:menu
cls
echo.
echo.
echo                       What would you like to do?
echo.
echo                            View your IP: (1)
echo.
echo                            Lookup an IP: (2)
echo.
echo                                Back: (3)
echo.
echo.
echo.
goto action
:input
echo.
cls
echo Please enter a valid input option.
pause
goto :menu
echo.
:action
echo.
set /p action=Type your choice. : 
if '%action%'=='1' echo sUrl = "http://ipinfo.io/json" > %temp%\%webclient%.vbs & goto localip
if '%action%'=='2' goto iplookup
if '%action%'=='2' goto top
if '%action%'=='3' goto start
goto input
:iplookup
cls
echo.
echo                          Type an IP to lookup
echo.
set ip=127.0.0.1
set /p ip=IP: 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
cls
echo.
for /f "delims= 	" %%i in ('findstr /i "," %temp%\response.txt') do (
	set data=%%i
	set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!data:ip:=IP:		!
	set data=!data:hostname:=Hostname:	!
	set data=!data:org:=ISP:		!
	set data=!data:city:=City:		!
	set data=!data:region:=State:	!
	set data=!data:country:=Country:	!
	set data=!data:postal:=Postal:	!
	set data=!data:loc:=Location:	!
	set data=!data:timezone:=Timezone:	!
	echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
if '%ip%'=='' goto menu


:Tron
cls
color 4
echo PLEASE READ THIS
echo 7
echo I am not liable for anything that happens to your system with this script.
echo You may continue in 10 seconds
timeout 10
pause

:Credits
cls

echo 		+======================================+
echo 		+			  Helix Credits			   +
echo 		+ I do not take any credit for tron.   +
echo 		+ You can download it here.            +
echo 		+ Tron: https://github.com/bmrf/tron   +
echo 		+======================================+
