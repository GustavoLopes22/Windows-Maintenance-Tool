$paths = @(
    "$env:TEMP\*",
    "C:\Windows\Temp\*"
)

foreach ($path in $paths) {
    if (Test-Path $path) {
        if ($DRY_RUN) {
            Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue -WhatIf
        } else {
            Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

Write-Host "[1/3] - Cleaning temporary files..." -ForegroundColor Cyan