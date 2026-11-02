# AdminTools Menu
# Endast alternativ 1 är färdigt.
# Din uppgift är att koppla ihop resten av menyn.

$running = $true

do {
    Write-Host "=== AdminTools ==="
    Write-Host "1. System Info"
    Write-Host "2. CPU Info"
    Write-Host "3. User Info"
    Write-Host "4. Disk Info"
    Write-Host "5. Memory Info"
    Write-Host "6. Network Info"
    Write-Host "7. Environment Info"
    Write-Host "8. Check Running Services"
    Write-Host "9. Check Running Processes"
    Write-Host "0. Check Boot Time"
    Write-Host "X. Exit"



    $choice = Read-Host "Select option"

    switch ($choice) {
        1 { 
            Clear-Host 
            ..\Modules\systemInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        2 { 
            Clear-Host 
            ..\Modules\cpuInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        3 { 
            Clear-Host 
            ..\Modules\userInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        4 { 
            Clear-Host 
            ..\Modules\diskInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        5 { 
            Clear-Host 
            ..\Modules\memoryInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        6 { 
            Clear-Host 
            ..\Modules\networkInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        7 { 
            Clear-Host 
            ..\Modules\environmentInfo.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        8 { 
            Clear-Host 
            ..\Modules\runningServices.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        9 { 
            Clear-Host 
            ..\Modules\runningProcesses.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        0 { 
            Clear-Host 
            ..\Modules\bootTime.ps1 #Behöver uppdatera din PATH om du lägger den i en mapp
            Read-Host "Press Enter to return to menu"
        }

        X {
            $running = $false
        }

        default {
            Write-Host "Invalid option"
        }
    }

} while ($running)
