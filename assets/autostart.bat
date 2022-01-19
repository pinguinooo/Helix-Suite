echo Welcome Back please press any key to finish process
pause
cls
sfc /scannow
cd %AppData%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del autostart.bat
shutdown /r