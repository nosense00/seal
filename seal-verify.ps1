# ================================
# Seal GitHub → Primus Quick Verify
# Author: nosense00
# ================================

$SealRepo = "C:\Dev\seal"  # path sa imong seal repo

# Go to repo folder
if (!(Test-Path $SealRepo)) {
    Write-Host "❌ Seal repo not found at $SealRepo"
    exit 1
}
Set-Location $SealRepo

# Ensure git exists
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git not found. Install git first."
    exit 1
}

# Fetch latest from origin
git fetch origin main

# Get latest local and remote commit hashes
$localCommit = git rev-parse HEAD
$remoteCommit = git rev-parse origin/main

Write-Host "Local HEAD:  $localCommit"
Write-Host "Remote HEAD: $remoteCommit"

if ($localCommit -eq $remoteCommit) {
    Write-Host "✅ Primus submission seen: latest commit pushed!" -ForegroundColor Green
} else {
    Write-Host "⚠️ Latest commit not yet pushed. Run seal-submit.ps1 first." -ForegroundColor Yellow
}
