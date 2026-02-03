@echo off

:: ===== Admin check =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ================================
echo Resetting Wi-Fi DNS...
echo ================================
echo.

REM Flush DNS cache
ipconfig /flushdns

REM Reset Wi-Fi DNS to automatic (DHCP)
netsh interface ip set dns name="Wi-Fi" source=dhcp

echo.
echo Wi-Fi dns reset completed.

echo.
echo ================================
echo Current DNS servers (Wi-Fi):
echo ================================
echo.

REM Show DNS servers for Wi-Fi only
netsh interface ip show dns name="Wi-Fi"

echo.
echo Done.
pause