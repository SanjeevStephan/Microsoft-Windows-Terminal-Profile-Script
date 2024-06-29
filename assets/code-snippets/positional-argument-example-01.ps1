param(
    [string]$name
)


# eg : .\positional-argument-example-01.ps1 sanju  
do
{
    Write-Host "Hello, $name!" -ForegroundColor Green
    $reply = Read-Host "How are you doing, $name ?"
}
while([String]::IsNullOrEmpty($reply)) { Write-Host "Nice,Good Bye"}