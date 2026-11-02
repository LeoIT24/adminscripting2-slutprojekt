Write-Host "=== CPU Information ===" -ForegroundColor Cyan
Write-Host ""

$cpu = Get-CimInstance Win32_Processor

Write-Host "CPU Name:" -ForegroundColor Yellow
Write-Host $cpu.Name

Write-Host ""
Write-Host "Number of Cores:" -ForegroundColor Yellow
Write-Host $cpu.NumberOfCores

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