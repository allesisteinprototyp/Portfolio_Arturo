# Portfolio auf GitHub Pages veröffentlichen

Repository: https://github.com/allesisteinprototyp/Portfolio_Arturo
Die Seite läuft danach unter: **https://allesisteinprototyp.github.io/Portfolio_Arturo/**

Dieser Ordner ist fertig. Nichts umbenennen, nichts verschieben.

```
github-pages/
├── index.html      <- die Seite selbst (157 KB)
├── .nojekyll       <- schaltet Jekyll ab
├── DEPLOY.md       <- diese Anleitung
└── images/         <- 57 Bilder, 21 MB
```

## Weg A: im Browser hochladen (kein Git nötig)

1. Repository öffnen, dann **Add file → Upload files**.
2. `index.html` und `.nojekyll` reinziehen. Hochladen (Commit changes).
3. Nochmal **Add file → Upload files**, diesmal den **Ordner `images`** reinziehen.
   GitHub legt den Ordner automatisch an. 57 Bilder, das dauert kurz.
4. **Settings → Pages**: Source auf *Deploy from a branch*, Branch `main`,
   Ordner `/ (root)`. Save.
5. Ein bis zwei Minuten warten, dann ist die Seite live.

Wichtig: den **Inhalt** dieses Ordners hochladen, nicht den Ordner `github-pages` selbst.
`index.html` muss direkt im Repository liegen, nicht in einem Unterordner.

Falls `.nojekyll` beim Reinziehen nicht auftaucht (macOS blendet Dateien mit Punkt aus):
im Finder `Cmd + Shift + .` drücken, dann wird sie sichtbar.

## Weg B: über das Terminal

Einmalig, ersetzt Weg A komplett:

```bash
cd "/Users/me/Documents/Job Aplications/AAA-bewerbung-arturo-handoff/github-pages" && git init -b main && git add -A && git commit -m "Portfolio" && git remote add origin https://github.com/allesisteinprototyp/Portfolio_Arturo.git && git push -u origin main
```

GitHub fragt nach Benutzername und Passwort. Als Passwort funktioniert das normale
Kontopasswort **nicht**, du brauchst ein Personal Access Token:
GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
→ Generate new token, Haken bei `repo`, Token kopieren und als Passwort eingeben.

Danach trotzdem noch Schritt 4 von oben machen (Settings → Pages einschalten).

## Wenn sich später etwas ändert

Neue Version von `index.html` hier ablegen und wieder hochladen bzw. pushen:

```bash
cd "/Users/me/Documents/Job Aplications/AAA-bewerbung-arturo-handoff/github-pages" && git add -A && git commit -m "Update" && git push
```

Die Bilder bleiben liegen, solange keine neuen dazukommen.
