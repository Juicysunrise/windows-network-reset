@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ================================
echo Resetting network stack...
echo ================================
echo.

ipconfig /release
ipconfig /flushdns
ipconfig /renew

netsh int ip reset
netsh winsock reset

echo.
echo Network stack reset completed.
echo Restarting computer in 10 seconds...
timeout /t 10 /nobreak >nul

shutdown /r /t 0