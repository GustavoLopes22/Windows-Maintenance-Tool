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
Write-Host ""

. .\config.ps1

$global:TOTAL_FILES = 0
$global:TOTAL_BYTES = 0

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

$mb = [math]::Round($TOTAL_BYTES / 1MB, 2)

Write-Host "-----------------------------------" -ForegroundColor DarkGray
Write-Host "Files processed : $TOTAL_FILES" -ForegroundColor DarkGray
Write-Host "Space freed     : $mb MB" -ForegroundColor DarkGray
Write-Host "-----------------------------------" -ForegroundColor DarkGray

Write-Host "Log saved at: $logFile" -ForegroundColor DarkGray