@echo off
title EZ Chitra - Stop System
echo ========================================================
echo               MENGHENTIKAN EZ CHITRA
echo ========================================================
echo.

echo Menghentikan Backend di Port 8000...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8000 " ^| findstr "LISTENING"') do (
    taskkill /f /pid %%a >nul 2>&1
    echo - Backend (PID: %%a) dihentikan.
)

echo Menghentikan Frontend di Port 5173...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":5173 " ^| findstr "LISTENING"') do (
    taskkill /f /pid %%a >nul 2>&1
    echo - Frontend (PID: %%a) dihentikan.
)

echo.
echo ========================================================
echo  Layanan EZ Chitra telah dihentikan.
echo ========================================================
echo.
pause
