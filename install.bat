@echo off
chcp 936 >nul
title Ground Branch 简体中文汉化包安装程序

echo ========================================
echo   Ground Branch 简体中文汉化包安装程序
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
pause
