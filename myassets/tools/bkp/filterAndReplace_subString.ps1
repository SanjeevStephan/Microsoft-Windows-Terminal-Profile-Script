. "$home\superuser.ps1"

Write-Host "[ OK ] Reading HashTable from [ $home/superuser.ps1 ]"

$jsonDirectory
$existingSubstring
$newSubstring


Write-Host "[ OK ] JSON-Directory Path : $jsonDirectory"
Write-Host "[ OK ] Existing SubString  : $existingSubstring"
Write-Host "[ Ok ] New SubString       : $newSubstring"

$changeDir = Read-Host "Do you want to change it (y/n) :"
if($changeDir -eq 'y') { 
    $jsonDirectory     = Read-Host "Enter the path to the json files directory"
    $existingSubstring = Read-Host "Enter the exsiting SubString to Replace : "
    $newSubstring      = Read-Host "Enter the New SubString : "
} else { Write-Host "Continuing Now"}

function filterSubstring() {

    # Get all the *.json files in $home\myjson\myjsonList.json and subfolders
    Get-ChildItem $jsonDirectory  -Recurse -Filter '*.json' -File | 
    # check each file
    foreach {
      # get the content of the file as a string
      $content = Get-Content $_.FullName -Raw
      # check if the content contains 'Sanju'
      if ($content -match $existingSubstring) {
        # display 'Text Found' and the file name
        Write-Host "[ OK ] Text '$existingSubstring' Found in $($_.Name)" -ForegroundColor Green
      }
      else {
        # display 'Text Not Found' and the file name
        Write-Host "[    ] Text Not Found in $($_.Name)" -ForegroundColor Red
      }
    }

}

function replaceSubstring() {

    Write-Host "[ OK ] Replace SubString  : $existingSubstring"
    Write-Host "[ OK ] New SubString       : $newSubstring"


    # Get all the *.json files in $home\myjson\myjsonList.json and subfolders
    Get-ChildItem $jsonDirectory  -Recurse -Filter '*.json' -File | 
    # check each file
    foreach {
      # get the content of the file as a string
      $content = Get-Content $_.FullName -Raw
      # check if the content contains 'Sanju'
      if ($content -match $existingSubstring) {
        # replace only if the is 'Text Found' and the file name

         # get the content of the file as a string
      $content = Get-Content $_.FullName -Raw
      # replace 'Sanju' with the new name
      $content = $content -replace $existingSubstring, $newSubstring 
      # write the modified content back to the file
      Set-Content $_.FullName -Value $content
      Write-Host "[ OK ] Replace '$existingSubstring' to '$newSubstring ' in $($_.FullName)" -ForegroundColor Green
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
    $confirmReplace = Read-Host "Do you want to replace Substring '$existingSubstring' with '$newSubstring'"
    if($confirmReplace -eq 'y') { replaceSubstring } else { Write-Host "Quiting now" -ForegroundColor White}

} else { Write-Host "[ NOT-FOUND ] JSON Directory 'Does Not-Exists' at Path : $jsonDirectory" } 

