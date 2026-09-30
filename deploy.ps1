<#
.SYNOPSIS
    Interactive deployment script for Lahore Music House website.
#>

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "   Lahore Music House - Deployment Utility     " -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Select deployment target:"
Write-Host " [1] Deploy to Vercel (npx vercel)"
Write-Host " [2] Deploy to Netlify (npx netlify-cli deploy --prod)"
Write-Host " [3] Push to GitHub (for GitHub Pages / CI/CD)"
Write-Host " [4] Build & Run Docker Container locally (port 8080)"
Write-Host " [5] Test local static server (port 3000)"
Write-Host " [0] Exit"
Write-Host ""

$choice = Read-Host "Enter your choice (0-5)"

switch ($choice) {
    "1" {
        Write-Host "`nDeploying to Vercel..." -ForegroundColor Green
        npx vercel
    }
    "2" {
        Write-Host "`nDeploying to Netlify..." -ForegroundColor Green
        npx netlify deploy --prod --dir=.
    }
    "3" {
        $repoUrl = Read-Host "Enter your GitHub Remote URL (or press Enter if already configured)"
        if ($repoUrl -ne "") {
            git remote remove origin 2>$null
            git remote add origin $repoUrl
        }
        $commitMsg = Read-Host "Enter commit message (default: 'Deploy update')"
        if ($commitMsg -eq "") { $commitMsg = "Deploy update" }
        
        git add .
        git commit -m "$commitMsg"
        git branch -M main
        git push -u origin main
        Write-Host "`nPushed to GitHub! If GitHub Pages workflow is enabled, it will deploy automatically." -ForegroundColor Green
    }
    "4" {
        Write-Host "`nBuilding and launching Docker container..." -ForegroundColor Green
        docker-compose up -d --build
        Write-Host "Container started! Access site at http://localhost:8080" -ForegroundColor Green
    }
    "5" {
        Write-Host "`nStarting local server on http://localhost:3000..." -ForegroundColor Green
        npx serve -p 3000 .
    }
    default {
        Write-Host "Exiting." -ForegroundColor Yellow
    }
}
