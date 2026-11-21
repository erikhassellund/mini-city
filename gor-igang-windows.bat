@echo off
setlocal
cd /d "%~dp0"

set PORT=8080
set URL=http://localhost:%PORT%/index.html

echo ============================================
echo   MINI CITY - startar lokal spelserver...
echo ============================================
echo.

where node >nul 2>nul
if not errorlevel 1 (
  start "" %URL%
  npx --yes serve -l %PORT% .
  goto :end
)

where py >nul 2>nul
if not errorlevel 1 (
  start "" %URL%
  py -m http.server %PORT%
  goto :end
)

where python >nul 2>nul
if not errorlevel 1 (
  start "" %URL%
  python -m http.server %PORT%
  goto :end
)

echo [!] Kunde inte hitta Node.js eller Python.
echo     Installera ett av dem och kör igen:
echo       Node.js : https://nodejs.org
echo       Python  : https://www.python.org/downloads/
echo.
pause

:end
endlocal
