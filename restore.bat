@echo off
chcp 65001 >nul
title Ground Branch 汉化包 - 恢复英文

echo ========================================
echo   Ground Branch 简体中文汉化包 - 恢复英文
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0restore.ps1"

echo.
echo 按任意键退出...
pause >nul
