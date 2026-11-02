Write-Host "=== Running Processes ===" -ForegroundColor Cyan
Write-Host ""

$processes = Get-Process |
Sort-Object ProcessName |
Select-Object -First 20

foreach ($process in $processes) {

    Write-Host "Process:" -ForegroundColor Yellow
    Write-Host $process.ProcessName

    Write-Host "ID:" -ForegroundColor Yellow
    Write-Host $process.Id

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
