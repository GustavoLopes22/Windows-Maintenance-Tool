Write-Host "[2/3] - Processing Recycle Bin..." -ForegroundColor Cyan

if ($DRY_RUN) {
    Write-Host "[WARNING] Dry-run active: trash can not emptied." -ForegroundColor Yellow
} else {
    try { 
        Clear-RecycleBin -Force -ErrorAction Stop
    } catch {
        Write-Host "[WARNING] Recycle Bin already empty or inaccessible." -ForegroundColor Yellow
    }
}