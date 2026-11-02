# Glass Player

Minimal, ad-free music player with a Liquid Glass-style UI. Runs as a home screen web app on iPhone.

Live: https://joel-trumpet-67.github.io/glass-player/

## Two modes
- **Cloud library (Supabase):** sign in on any device and your songs are already there.
  Files live in a *private* Supabase bucket that only signed-in accounts can read.
- **This device only:** if `config.js` is empty, songs are stored on the device you import them on.

Songs are never stored in this repo.

## Cloud setup (one time)
1. Create a free account at https://supabase.com and make a new project (any name, pick a region near Michigan, e.g. East US).
2. **SQL Editor → New query**, paste all of `setup.sql`, click **Run**.
3. **Authentication → Sign In / Providers**: turn **off** "Allow new users to sign up".
4. **Authentication → Users → Add user → Create new user**: your email + a password, tick **Auto Confirm User**. Repeat for anyone else (e.g. Mom).
5. **Project Settings → API**: copy the **Project URL** and the **anon public** (or **publishable**) key into `config.js`. Both are safe to publish.
6. Commit and push. Open the site, sign in, tap **+** and upload your songs (zip, folder, or files).

## Features
- Upload once, play on every device; songs cache on each device after first play
- "Save all songs for offline" in the account menu
- Import files, a whole folder (Mac), a .zip (iPhone), or drag and drop
- Reads ID3 title, artist and cover art; cleans YouTube-style filenames
- Edit (with Swap), like (per person), play next, remove
- Shuffle, repeat / repeat one, scrubber, lock screen controls
- Picks up songs added on another device when you reopen the app

## Free-tier notes
Supabase free: 1 GB storage (~200 songs), 5 GB downloads/month, 50 MB max per file.
Free projects pause after a week with no use; un-pause from the Supabase dashboard.

## Files
- `index.html` – the app
- `config.js` – your Supabase URL + public key
- `setup.sql` – database, storage and access rules
- `supabase.js`, `jszip.min.js` – bundled libraries
- `sw.js`, `manifest.webmanifest`, icons – installable / offline app shell
