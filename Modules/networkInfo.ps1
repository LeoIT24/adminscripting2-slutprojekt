Write-Host "=== Network Information ===" -ForegroundColor Cyan
Write-Host ""

$addresses = Get-NetIPAddress |
Where-Object { $_.AddressFamily -eq "IPv4" }

foreach ($address in $addresses) {

    Write-Host "Interface:" -ForegroundColor Yellow
    Write-Host $address.InterfaceAlias

    Write-Host "IPv4 Address:" -ForegroundColor Yellow
    Write-Host $address.IPAddress

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