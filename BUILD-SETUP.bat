@echo off
chcp 65001 >nul
title Qabda Cart - Build Offline Installer
where npm >nul 2>nul
if errorlevel 1 (
  echo Node.js غير موجود. ثبّت Node.js LTS من https://nodejs.org/ ثم شغّل الملف من جديد.
  pause
  exit /b 1
)
echo [1/2] Installing dependencies...
call npm install
if errorlevel 1 ( echo فشل تثبيت الحزم. تأكدي من الإنترنت. & pause & exit /b 1 )
echo [2/2] Building installer...
call npm run desktop:build
if errorlevel 1 ( echo فشل البناء. & pause & exit /b 1 )
echo.
echo تم. افتحي مجلد release-install-only وشغّلي Qabda Cart Setup.exe
pause
