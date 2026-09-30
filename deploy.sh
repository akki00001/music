#!/usr/bin/env bash
set -e

echo "==============================================="
echo "   Lahore Music House - Deployment Utility     "
echo "==============================================="
echo ""
echo "Select deployment target:"
echo " [1] Deploy to Vercel (npx vercel)"
echo " [2] Deploy to Netlify (npx netlify deploy --prod)"
echo " [3] Push to GitHub (for GitHub Pages / CI/CD)"
echo " [4] Build & Run Docker Container locally (port 8080)"
echo " [5] Test local static server (port 3000)"
echo " [0] Exit"
echo ""

read -p "Enter your choice (0-5): " choice

case $choice in
    1)
        echo "Deploying to Vercel..."
        npx vercel
        ;;
    2)
        echo "Deploying to Netlify..."
        npx netlify deploy --prod --dir=.
        ;;
    3)
        read -p "Enter GitHub repo URL (or leave blank if configured): " repoUrl
        if [ -n "$repoUrl" ]; then
            git remote remove origin 2>/dev/null || true
            git remote add origin "$repoUrl"
        fi
        read -p "Enter commit message (default: 'Deploy update'): " commitMsg
        if [ -z "$commitMsg" ]; then
            commitMsg="Deploy update"
        fi
        git add .
        git commit -m "$commitMsg" || true
        git branch -M main
        git push -u origin main
        echo "Pushed to GitHub!"
        ;;
    4)
        echo "Building & running Docker..."
        docker-compose up -d --build
        echo "Container live at http://localhost:8080"
        ;;
    5)
        echo "Starting local server at http://localhost:3000..."
        npx serve -p 3000 .
        ;;
    *)
        echo "Exiting."
        ;;
esac
