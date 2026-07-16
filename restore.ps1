# Ground Branch Chinese Mod - Restore English files

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Restoring English files..."
Write-Host ""

$gameDir = $null
$paths = @(
    "${env:ProgramFiles(x86)}\Steam\steamapps\common\Ground Branch",
    "${env:ProgramFiles}\Steam\steamapps\common\Ground Branch",
    "D:\SteamLibrary\steamapps\common\Ground Branch",
    "E:\SteamLibrary\steamapps\common\Ground Branch",
    "C:\SteamLibrary\steamapps\common\Ground Branch"
)
foreach ($p in $paths) {
    if (Test-Path "$p\GroundBranch.exe") { $gameDir = $p; break }
}
if (-not $gameDir) {
    $gameDir = Read-Host "Enter Ground Branch install path"
}

$backupDir = "$gameDir\GroundBranch\Content\Localization\ChineseMod_Backup"

if (-not (Test-Path $backupDir)) {
    Write-Host "Error: Backup directory not found ($backupDir)"
    Write-Host "Cannot restore."
    pause
    exit 1
}

if (Test-Path "$backupDir\StringTable") {
    Copy-Item -Path "$backupDir\StringTable\*" -Destination "$gameDir\GroundBranch\Content\GBCore\StringTable" -Force
    Write-Host "  StringTable restored"
}

if (Test-Path "$backupDir\Localization") {
    Copy-Item -Path "$backupDir\Localization\*" -Destination "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" -Recurse -Force
    Write-Host "  Localization restored"
}

Write-Host ""
Write-Host "English files restored. Backup kept at: $backupDir"
pause
