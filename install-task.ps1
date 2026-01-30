$taskName = "WMT - Windows Maintenance Tool"
$scriptPath = Join-Path $PSScriptRoot "run.ps1"

schtasks /create `
 /tn "$taskName" `
 /tr "powershell.exe -ExecutionPolicy Bypass -File `"$scriptPath`"" `
 /sc weekly `
 /d MON `
 /st 09:00 `
 /f