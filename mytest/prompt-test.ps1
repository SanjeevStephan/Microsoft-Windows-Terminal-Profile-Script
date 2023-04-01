function prompt {
    $location = '~'
    $location = Get-Location
    Write-Host '┌──(' -NoNewline -ForegroundColor Green
    Write-Host 'superuser' -NoNewline -ForegroundColor Yellow
    Write-Host '㉿' -NoNewline -ForegroundColor Red
    Write-Host 'terminal' -NoNewline -ForegroundColor Blue
    Write-Host ")-[$location]" -ForegroundColor Green
    Write-Host '└─$ ' -NoNewline -ForegroundColor Green
    $prompt_tail = ':'

    $choice = Read-Host $prompt_tail
    Debug("You have entered $choice")
    return (List-Path)
}



prompt