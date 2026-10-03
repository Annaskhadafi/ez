@echo off
title EZ Chitra - Launcher
chcp 65001 >nul
echo ========================================================
echo               MEMULAI SISTEM EZ CHITRA
echo ========================================================
echo.

set "PROJ_DIR=d:\[01] PROJECT\EZ CHitra\ezchitra"

echo [1/3] Membersihkan port 8000 dan 5173 jika masih berjalan...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8000 " ^| findstr "LISTENING"') do (
    taskkill /f /pid %%a >nul 2>&1
)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":5173 " ^| findstr "LISTENING"') do (
    taskkill /f /pid %%a >nul 2>&1
)

echo [2/3] Membuka jendela Backend FastAPI (Port 8000)...
start "EZ Chitra - Backend" cmd /k "call ""%PROJ_DIR%\scripts\run-backend.bat"""

echo [3/3] Membuka jendela Frontend Vite (Port 5173)...
start "EZ Chitra - Frontend" cmd /k "call ""%PROJ_DIR%\scripts\run-frontend.bat"""

echo.
echo Menunggu server siap...
ping 127.0.0.1 -n 6 >nul

echo Membuka browser: http://localhost:5173 ...
start http://localhost:5173

echo.
echo ========================================================
echo  Sistem EZ Chitra Berhasil Dijalankan!
echo  - Frontend: http://localhost:5173
echo  - Backend API: http://localhost:8000
echo  - API Docs: http://localhost:8000/docs
echo ========================================================
echo.
ping 127.0.0.1 -n 4 >nul
