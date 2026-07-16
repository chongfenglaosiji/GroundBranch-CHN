@echo off
chcp 65001 >nul
title Ground Branch 简体中文汉化包安装程序

echo ========================================
echo   Ground Branch 简体中文汉化包安装程序
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
echo 按任意键退出...
pause >nul
