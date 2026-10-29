$ErrorActionPreference = "Stop"
Write-Host "=== [WINDOWS] BAT DAU SETUP RYUJINX CHO NINTENDO SWITCH ===" -ForegroundColor Cyan

$baseDir = "D:\SwitchKit"
$ryuDir  = "$baseDir\Ryujinx"
$sysDir  = "$env:APPDATA\Ryujinx\system"
$nandDir = "$env:APPDATA\Ryujinx\bis\system\Contents\registered"
$romDir  = "D:\Switch_Games"
$tempZip = "$env:TEMP\ryujinx.zip"
$fwZip   = "$env:TEMP\firmware.zip"

New-Item -ItemType Directory -Path $baseDir -Force | Out-Null
New-Item -ItemType Directory -Path $sysDir -Force | Out-Null
New-Item -ItemType Directory -Path $nandDir -Force | Out-Null
New-Item -ItemType Directory -Path $romDir -Force | Out-Null

Write-Host ">> [1/4] Dang tai ban build Ryujinx..." -ForegroundColor Yellow
$ryuReleaseUrl = "https://github.com/Ryujinx/release-channel-master/releases/download/1.1.1340/ryujinx-1.1.1340-win_x64.zip"
curl.exe -L -A "Mozilla/5.0" $ryuReleaseUrl -o $tempZip

Write-Host ">> Giai nen Ryujinx vao $baseDir..." -ForegroundColor Yellow
Expand-Archive -Path $tempZip -DestinationPath $baseDir -Force
Remove-Item $tempZip -Force

Write-Host ">> [2/4] Dang tai Keys..." -ForegroundColor Yellow
curl.exe -L -A "Mozilla/5.0" "https://archive.org/download/prod.keys_202404/prod.keys" -o "$sysDir\prod.keys"
curl.exe -L -A "Mozilla/5.0" "https://archive.org/download/prod.keys_202404/title.keys" -o "$sysDir\title.keys"

Write-Host ">> [3/4] Dang tai Firmware 18.0.0..." -ForegroundColor Yellow
curl.exe -L -A "Mozilla/5.0" "https://archive.org/download/nintendo-switch-global-firmwares/Firmware%2018.0.0.zip" -o $fwZip

Write-Host ">> [4/4] Dang giai nen Firmware..." -ForegroundColor Yellow
$fwTempExtract = "$env:TEMP\fw_unzipped"
Expand-Archive -Path $fwZip -DestinationPath $fwTempExtract -Force
Copy-Item -Path "$fwTempExtract\*" -Destination $nandDir -Recurse -Force
Remove-Item $fwZip -Force
Remove-Item $fwTempExtract -Recurse -Force

Write-Host "`n=== SETUP WINDOWS HOAN TAT 100%! ===" -ForegroundColor Green
Write-Host ">> File chay Ryujinx nam tai: $baseDir\publish\Ryujinx.exe"
Write-Host ">> Thu muc chua game ROM (.nsp / .xci): $romDir"
