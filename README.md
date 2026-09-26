# JAM 2027 Study HQ — Cross-device version

This version is designed for **Windows, Mac and iPad** through the browser.

## Cloud sync setup (Supabase)
1. Create a free project at https://supabase.com
2. Open SQL Editor and run `supabase.sql`.
3. Open Project Settings → API and copy the Project URL and anon key.
4. Put them in `config.js`.
5. In Authentication → Providers, enable Email. Google is optional.
6. Upload all files to GitHub.
7. Enable GitHub Pages.

After setup, create/sign into the same account on each device. Your topics, study logs, tests and revisions will be stored in Supabase and synced.

## Files
- `index.html` — app shell
- `style.css` — responsive UI
- `app.js` — tracker logic, authentication and cloud sync
- `config.js` — your Supabase URL/key
- `supabase.sql` — database tables + row-level security

## Important
Never put a Supabase service-role key in this website. Only use the public `anon` key.
