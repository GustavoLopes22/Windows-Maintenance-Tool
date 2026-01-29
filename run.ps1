[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

Write-Host @"
 __    __  ___ ___  ______ 
|  |__|  ||   |   ||      |
|  |  |  || _   _ ||      |
|  |  |  ||  \_/  ||_|  |_|
|  `  '   ||   |   |  |  |  
 \      / |   |   |  |  |  
  \_/\_/  |___|___|  |__|   

 WINDOWS MAINTENANCE TOOL
"@ -ForegroundColor Cyan

# Carrega config
. .\config.ps1

# Garante pasta de log
if (!(Test-Path ".\logs")) {
    New-Item -ItemType Directory -Path ".\logs" | Out-Null
}

$logFile = ".\logs\WMT_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"

Start-Transcript -Path $logFile -Append | Out-Null

# Executa módulos
. .\clean\temp.ps1
. .\clean\recyclebin.ps1
. .\clean\downloads.ps1

Stop-Transcript | Out-Null

Write-Host ""
Write-Host "Execução finalizada" -ForegroundColor Green
Write-Host "Log salvo em $logFile" 