Write-Host "=== Disk Information ===" -ForegroundColor Cyan
Write-Host ""

$volumes = Get-Volume

foreach ($volume in $volumes) {

    if ($volume.DriveLetter) {

        Write-Host "Drive:" -ForegroundColor Yellow
        Write-Host $volume.DriveLetter

        Write-Host "Free Space (GB):" -ForegroundColor Yellow
        Write-Host ([math]::Round($volume.SizeRemaining / 1GB, 2))

        Write-Host "Total Size (GB):" -ForegroundColor Yellow
        Write-Host ([math]::Round($volume.Size / 1GB, 2))

        Write-Host ""
    }
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