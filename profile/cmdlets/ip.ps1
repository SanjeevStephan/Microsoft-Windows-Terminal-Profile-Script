
function ip() {

    $ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

    return $ip_address
        
}