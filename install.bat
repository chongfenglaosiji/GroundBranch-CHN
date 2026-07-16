@echo off
chcp 65001 >nul
title Ground Branch 简体中文汉化包安装程序

echo ========================================
echo   Ground Branch 简体中文汉化包安装程序
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"

if %errorlevel% neq 0 (
    echo.
    echo 安装失败或已取消。
    pause
)
