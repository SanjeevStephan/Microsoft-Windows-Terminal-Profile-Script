
function showip() {

    $status = "DISCONNECTED"
    
            if (Test-Connection 8.8.8.8 -Count 1 -Quiet) { $status = "CONNECTED" } 
            else { $status = "DISCONNECTED" }
            
        $ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

        Write-Output "IP : $ip_address | Status : $status"
        
}
