# Homekeeping vNext (Expo + Supabase)

Cross-platform (iOS/Android) client built with Expo, backed by a local (or hosted) Supabase backend.

---

## Prerequisites

* Node.js v18+
* npm v9+ or v10+
* Docker Desktop (running)
* Supabase CLI (`npm install -g supabase`)
* Expo Go app on your phone (App Store / Play Store)
* Phone and development machine must be on the **same Wi-Fi network**

---

## Project Structure

```bash
homekeeping-vnext/
  app/
    App.js
    lib/
      supabase.js
    .env.local
    app.json
    index.js
  supabase/
    migrations/
      0001_init.sql
```

---

## 1) Start Local Supabase

From the repo root (the folder containing `supabase/`):

```bash
npx supabase start
```

This prints:

* API URL
* ANON key
* Studio URL
* Mailpit URL

Keep these handy. They are required for environment configuration.

---

## 2) Apply Migrations

```bash
npx supabase migration up
```

Confirm with:

```bash
npx supabase migration list
```

---

## 3) Configure Environment Variables

Inside `app/.env.local`:

```bash
EXPO_PUBLIC_SUPABASE_URL=http://YOUR_LAN_IP:54321
EXPO_PUBLIC_SUPABASE_ANON_KEY=YOUR_ANON_KEY
```

* Replace `YOUR_LAN_IP` with your computer’s LAN IP (e.g. `192.168.1.216`).
* Replace `YOUR_ANON_KEY` with the `ANON_KEY` shown in `supabase status`.

⚠️ Do **not** use `127.0.0.1` or `localhost` when testing on a physical phone.

---

## 4) Install Dependencies

```bash
cd app
npm install
```

---

## 5) Run the Client

```bash
npx expo start
```

* A QR code will appear in your terminal.
* Open **Expo Go** on your phone and scan the QR.
* The app should load and automatically ping Supabase.

If you see `Network request failed`, verify:

* Phone and laptop are on the same Wi-Fi
* `EXPO_PUBLIC_SUPABASE_URL` points to your LAN IP
* Supabase containers are running (`npx supabase status`)

---

## 6) Useful Commands

* **Check Supabase services:**

  ```bash
  npx supabase status
  ```

* **Stop Supabase:**

  ```bash
  npx supabase stop
  ```

* **Reset DB (destroys data):**

  ```bash
  npx supabase db reset
  ```

* **View DB UI (Studio):**
  Open the Studio URL shown by `supabase start` (usually [http://127.0.0.1:54323](http://127.0.0.1:54323))

---

## 7) Push to GitHub

```bash
git init
git branch -m main
git add .
git commit -m "chore: bootstrap expo + supabase local"

# Option A: With GitHub CLI
gh repo create homekeeping-vnext --source=. --public --push

# Option B: Manual
git remote add origin https://github.com/<you>/homekeeping-vnext.git
git push -u origin main
```

Make sure `.env` and `.env.local` files are ignored (`.gitignore` already includes them).

---

## Next Steps

With the repo pushed and environment configured:

* Open the project in **Cursor** (or VS Code)
* Drop in the detailed app spec
* Iterate feature by feature with AI agents

You now have a working baseline: **Expo + Supabase + Physical Device connectivity**. 🚀
