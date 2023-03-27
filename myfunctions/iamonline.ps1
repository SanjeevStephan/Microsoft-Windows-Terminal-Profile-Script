function iamonline() {
    #figlet "Checking iNTERNET "
    
        #while ($true) {
            if (Test-Connection 8.8.8.8 -Count 1 -Quiet) { Write-Host "[CONNECTED] Yes! you are connected to iNTERNET!" } 
            else { Write-Host "[DISCONNECTED] No! you are not connected to the iNTERNET anymore!" }
    
            #Start-Sleep -Seconds 5
       # }
    }
    
    