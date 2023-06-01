
function goto() { 
    Check-Path
    List-Path
    $index = Read-Host "[ INPUT ] Which directory you want to go (1+N) :"
    #$index = Read-Host "[ INPUT ] Which directory you want to go (1+N) :"
    $goto_directory_name = $paths_array_data[$index - 1].Name
    $goto_path = $paths_array_data[$index - 1].Path 
    DEBUG("Goto Directory Name : $goto_directory_name")
    DEBUG("Goto Directory Path : $goto_path")

    if(ispythoninstalled -eq $true){ Figlet $goto_directory_name }

    try {
        cd $goto_path
        ls
    }
    catch { <#Do this if a terminating exception happens#> 
        Write-Host "[ INVALID ] directory Path doesn't exists" -ForegroundColor Red  }

}
    