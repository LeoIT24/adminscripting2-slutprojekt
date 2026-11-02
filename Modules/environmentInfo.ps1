Write-Host "=== Environment Variables ===" -ForegroundColor Cyan
Write-Host ""

$variables = Get-ChildItem Env:

foreach ($variable in $variables) {

    Write-Host $variable.Name -ForegroundColor Yellow
    Write-Host $variable.Value

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