# Ground Branch 简体中文汉化包 恢复脚本

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "恢复英文文件..."
Write-Host ""

# 查找游戏目录
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
    $gameDir = Read-Host "请输入 Ground Branch 安装路径"
}

$backupDir = "$gameDir\GroundBranch\Content\Localization\ChineseMod_Backup"

if (-not (Test-Path $backupDir)) {
    Write-Host "错误：未找到备份目录 ($backupDir)"
    Write-Host "无法恢复。"
    pause
    exit 1
}

# 恢复 StringTable
if (Test-Path "$backupDir\StringTable") {
    Copy-Item -Path "$backupDir\StringTable\*" -Destination "$gameDir\GroundBranch\Content\GBCore\StringTable" -Force
    Write-Host "  StringTable 已恢复"
}

# 恢复 Localization
if (Test-Path "$backupDir\Localization") {
    Copy-Item -Path "$backupDir\Localization\*" -Destination "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" -Recurse -Force
    Write-Host "  Localization 已恢复"
}

Write-Host ""
Write-Host "已恢复为英文。备份文件保留在: $backupDir"
pause
