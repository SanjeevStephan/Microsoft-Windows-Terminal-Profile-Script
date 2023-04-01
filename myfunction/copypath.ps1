function copypath() {
    <#
    .SYNOPSIS
        send the working directory path to the clipboad
    .SYNTAX
        copypath
    .PARAMETER
        no-parameter included
    
    #>
    
    
        $current_directory = Get-Location
        $current_directory | Set-Clipboard
        Write-Output "[Copied] Directory Path: $($current_directory.Path)"
    }
    
    
    