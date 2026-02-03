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

## How to use

1. Download or clone the repository
2. Navigate to the script you want (e.g. `bat/reset-network-stack.bat`)
3. Follow on-screen instructions

If the script includes a reboot, restart when prompted.
