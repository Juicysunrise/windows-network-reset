# Windows Network Reset Scripts

Transparent and minimal Windows scripts for resetting common network components such as
DNS cache, TCP/IP stack, and Winsock.

These scripts are intended for **troubleshooting network issues**, especially after using
VPNs, DNS changers, proxy tools, or when network settings appear correct but behavior is broken.

---

## What this repository does

Depending on the script used, it can:

- Flush the DNS resolver cache
- Reset Wi-Fi DNS back to automatic (DHCP)
- Reset the TCP/IP stack
- Reset Winsock (LSP catalog)

All scripts use **built-in Windows commands only** (`ipconfig`, `netsh`, `shutdown`).

---

## What this repository does NOT do

- ❌ Does NOT bypass UAC
- ❌ Does NOT collect or transmit any data
- ❌ Does NOT install software or drivers
- ❌ Does NOT modify firewall or security policies
- ❌ Does NOT hide execution or obfuscate code

Everything is plain text and fully auditable.

---

## Requirements

- Windows 10 or Windows 11
- Administrator privileges (required for most `netsh` operations)

---

## How to use

1. Download or clone the repository
2. Navigate to the script you want (e.g. `bat/reset-network-stack.bat`)
3. Right-click the file
4. Select **Run as administrator**
5. Follow on-screen instructions

If the script includes a reboot, restart when prompted.

---

## About Administrator (UAC) privileges

Windows does **not allow batch files to automatically run as administrator** without user consent.
This is a security feature.

However, there are **two safe and accepted ways** to handle this.

---

### Option 1: Manually run as administrator (default behavior)

This is the simplest and most transparent method.

- Right-click the `.bat` file
- Click **Run as administrator**
- Approve the UAC prompt

No script modification required.

---

### Option 2: Add a self-elevation (UAC prompt) to the script (optional)

If you want the script to **request administrator privileges automatically**, you can add
a small UAC check at the top of the batch file.

#### Example: Self-elevating batch header

```bat
@echo off

:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
