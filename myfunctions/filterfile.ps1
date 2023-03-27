function filterfile($extension,$substring) {

    Write-Output "Extension : $extension"
    Write-Output "Substring to Look for : $substring"
    Write-Output "---------------------------------------------------------------------"
    Get-ChildItem -Filter *.$extension | Where-Object { $_.Name -like '*$substring*' }
    # Get-ChildItem -Filter *.ps1 | Where-Object { $_.Name -like '*online*' }
    
    }