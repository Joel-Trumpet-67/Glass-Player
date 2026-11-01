# Glass Player

Minimal, ad-free music player with a Liquid Glass-style UI.

## Files
- `index.html` – the whole app (HTML/CSS/JS)
- `manifest.webmanifest` – makes it installable to the home screen
- `sw.js` – caches the app so it opens offline
- `icon-*.png`, `apple-touch-icon.png` – home screen icons

## Run on your Mac
    cd glass-player
    python3 -m http.server 8000
Open http://localhost:8000

## Install on iPhone
Host it (e.g. GitHub Pages: push this folder to a repo → Settings → Pages → deploy from main).
Open the URL in Safari → Share → Add to Home Screen. It launches full screen like a real app.
