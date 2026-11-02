Write-Host "=== Running Services ===" -ForegroundColor Cyan
Write-Host ""

$services = Get-Service |
Where-Object { $_.Status -eq "Running" } |
Sort-Object Name

foreach ($service in $services) {

    Write-Host "Service:" -ForegroundColor Yellow
    Write-Host $service.Name

    Write-Host "Status:" -ForegroundColor Yellow
    Write-Host $service.Status

    Write-Host ""
}

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