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
echo                                          Welcome to the Helix Suite
echo                                                Version 1.0.0
pause
cd %programfiles%
if exist HelixTools (goto start) else (md HelixTools)
:start
cls
echo 1.Helix App Installer
echo 2.Windows Repair (requires restarts)
echo 3.
echo 4.
echo 5.
echo 6.
echo 7.
echo 8.
echo 9.
ECHO 0.
set choice=
set /p choice=Type the number to pick a preset : 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Helix
if '%choice%'=='2' goto Windowsrepair
if '%choice%'=='3' goto 
if '%choice%'=='4' goto 
if '%choice%'=='5' goto 
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
pause
shutdown /r
cd %AppData%/Roaming/Microsoft/Windows/Start Menu/Programs/Startup