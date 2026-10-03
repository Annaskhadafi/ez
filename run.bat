@echo off
title EZ Chitra - Launcher
chcp 65001 >nul
echo ========================================================
echo               MEMULAI SISTEM EZ CHITRA
echo ========================================================
echo.

echo [1/3] Membersihkan port 8000 dan 5173 jika masih berjalan...
powershell -Command "Get-NetTCPConnection -LocalPort 8000, 5173 -ErrorAction SilentlyContinue | ForEach-Object { Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue }"

echo [2/3] Membuka jendela Backend FastAPI (Port 8000)...
start "EZ Chitra - Backend" cmd /k "cd /d D:\[01] PROJECT\EZ CHitra\ezchitra\backend && set PYTHONUTF8=1 && uv run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"

echo [3/3] Membuka jendela Frontend Vite (Port 5173)...
start "EZ Chitra - Frontend" cmd /k "cd /d D:\[01] PROJECT\EZ CHitra\ezchitra && bun run dev -- --host 0.0.0.0"

echo.
echo Menunggu Backend dan Frontend siap...
powershell -Command "$timeout = 30; $start = Get-Date; while (-not (Test-NetConnection -ComputerName 127.0.0.1 -Port 5173 -InformationLevel Quiet)) { Start-Sleep -Seconds 1; if (((Get-Date) - $start).TotalSeconds -ge $timeout) { break } }"

echo.
echo ========================================================
echo  Sistem EZ Chitra Berhasil Aktif!
echo  - Frontend: http://localhost:5173
echo  - Backend API: http://localhost:8000
echo  - API Docs: http://localhost:8000/docs
echo ========================================================
echo.
echo Membuka browser: http://localhost:5173 ...
start http://localhost:5173
