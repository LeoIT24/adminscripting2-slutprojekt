Write-Host "=== Memory Information ===" -ForegroundColor Cyan
Write-Host ""

$computer = Get-CimInstance Win32_ComputerSystem

Write-Host "Installed RAM (GB):" -ForegroundColor Yellow
Write-Host ([math]::Round($computer.TotalPhysicalMemory / 1GB, 2))

# -----------------------------
# Loggning
# -----------------------------

# Skapar loggmappen om den saknas
if (-not (Test-Path "..\logs")) {
    New-Item -ItemType Directory -Path "..\logs" | Out-Null
}

# Namnet på modulen
$ModuleName = "System Information"

# Skapar loggrad
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$logEntry = "$timestamp | User: $env:USERNAME | Module: $ModuleName"

# Sparar till loggfil
Add-Content `
    -Path "..\logs\activity.log" `
    -Value $logEntry

Write-Host "Log entry created." -ForegroundColor Green