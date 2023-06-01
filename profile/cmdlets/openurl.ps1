function openurl($htmlfile){

    $location = Get-Location
    $localpath = "file:\\$location$htmlfile"
    $webpath = $localpath.Replace("\","/")
    Write-Output "Opening path in brave: $webpath"
    Start-Process brave.exe $webpath
    }