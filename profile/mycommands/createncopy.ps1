function createncopy($dir_name) {
    <#
    .SYNOPSIS
        send the working directory path to the clipboad
    .SYNTAX
        copypath
    .PARAMETER
        no-parameter included
    
    #>
    
        $current_directory = Get-Location
        #$current_directory | Set-Clipboard
        $new_dir_path = "$($current_directory)\$($dir_name)" + "_FOLDER"
        mkdir $new_dir_path -Verbose
        mv *$dir_name*.mp4 $new_dir_path -Verbose

        Write-Output "[CREATED] Directory Path: $($new_dir_path)"
        #  Write-Output "[CREATED] Directory Path: $($new_dir_path.Path)"
    }
    
   

#createncopy("hello")
