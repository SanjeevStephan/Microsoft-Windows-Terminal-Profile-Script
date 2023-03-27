function stillconnected() {

    while($true) {
            if(Test-Connection google.com -Quiet) {
                Write-Host ("[{0:T}] [ Connected ] You are connected to the internet" -f (Get-Date))
            }
            else {
                Write-Host ("[{0:T}] [ Disconnected ] No longer connected to the internet" -f (Get-Date))
            }
            Start-Sleep -Seconds 2  # wait for 10 seconds before pinging again
    
        }
    }