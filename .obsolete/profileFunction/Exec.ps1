<#

 function EXECUTE_SCRIPT($script_name,$argument) {
 #  function EXECUTE_SCRIPT($script_name,$argument)


    $exec_script = GET-SCRIPT($script_name) # returns this path -> $Home\Documents\PowerShell\profile_execScript.ps1"

          DEBUG("Executed Script Name : $script_name")
          DEBUG("Executed Script at Path : $exec_script")

    if($script_name) # if script_name is not-empty | execute if-block 
    {

       # if($argument) { & $exec_script.Path $script_name $argument} else { & $exec_script.Path $script_name }

    } else { 
            Write-Output "Script Name is Empty | Try -> exec test"
           
            }  

    return $true
 }
 #>

 function EXEC() {

     check-script
     list-script


    $index = Read-Host "[ INPUT ] Which script you want to execute (1+N) :"
    #$index = Read-Host "[ INPUT ] Which script you want to execute (1+N) :"
    $executable_script_name = $script_array_data[$index - 1].Name
    $exec_script_path = $script_array_data[$index - 1].Path 
    DEBUG("EXEC Script Name : $executable_script_name")
    DEBUG("EXEC Script Path : $exec_script_path")

    if(ispythoninstalled -eq $true){ Figlet $executable_script_name }

    try {
        #cd $exec_script_path
        #EXECUTE_SCRIPT($executable_script_name)

        if(Test-Path $exec_script_path) { & $exec_script_path $executable_script_name } else { Write-Host "[ ERROR ] Failed to Execute Script : $executable_script_name " -ForegroundColor Red}

        #ls
    }
    catch { <#Do this if a terminating exception happens#> 
        Write-Host "[ INVALID ] script Path doesn't exists" -ForegroundColor Red  }

 }