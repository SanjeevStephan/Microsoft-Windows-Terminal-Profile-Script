. "$home\superuser.ps1"

Write-Host "[ OK ] Reading HashTable from [ $home/superuser.ps1 ]"


$jsonDirectory = $DIRECTORY.myjson
$existingUsername = $SYSTEM.username
$currentUsername = $env:USERNAME

Write-Host "[ OK ] JSON-Directory Path : $jsonDirectory"
Write-Host "[ OK ] Old Username  : $existingUsername"
Write-Host "[ Ok ] New Username  : $currentUsername"

$changeDir = Read-Host "Do you want to change it (y/n) :"
if($changeDir -eq 'y') { 
    #$jsonDirectory     = Read-Host "Enter the path to the json files directory"
    $existingUsername  = Read-Host "Enter the exsiting SubString to Replace : "
    #$currentUsername      = Read-Host "Enter the New SubString : "
} else { Write-Host "Continuing Now"}



function filterSubstring() {

    # Get all the *.json files in $home\myjson\myjsonList.json and subfolders
    Get-ChildItem $jsonDirectory  -Recurse -Filter '*.json' -File | 
    # check each file
    foreach {
      # get the content of the file as a string
      $content = Get-Content $_.FullName -Raw
      # check if the content contains 'Sanju'
      if ($content -match $existingUsername) {
        # display 'Text Found' and the file name
        Write-Host "[ OK ] Text '$existingUsername' Found in $($_.Name)" -ForegroundColor Green
      }
      else {
        # display 'Text Not Found' and the file name
        Write-Host "[    ] Text Not Found in $($_.Name)" -ForegroundColor Red
      }
    }

}

function replaceSubstring() {

    Write-Host "[ OK ] Replace SubString  : $existingUsername"
    Write-Host "[ OK ] New SubString       : $currentUsername"


    # Get all the *.json files in $home\myjson\myjsonList.json and subfolders
    Get-ChildItem $jsonDirectory  -Recurse -Filter '*.json' -File | 
    # check each file
    foreach {
      # get the content of the file as a string
      $content = Get-Content $_.FullName -Raw
      # check if the content contains 'Sanju'
      if ($content -match $existingUsername) {
        # replace only if the is 'Text Found' and the file name

         # get the content of the file as a string
        $content = Get-Content $_.FullName -Raw
        # replace 'Sanju' with the new name
        $content = $content -replace $existingUsername, $currentUsername 
  
        # write the modified content back to the file
        Set-Content $_.FullName -Value $content

        Write-Host "[ OK ] Replace '$existingUsername' to '$currentUsername ' in $($_.FullName)" -ForegroundColor Green

      }
      else {
        # display 'Text Not Found' and the file name
        Write-Host "[    ] File Remain Untouched in $($_.Name)" -ForegroundColor Red
      }
    }

}






if(Test-Path $jsonDirectory) 
{ 
    filterSubstring
    $confirmReplace = Read-Host "Do you want to replace Substring '$existingUsername' with '$currentUsername' (y/n) : "
    if($confirmReplace -eq 'y') { replaceSubstring } else { Write-Host "Quiting now" -ForegroundColor White}

} else { Write-Host "[ NOT-FOUND ] JSON Directory 'Does Not-Exists' at Path : $jsonDirectory" } 

