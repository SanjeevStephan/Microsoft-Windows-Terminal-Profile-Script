

param(
    [string]$name
)

Write-Host 'Hello, World' -ForegroundColor Yellow
$reply = Read-Host "Hi , $name!. How are you ?" 

if($reply -notcontains "") { Write-Host "Good to Hear That!. Have a nice day ahead!." -ForegroundColor Green } else { Write-Host "You've entered nothing" -ForegroundColor Red}