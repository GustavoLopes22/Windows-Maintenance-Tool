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

. .\config.ps1

if (!(Test-Path ".\logs")) {
    New-Item -ItemType Directory -Path ".\logs" | Out-Null
}

$logFile = ".\logs\WMT_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"

Start-Transcript -Path $logFile -Append | Out-Null

. .\clean\temp.ps1
. .\clean\recyclebin.ps1
. .\clean\downloads.ps1

Stop-Transcript | Out-Null

Write-Host ""
Write-Host "All tasks completed." -ForegroundColor Green

Write-Host "Log saved at: $logFile" -ForegroundColor DarkGray