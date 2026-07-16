@echo off
chcp 65001 >nul
title Ground Branch 汉化包 - 恢复英文

echo ========================================
echo   Ground Branch 简体中文汉化包 - 恢复英文
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0restore.ps1"

if %errorlevel% neq 0 (
    echo.
    echo 恢复失败。
    pause
)
