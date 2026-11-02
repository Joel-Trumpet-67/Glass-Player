# Glass Player

Minimal, ad-free music player with a Liquid Glass-style UI. Runs as a home screen web app on iPhone.

Live: https://joel-trumpet-67.github.io/glass-player/

## How music works
Songs are **not** in this repo. You import them on each device with the **+** button
(pick MP3s from the Files app). They're stored on that device in IndexedDB, so the
app works offline and nothing gets uploaded.

## Features
- Import MP3/M4A from Files; reads ID3 title, artist and cover art
- Cleans YouTube-style filenames ("(Official Video)", "[Lyrics]", underscores)
- Edit title/artist (with a Swap button for "Title - Artist" files), like, remove, play next
- Shuffle, repeat all / repeat one, draggable scrubber
- Lock screen and Control Center controls (Media Session API)
- Remembers your queue, last song and recently played

## Files
- `index.html` – the whole app (HTML/CSS/JS)
- `manifest.webmanifest` – home screen install
- `sw.js` – offline cache for the app itself
- `icon-*.png`, `apple-touch-icon.png` – icons

## Run locally
    python3 -m http.server 8000
Open http://localhost:8000
