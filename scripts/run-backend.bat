@echo off
title EZ Chitra - Backend API
chcp 65001 >nul
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8
cd /d "%~dp0..\backend"
echo [Backend] Menjalankan FastAPI di http://localhost:8000 ...
uv run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
pause
