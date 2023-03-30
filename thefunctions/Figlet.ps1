function Figlet($msg){
    $exec_py_json = Get-Python("figlet")
    $py_script_path =  $($exec_py_json.Path)
    if($DEBUG[11]["Status"] -eq "enable"){ Write-Output "Python Script Path : $($exec_py_json.Path)" } else { <# Do nothing #>}
    # Execute python by supplying the --parameter and $argumnet 
    & python $py_script_path --message $msg 


    #Get-Member -InputObject $MyInvocation
    
    $callingFunction = $MyInvocation.MyCommand.Name
    Write-Host "Function 'Goto-Directory()' was called by $callingFunction"

    Write-Host "InvocationName: $($MyInvocation.InvocationName)"
    Write-Host "Line: $($MyInvocation.Line)"
    Write-Host "MyCommand: $($MyInvocation.MyCommand)"


    Write-Host "ScriptName: $($MyInvocation.ScriptName)"

    $scriptFileName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    Write-Host "The caller's script file name is: $scriptFileName"

 }