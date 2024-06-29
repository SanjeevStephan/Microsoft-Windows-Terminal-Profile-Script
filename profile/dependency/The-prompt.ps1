$ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object {$_.ToString().Split(":")[1].Trim() }

function prompt($display_msg) {

    $location = Get-Location
    $computer_name = $env:COMPUTERNAME
    Write-Host '┌──(' -NoNewline -ForegroundColor Green
    Write-Host $computer_name -NoNewline -ForegroundColor Yellow
    Write-Host '㉿' -NoNewline -ForegroundColor Red
    Write-Host "$ip_address" -NoNewline -ForegroundColor Blue
    Write-Host ")-[$location]" -ForegroundColor Green
    Write-Host '└─$ ' -NoNewline -ForegroundColor Green

}