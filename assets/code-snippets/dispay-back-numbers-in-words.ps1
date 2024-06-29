
do {

    $input =  Read-Host "Enter Any Number Between 0-9 : "

    # check if the user have entered any input or the variable is empty
    if([string]::IsNullOrEmpty($input))
    {
        # Display this block if the variable is empty
        Write-Host "You have entered Nothing! Try Again"
    }
    else 
    {

        switch($input)
        {
            0 { Write-Host "You Have Entered : Zero" }
            1 { Write-Host "You Have Entered : One" } 
            2 { Write-Host "You Have Entered : Two" } 
            3 { Write-Host "You Have Entered : Three" } 
            4 { Write-Host "You Have Entered : Four" } 
            5 { Write-Host "You Have Entered : Five" } 
            6 { Write-Host "You Have Entered : Six" } 
            7 { Write-Host "You Have Entered : Seven" } 
            8 { Write-Host "You Have Entered : Eight" } 
            9 { Write-Host "You Have Entered : Nine" } 

        }
    }


}
while($input -le 10)
