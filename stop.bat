@echo off
title EZ Chitra - Menghentikan Layanan
chcp 65001 >nul
echo ========================================================
echo               MENGHENTIKAN EZ CHITRA
echo ========================================================
echo.

powershell -Command "Get-NetTCPConnection -LocalPort 8000, 5173 -ErrorAction SilentlyContinue | ForEach-Object { Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue }"

echo.
echo Layanan Backend (Port 8000) dan Frontend (Port 5173) berhasil dimatikan.
echo ========================================================
echo.
pause
