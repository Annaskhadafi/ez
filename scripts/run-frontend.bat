@echo off
title EZ Chitra - Frontend
chcp 65001 >nul
cd /d "%~dp0.."
echo [Frontend] Menjalankan Vite di http://localhost:5173 ...
bun run dev
pause
