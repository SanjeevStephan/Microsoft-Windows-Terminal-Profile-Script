
function The-Prompt($display_msg) {

    $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    $location = '~'
    $location = Get-Location
    Write-Host '┌──(' -NoNewline -ForegroundColor Green
    Write-Host 'setup' -NoNewline -ForegroundColor Yellow
    Write-Host '㉿' -NoNewline -ForegroundColor Red
    Write-Host 'installer' -NoNewline -ForegroundColor Blue
    Write-Host ")-[$scriptName]" -ForegroundColor Green
    Write-Host '└─$ ' -NoNewline -ForegroundColor Green
    $prompt_tail = ' '

    $choice = Read-Host $prompt_tail $display_msg
    #Debug("You have entered $choice")
    return $choice
}
