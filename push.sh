#!/bin/bash
# Schiebt den aktuellen Stand der Webseite zu GitHub Pages.
# Aufruf:  ./push.sh            oder   ./push.sh "Was sich geaendert hat"
#
# Beim ersten Mal fragt Git nach:
#   Username: allesisteinprototyp
#   Password: der Personal Access Token (ghp_... bzw. github_pat_...), NICHT das GitHub-Passwort
# Danach liegt das im macOS-Schluesselbund und wird nicht mehr abgefragt.
set -e
cd "$(dirname "$0")"

MSG="${1:-Portfolio aktualisiert $(date '+%d.%m.%Y %H:%M')}"

# 1. Aenderungen einsammeln, falls es welche gibt
git add -A
if git diff --cached --quiet; then
  echo "Keine neuen Aenderungen im Ordner."
else
  git commit -q -m "$MSG"
  echo "Gespeichert: $MSG"
fi

# 2. Immer pushen. Auch wenn oben nichts Neues dazukam, koennen noch
#    aeltere Commits daraufwarten, hochgeladen zu werden.
echo "Lade zu GitHub hoch. Beim ersten Mal kommen jetzt Username und Token."
git push -u origin main

echo ""
echo "Fertig. In ein bis zwei Minuten live auf:"
echo "https://allesisteinprototyp.github.io/Portfolio_Arturo/"
