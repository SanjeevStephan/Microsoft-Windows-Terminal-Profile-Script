function createfile($script_extension) {
    #changes the 'extensions' along with the file-naming convention a/c to script-file-type
    $string_with_spaces = Get-Clipboard
    
        switch($script_extension)
        {
            "py" 
            { 
                # for python-files replace space( ) with (_)
                $new_string = $string_with_spaces -replace " ", "_"
                 #$jointedString = $new_string -join ".py" <- this line didnot worked
                 $jointedString = "$new_string.py" 
                 $jointedString | Set-Clipboard # send 'new_string_file_name.py' to clipboard
    
                }
            "ps" 
            { 
                 # for powershell-files replace space( ) with (-)
                $new_string = $string_with_spaces -replace " ", "-"
                # $jointedString = $new_string -join ".ps1"   <- this line didnot worked
                $jointedString = "$new_string.ps1"
                $jointedString | Set-Clipboard # send 'new-string-file-name.ps1' to clipboard
                }
            "txt"{ Set-Clipboard = $new_string -join ".txt" }
            Default {Write-Output "Wrong Parameter | Try -> {py,ps,txt}" }
    
        }
    
    
    #Write-Output "Sent to Clipboard : $string_with_spaces" 
    #Write-Output "After Replace : $new_string"  
    
        
    }