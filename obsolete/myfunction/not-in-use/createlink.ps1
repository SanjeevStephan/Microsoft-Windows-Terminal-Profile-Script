function createlink($shortcut_filename) {
    # new-line => [ `n ]
    $location = Get-Location
    $url = Get-Clipboard
    $filename = "$location\$shortcut_filename.url"
    $text_to_write = "[InternetShortcut]`nURL=$url"
    
    Set-Content $filename $text_to_write
    
    if(Test-Path $filename) { 
        Write-Output "Link : $url"
        Write-Output "Shortcut Link : $filename Successfully Created "
    }
    else { Write-Output "Failed to create Shorcut Link" }
    
    }