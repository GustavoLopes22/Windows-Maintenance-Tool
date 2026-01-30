$downloads = "$env:USERPROFILE\Downloads"
$oldFolder = Join-Path $downloads $OLD_FOLDER_NAME

if ($MOVE_INSTEAD_DELETE -and !(Test-Path $oldFolder)) {
    New-Item -ItemType Directory -Path $oldFolder | Out-Null
}

$limitDate = (Get-Date).AddDays(-$DAYS_OLD_DOWNLOADS)

$files = Get-ChildItem $downloads -File -ErrorAction SilentlyContinue |
Where-Object { $_.LastWriteTime -lt $limitDate }

foreach ($file in $files) {
    if ($DRY_RUN) {
        Write-Output "Dry-run: would move $($file.Name)" -ForegroundColor DarkGray
    } else {
        if ($MOVE_INSTEAD_DELETE) {
            Move-Item $file.FullName $oldFolder -Force
        } else {
            Remove-Item $file.FullName -Force
        }
    }
}

Write-Host "[3/3] ► Organizing downloads folder..." -ForegroundColor Cyan