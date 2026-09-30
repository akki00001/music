# Lahore Music House - Website

Master Crafted Indian Classical Musical Instruments (Est. 1947). Premier Manufacturer, Exporter & Supplier of Indian Classical Musical Instruments from Darya Ganj, Delhi.

---

## 🚀 Instant Deployment Guide

This project is 100% static and pre-configured for instant zero-config deployment on all major static web hosts.

### Option 1: Deploy on Vercel
1. Install Vercel CLI (optional) or connect your GitHub repository to [Vercel](https://vercel.com).
2. Run in terminal:
   ```bash
   npx vercel
   ```
   *(Configuration in `vercel.json` will automatically route traffic and apply caching/security headers).*

---

### Option 2: Deploy on Netlify
1. Drag and drop this folder directly into [Netlify Drop](https://app.netlify.com/drop) or connect to your Git repository.
2. Build Settings:
   - **Publish directory:** `.` (root directory)
   - **Build command:** *(leave empty)*
   *(Configuration is automated via `netlify.toml` and `_redirects`).*

---

### Option 3: Deploy on GitHub Pages
1. Initialize Git and push to GitHub:
   ```bash
   git init
   git add .
   git commit -m "Initial commit for deployment"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<your-repo-name>.git
   git push -u origin main
   ```
2. In GitHub repository settings:
   - Go to **Settings > Pages**.
   - Under **Build and deployment > Source**, select **Deploy from a branch**.
   - Branch: `main` / `root`. Click **Save**.

---

### Option 4: Deploy on Cloudflare Pages
1. Connect repository on Cloudflare Pages dashboard.
2. Build settings:
   - **Framework preset:** `None`
   - **Build command:** *(leave blank)*
   - **Build output directory:** `.`

---

## 💻 Local Development

To preview the website locally on your computer:

```bash
# Using Node / npm (Node 16+)
npm start

# OR using Python 3
python -m http.server 3000

# OR using PHP
php -S localhost:3000
```
Then open `http://localhost:3000` in your browser.
