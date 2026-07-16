# Ground Branch 简体中文汉化包 安装脚本

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "========================================"
Write-Host "  Ground Branch 简体中文汉化包安装程序"
Write-Host "========================================"
Write-Host ""

# 查找游戏安装目录
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
    Write-Host "未自动检测到游戏目录。"
    $gameDir = Read-Host "请输入 Ground Branch 安装路径（如 D:\SteamLibrary\steamapps\common\Ground Branch）"
    if (-not (Test-Path "$gameDir\GroundBranch.exe")) {
        Write-Host "错误：路径不正确，未找到 GroundBranch.exe"
        pause
        exit 1
    }
}

Write-Host "游戏目录: $gameDir"

# 确认安装
$confirm = Read-Host "是否安装汉化包？(Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "已取消安装。"
    pause
    exit 0
}

# 备份原始文件
$backupDir = "$gameDir\GroundBranch\Content\Localization\ChineseMod_Backup"
Write-Host "正在备份原始文件到: $backupDir"

if (Test-Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN") {
    New-Item -ItemType Directory -Force -Path "$backupDir\Localization" | Out-Null
    Copy-Item -Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN\*" -Destination "$backupDir\Localization" -Recurse -Force
}
if (Test-Path "$gameDir\GroundBranch\Content\GBCore\StringTable") {
    New-Item -ItemType Directory -Force -Path "$backupDir\StringTable" | Out-Null
    Copy-Item -Path "$gameDir\GroundBranch\Content\GBCore\StringTable\*.csv" -Destination "$backupDir\StringTable" -Force
    Copy-Item -Path "$gameDir\GroundBranch\Content\GBCore\StringTable\*.txt" -Destination "$backupDir\StringTable" -Force -ErrorAction SilentlyContinue
}

Write-Host "备份完成。"
Write-Host ""
Write-Host "正在安装汉化文件..."

New-Item -ItemType Directory -Force -Path "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" | Out-Null

Copy-Item -Path "$scriptDir\GroundBranch\Content\Localization\GroundBranch\zh-CN\*" -Destination "$gameDir\GroundBranch\Content\Localization\GroundBranch\zh-CN" -Recurse -Force
Write-Host "  [1/2] Localization 文件已安装"

Copy-Item -Path "$scriptDir\GroundBranch\Content\GBCore\StringTable\*.csv" -Destination "$gameDir\GroundBranch\Content\GBCore\StringTable" -Force
Write-Host "  [2/2] StringTable 文件已安装"

Write-Host ""
Write-Host "========================================"
Write-Host "  汉化包安装完成！"
Write-Host "========================================"
Write-Host ""
Write-Host "启动游戏即可体验中文界面。"
Write-Host ""
Write-Host "如需恢复英文："
Write-Host "  双击 restore.bat"
Write-Host ""
pause