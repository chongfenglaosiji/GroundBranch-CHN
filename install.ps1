# Ground Branch Simplified Chinese Localization Mod Installer
# Based on Ganwu's original v1035.1 translation

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "========================================"
Write-Host "  Ground Branch Chinese Translation Mod"
Write-Host "========================================"
Write-Host ""

# Find game directory
$gamePaths = @(
    "${env:ProgramFiles(x86)}\Steam\steamapps\common\Ground Branch",
    "${env:ProgramFiles}\Steam\steamapps\common\Ground Branch",
    "D:\SteamLibrary\steamapps\common\Ground Branch",
    "E:\SteamLibrary\steamapps\common\Ground Branch",
    "C:\SteamLibrary\steamapps\common\Ground Branch"
)

try {
    $steamPath = Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -Name "SteamPath" -ErrorAction SilentlyContinue
    if ($steamPath) {
        $libPath = Join-Path $steamPath.SteamPath "steamapps\libraryfolders.vdf"
        if (Test-Path $libPath) {
            $content = Get-Content $libPath -Raw
            $matches = [regex]::Matches($content, '"path"\s+"([^"]+)"')
            foreach ($m in $matches) {
                $p = Join-Path $m.Groups[1].Value "steamapps\common\Ground Branch"
                if (Test-Path $p) { $gamePaths = @($p); break }
            }
        }
    }
} catch {}

$gameDir = $null
foreach ($p in $gamePaths) {
    if (Test-Path "$p\GroundBranch.exe") { $gameDir = $p; break }
}

if (-not $gameDir) {
    Write-Host "Game directory not found automatically."
    $gameDir = Read-Host "Enter Ground Branch install path (e.g. D:\SteamLibrary\steamapps\common\Ground Branch)"
    if (-not (Test-Path "$gameDir\GroundBranch.exe")) {
        Write-Host "Error: Invalid path, GroundBranch.exe not found."
        pause
        exit 1
    }
}

Write-Host "Game directory: $gameDir"

# Confirm installation
$confirm = Read-Host "Install Chinese translation mod? (Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "Installation cancelled."
    pause
    exit 0
}

# Backup original files
$backupDir = "$gameDir\GroundBranch\Content\Localization\ChineseMod_Backup"
Write-Host "Backing up original files to: $backupDir"

if (Test-Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN") {
    New-Item -ItemType Directory -Force -Path "$backupDir\Localization" | Out-Null
    Copy-Item -Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN\*" -Destination "$backupDir\Localization" -Recurse -Force
}
if (Test-Path "$gameDir\GroundBranch\Content\GBCore\StringTable") {
    New-Item -ItemType Directory -Force -Path "$backupDir\StringTable" | Out-Null
    Copy-Item -Path "$gameDir\GroundBranch\Content\GBCore\StringTable\*.csv" -Destination "$backupDir\StringTable" -Force
    Copy-Item -Path "$gameDir\GroundBranch\Content\GBCore\StringTable\*.txt" -Destination "$backupDir\StringTable" -Force -ErrorAction SilentlyContinue
}

Write-Host "Backup complete."
Write-Host ""
Write-Host "Installing translation files..."

New-Item -ItemType Directory -Force -Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" | Out-Null

Copy-Item -Path "$scriptDir\GroundBranch\Content\Localization\GroundBranch\zh-CN\*" -Destination "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" -Recurse -Force
Write-Host "  [1/2] Localization files installed"

Copy-Item -Path "$scriptDir\GroundBranch\Content\GBCore\StringTable\*.csv" -Destination "$gameDir\GroundBranch\Content\GBCore\StringTable" -Force
Write-Host "  [2/2] StringTable files installed"

Write-Host ""
Write-Host "========================================"
Write-Host "  Installation Complete!"
Write-Host "========================================"
Write-Host ""
Write-Host "Launch the game to experience Chinese UI."
Write-Host ""
Write-Host "To restore English:"
Write-Host "  Double-click restore.bat"
Write-Host ""
pause
