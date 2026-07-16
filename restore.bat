@echo off
chcp 437 >nul
title Ground Branch Restore English

echo ========================================
echo   Ground Branch Chinese Mod - Restore English
echo ========================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0restore.ps1"

echo.
pause
