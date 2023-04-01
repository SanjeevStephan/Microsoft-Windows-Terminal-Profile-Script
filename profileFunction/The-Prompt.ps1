function prompt($display_msg) {
    $location = '~'
    $location = Get-Location
    $computer_name = $env:COMPUTERNAME
    Write-Host '┌──(' -NoNewline -ForegroundColor Green
    Write-Host 'superuser' -NoNewline -ForegroundColor Yellow
    Write-Host '㉿' -NoNewline -ForegroundColor Red
    Write-Host "$computer_name" -NoNewline -ForegroundColor Blue
    Write-Host ")-[$location]" -ForegroundColor Green
    Write-Host '└─$ ' -NoNewline -ForegroundColor Green
    $prompt_tail = ':'

    #$command = Read-Host $prompt_tail $display_msg
    #Debug("You have entered $command")

    #Invoke-Expression $command 
    #return $command 
}