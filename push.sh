#!/bin/bash
# Schiebt den aktuellen Stand der Webseite zu GitHub Pages.
# Aufruf:  ./push.sh            oder   ./push.sh "Was sich geaendert hat"
#
# Beim ersten Mal fragt Git nach:
#   Username: allesisteinprototyp
#   Password: der Personal Access Token (github_pat_...), NICHT das GitHub-Passwort
#   Beim Einfuegen des Tokens zeigt das Terminal nichts an. Das ist normal.
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

# 2. Schauen, ob auf GitHub inzwischen etwas dazugekommen ist
#    (zum Beispiel durch einen Upload ueber die GitHub-Webseite).
git fetch -q origin main 2>/dev/null || true
if git rev-parse --verify -q origin/main >/dev/null; then
  if [ -n "$(git log HEAD..origin/main --oneline)" ]; then
    echo "Auf GitHub liegt etwas, das hier fehlt. Ich hole es und haenge unseren Stand an."
    git rebase origin/main
  fi
fi

# 3. Immer pushen. Auch wenn oben nichts Neues dazukam, koennen noch
#    aeltere Commits darauf warten, hochgeladen zu werden.
echo "Lade zu GitHub hoch."
git push -u origin main

echo ""
echo "Fertig. In ein bis zwei Minuten live auf:"
echo "https://allesisteinprototyp.github.io/Portfolio_Arturo/"
