function EXEC($script_name,$argument) {
    $exec_script = GET-SCRIPT("execScript") # returns this path -> $Home\Documents\PowerShell\profile_execScript.ps1"

    if($script_name) # if script_name is not-empty | execute if-block 
    {
        if($argument) { & $exec_script.Path $script_name $argument} else { & $exec_script.Path $script_name }

    } else { 
            Write-Output "Script Name is Empty | Try -> exec test"
            Table-Script name
            }  

    return $true
 }
