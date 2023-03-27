function replaceto($txt_to_replace) {

    $current_working_directory = Get-Location
    
    switch($txt_to_replace) {
    
        "dash" {  replace("_","-") }  # Replace all underscores with hyphens in the file names of all files 
        "underscore" { replace("-","_") } # Replace all hyphens with underscores in the file names of all files
        Default { Write-Output "Invalid Positional Argument"}
    
    
    } # switch end-bloc
    
    
    }