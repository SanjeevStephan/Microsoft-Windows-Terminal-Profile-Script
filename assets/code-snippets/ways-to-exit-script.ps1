

do{
    $input = Read-Host "Enter Any Word : "
    Write-Host "You Have Entered : $input"

    if($input -eq "quit") 
    { 
        Write-Host "GoodBye"
        exit 0
    }
}
# Loop Until the user entered nothing then quit
while (![String]::IsNullOrEmpty($input)) {
    Write-Host "You Have Entered Nothing. Try Again Next Time."
}