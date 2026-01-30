$downloads = "$env:USERPROFILE\Downloads"
$oldFolder = Join-Path $downloads $OLD_FOLDER_NAME
$localFilesCount = 0
$localBytes = 0

if ($MOVE_INSTEAD_DELETE -and !(Test-Path $oldFolder)) {
    New-Item -ItemType Directory -Path $oldFolder | Out-Null
}

$limitDate = (Get-Date).AddDays(-$DAYS_OLD_DOWNLOADS)

$files = Get-ChildItem $downloads -ErrorAction SilentlyContinue |
Where-Object { $_.LastWriteTime -lt $limitDate }

foreach ($file in $files) {
    $localFilesCount++
    $localBytes += $file.Length

    if ($DRY_RUN) {
        Write-Host "Dry-run: would move $($file.Name)" -ForegroundColor DarkGray
    } else {
        if ($MOVE_INSTEAD_DELETE) {
            Move-Item $file.FullName $oldFolder -Recurse -Force -Confirm:$false
        } else {
            Remove-Item $file.FullName -Recurse -Force -Confirm:$false
        }
    }
}

$global:TOTAL_FILES += $localFilesCount
$global:TOTAL_BYTES += $localBytes

Write-Host "[3/3] - Organizing downloads folder..." -ForegroundColor Cyan