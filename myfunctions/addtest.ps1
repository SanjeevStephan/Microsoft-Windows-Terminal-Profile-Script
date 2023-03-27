function addtest($filename){

    #Add the prefix "test_" to a given string argument:
    #$file_to_be_renamed = "test_" + "$filename"
    
    $filename = "$filename"
    $file_to_be_renamed = $filename.Replace(".\","test_")
    Rename-Item $filename $file_to_be_renamed
    #check_file_exists = $pwd + "$filename"
    #bool = Test-Path check_file_exists
    Write-Host "$filename successfully renamed to $file_to_be_renamed"
    
    }