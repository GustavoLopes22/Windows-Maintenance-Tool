if ($DRY_RUN) {
    Write-Host "Dry-run ativo: lixeira nao foi esvaziada" -ForegroundColor Red
} else {
    Clear-RecycleBin -Force
}

Write-Host "[2/3] >>> Lixeira limpa." -ForegroundColor Green