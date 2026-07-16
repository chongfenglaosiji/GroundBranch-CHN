@echo off
chcp 437 >nul
title Ground Branch Chinese Mod Installer

echo ========================================
echo   Ground Branch Chinese Translation Mod
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
pause
