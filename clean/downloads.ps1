$downloads = "$env:USERPROFILE\Downloads"
$oldFolder = Join-Path $downloads $OLD_FOLDER_NAME

# Cria pasta _OLD se necessário
if ($MOVE_INSTEAD_DELETE -and !(Test-Path $oldFolder)) {
    New-Item -ItemType Directory -Path $oldFolder | Out-Null
}

$limitDate = (Get-Date).AddDays(-$DAYS_OLD_DOWNLOADS)

$files = Get-ChildItem $downloads -File -ErrorAction SilentlyContinue |
Where-Object { $_.LastWriteTime -lt $limitDate }

foreach ($file in $files) {
    if ($DRY_RUN) {
        Write-Output "Dry-run: moveria $($file.Name)" -ForegroundColor Red
    } else {
        if ($MOVE_INSTEAD_DELETE) {
            Move-Item $file.FullName $oldFolder -Force
        } else {
            Remove-Item $file.FullName -Force
        }
    }
}

Write-Host "[3/3] >>> Downloads organizados" -ForegroundColor Green