Write-Host "🚀 Starting Tea Protocol Seal Submit..."

# Ensure git exists
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git not found. Install git first."
    exit 1
}

# Pull latest changes
git pull origin main

# Commit any local changes
git add .
git commit -m "tea protocol submission test" -ErrorAction SilentlyContinue
git push origin main

Write-Host "✅ Seal submission complete!"
