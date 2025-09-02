# ================================
# SEAL Quick Submit Script
# ================================
param(
    [string]$SealRepoUrl = "https://github.com/nosense00/seal.git",
    [string]$SealLocal = "C:\Dev\seal"
)

Write-Host "=== Quick SEAL Submit Start ===" -ForegroundColor Cyan

# Step 1: Clone repo kung wala pa
if (!(Test-Path $SealLocal)) {
    git clone $SealRepoUrl $SealLocal
} else {
    Set-Location $SealLocal
    git pull origin main
}

# Step 2: Dummy change (para ma-seen commit lang)
Set-Location $SealLocal
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path "heartbeat.log" -Value "Seal active @ $timestamp"

# Step 3: Commit & push
git add .
git commit -m "chore: heartbeat update @ $timestamp"
git push origin main

Write-Host "=== Quick SEAL Submit Done ✅ ===" -ForegroundColor Cyan
