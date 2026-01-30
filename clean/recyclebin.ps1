if ($DRY_RUN) {
    Write-Host "[WARNING] Dry-run active: trash can not emptied." -ForegroundColor Yellow
} else {
    Clear-RecycleBin -Force
}

Write-Host "[2/3] ► Processing Recycle Bin..." -ForegroundColor Cyan