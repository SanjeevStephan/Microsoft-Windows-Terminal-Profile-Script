function openurl($directoryToOpen){

    $location = Get-Location

    # Define the directory where the *.url files are located
    $directory = $directoryToOpen.replace("./","")
    $finalDirectory = "$location/$directory"
    Write-Host "[  ] Opening URLs From Directory : $finalDirectory"

    # Get all the *.url files in the directory
    $files = Get-ChildItem -Path $directory -Filter *.url

    # Loop through each file and extract the URL
    foreach ($file in $files) {
        $content = Get-Content $file.FullName
        $url = $content | Where-Object { $_ -like "URL=*" } | ForEach-Object { $_ -replace "URL=" }
    
        # Open the URL in Brave browser
        Start-Process "brave.exe" $url
    Write-Host "[  ] Opening URLs { $url } in brave"
    }

}