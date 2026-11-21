#!/bin/bash
cd "$(cd "$(dirname "$0")" && pwd)"

PORT=8080
URL="http://localhost:$PORT/index.html"

echo "============================================"
echo "  MINI CITY - startar lokal spelserver..."
echo "============================================"
echo

open_browser() {
  if command -v open >/dev/null 2>&1; then
    open "$URL"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL" >/dev/null 2>&1 &
  fi
}

if command -v python3 >/dev/null 2>&1; then
  open_browser
  exec python3 -m http.server "$PORT"
elif command -v node >/dev/null 2>&1; then
  open_browser
  exec npx --yes serve -l "$PORT" .
else
  echo "[!] Kunde inte hitta Python eller Node.js."
  echo "    Installera ett av dem och kör igen:"
  echo "      Python : https://www.python.org/downloads/"
  echo "      Node   : https://nodejs.org"
fi
