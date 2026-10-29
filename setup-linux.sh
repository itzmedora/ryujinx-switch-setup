#!/usr/bin/env bash
set -e

echo "=== [BAZZITE] BAT DAU SETUP RYUJINX CHO NINTENDO SWITCH ==="

echo ">> [1/4] Dang cai dat Ryujinx Flatpak..."
flatpak install -y --noninteractive flathub org.ryujinx.Ryujinx || true

RYU_DIR="$HOME/.var/app/org.ryujinx.Ryujinx/config/Ryujinx"
SYS_DIR="$RYU_DIR/system"
ROM_DIR="$HOME/Games/Switch_Games"
FW_TMP="/tmp/switch_fw"

mkdir -p "$SYS_DIR"
mkdir -p "$ROM_DIR"
mkdir -p "$FW_TMP"

echo ">> [2/4] Dang tai Keys..."
curl -L -A "Mozilla/5.0" "https://archive.org/download/prod.keys_202404/prod.keys" -o "$SYS_DIR/prod.keys"
curl -L -A "Mozilla/5.0" "https://archive.org/download/prod.keys_202404/title.keys" -o "$SYS_DIR/title.keys"

echo ">> [3/4] Dang tai Firmware 18.0.0..."
curl -L -A "Mozilla/5.0" "https://archive.org/download/nintendo-switch-global-firmwares/Firmware%2018.0.0.zip" -o "/tmp/firmware.zip"

echo ">> [4/4] Dang giai nen va nap Firmware..."
NAND_SYS_DIR="$RYU_DIR/bis/system/Contents/registered"
mkdir -p "$NAND_SYS_DIR"
unzip -q -o "/tmp/firmware.zip" -d "$FW_TMP"
cp -r "$FW_TMP"/* "$NAND_SYS_DIR/"

rm -rf "/tmp/firmware.zip" "$FW_TMP"

echo ""
echo "=== SETUP BAZZITE HOAN TAT 100%! ==="
echo ">> Thu muc bo game (.nsp / .xci): $ROM_DIR"
echo ">> Khoi chay Ryujinx tu menu ung dung hoac go: flatpak run org.ryujinx.Ryujinx"
