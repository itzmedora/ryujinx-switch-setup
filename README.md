# Ryujinx Switch Setup

This repository contains simple setup scripts for installing Ryujinx and preparing Nintendo Switch firmware and keys on both Linux and Windows.

## Files

- `setup-linux.sh` — Linux / Flatpak setup script
- `setup-windows.ps1` — Windows setup script

## Quick start

### Linux
```bash
chmod +x setup-linux.sh
./setup-linux.sh
```

### Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -File .\setup-windows.ps1
```

## Notes

- The scripts download required keys and emulator firmware.
- Place your Nintendo Switch game files in the folder shown by the script.
- Use only legal copies of games and firmware that you own.
