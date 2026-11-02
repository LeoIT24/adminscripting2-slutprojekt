# bootTime.ps1

Write-Host "=== Boot Time Information ===" -ForegroundColor Cyan
Write-Host ""

$os = Get-CimInstance Win32_OperatingSystem

Write-Host "Last Boot Time:" -ForegroundColor Yellow
Write-Host $os.LastBootUpTime

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