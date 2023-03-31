$core_profile_config = "$HOME/Documents/PowerShell/profile_config.ps1"

function coreShowJSON($hashTableBox)
{
    # Get-Member -InputObject $MyInvocation

    $scriptName       = $hashTableBox["Script Name"]
    $scriptFullPath   = $hashTableBox["Script Path"]
    $scriptExecutedBy = $hashTableBox["Function Called By"]
    $invocationName   = $hashTableBox["InvocationName"]
    $invocationLine   = $hashTableBox["Invocation Line"]
    $invocationCommand   = $hashTableBox["Invocation Command"]
    $jsonFilePath      = $hashTableBox["JSON Path"]
    $jsonFileName      = Split-Path -Path $jsonFilePath -Leaf

    if(Test-Path $jsonFilePath)   { $isJsonFileAvailable   = "Available" } else { $isJsonFileAvailable   = "Not-Available"}
    if(Test-Path $scriptFullPath) { $isScriptFileAvailable = "Available" } else { $isScriptFileAvailable = "Not-Available"}

    Write-Host "[ INFO ] Script-Name   => { $scriptName }"            -ForegroundColor Yellow   
    Write-Host "[ INFO ] Script-Path   => { $scriptFullPath }"        -ForegroundColor Yellow  
    Write-Host "[ INFO ] Script-Status => { $isScriptFileAvailable }" -ForegroundColor Yellow       
    Write-Host "[ INFO ] JSON-Name     => { $jsonFileName }"          -ForegroundColor Yellow   
    Write-Host "[ INFO ] JSON-Path     => { $jsonFilePath }"          -ForegroundColor Yellow   
    Write-Host "[ INFO ] JSON-Status   => { $isJsonFileAvailable }"   -ForegroundColor Yellow   
    Write-Host "[ INFO ] Executed-By   => { $scriptExecutedBy } "     -ForegroundColor White 
<#    
    Write-Host "[ INFO ] Invocation-Name    => { $invocationName } "     -ForegroundColor White 
    Write-Host "[ INFO ] Invocation-Line    => { $invocationLine } "     -ForegroundColor White 
    Write-Host "[ INFO ] Invocation-Command => { $invocationCommand } "     -ForegroundColor White 
#>
    
<#

        "InvocationName"     = "$($MyInvocation.InvocationName)"
        "Invocation Line"    = "$($MyInvocation.Line)"
        "Invocation Command" ="$($MyInvocation.MyCommand)"


    Write-Host "[ OK ] Script-Name => { $scriptName } at $scriptFullPath" -ForegroundColor White 
    Write-Host "[ OK ] Executed By => { $scriptExecutedBy } " -ForegroundColor White 
    Write-Host "[ OK ] Located     => { $jsonFileName } at $jsonFilePath" -ForegroundColor Yellow
    Write-Host "[ OK ] Loading : All Functions from JSON List => { $jsonFileName }" -ForegroundColor Yellow   
#>



}
     
function setCoreConfirmed(){

    
    Write-Host "[ OK ] Confirmed: '$($scripts.Name)' at $($scripts.Path)" -ForegroundColor Green
}


<#
        $storedScript_HashTable = = @{
        "Script Name " = "$scriptName "
        "Script Path"  = "$scriptFullPath"
        "JSON Path "   = "$myScriptJsonSource"
        "Function Called By" = "$scriptExecutedBy"
    }
    #>

     # $jsonFileName = $jsonHashTableData["Json-File-Name"]
     <# 
     $scriptName     = $MyInvocation.MyCommand.Name
     $scriptFullPath = $MyInvocation.MyCommand.Path
    $jsonFileName = Split-Path -Path $MyInvocation.ScriptName -Leaf
     $scriptExecutedBy = Split-Path -Path $MyInvocation.ScriptName -Leaf

      
     #>

   
    <#
    
    Copybelow hastable to any dependency and enter the json-file and json-name 
        $storedFuncHashTable = @{
    
            "JSON-File-Name" = "$profileFunctionJsonFileName"
            "JSON-File-Path" = "$profileFunctionFilePath"
        }
    
        coreDebugJSON($storedFuncHashTable)
    #>
    <#
    
       
    

    Write-Host "Function 'Goto-Directory()' was called by $callingFunction"

    #Write-Host "InvocationName: $($MyInvocation.InvocationName)"
   # Write-Host "Line: $($MyInvocation.Line)"
    #Write-Host "MyCommand: $($MyInvocation.MyCommand)"

    #Write-Host "ScriptName: $($MyInvocation.ScriptName)"

    #$scriptFileName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    #Write-Host "The caller's script file name is: $scriptFileName"

    
  
    Write-Host "Core File-Name : $($HashTable["File-Name"])"
    Write-Host "Core File-Name : $($HashTable["File-Path"])"    


    Write-Output "<-------------------{  $scriptName }-------------------------->"
    Write-Host "[ OK ] Dependency : $scriptName => Included { $num_of_function } Functions Successfully"
    Write-Output "[....] The Script Name : $scriptName"
    Write-Output "[....] The Script Path : $scriptFullPath"
    Write-Output "[....] Invoked By : $scriptExecutedBy"
    Write-Output "$($StoredConfigStatus["Status"]) Configuration-File { $configName } is $($StoredConfigStatus["IsAvailable"]) at $profile_config_path"
    Write-Output "$($storedJsonFileStatus["Status"]) JSON-File { $jsonFileName } is $($storedJsonFileStatus["IsAvailable"])"



    $HashTable.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Color"; expression={$_.Value}} -AutoSize
 
  
  
  
  
  $config_status = Is-Available($profile_config_path)  #checks if 'profile_config.ps1' is available
$jsonFileStatus = Is-Available($myScriptJsonSource) #checks if 'myScripts.json' is available
$configName = Get-FileName($profile_config_path)
#$jsonFileName = Get-FileName($myScriptJsonSource) # Get JSON-File name



$storedScript_HashTable = @{
    "Script Name " = "$scriptName "
    "Script Path" = "$scriptFullPath"
   # "JSON Name" = "$jsonFileName"
   # "JSON Path " = "$myScriptJsonSource"
   # "JSON Status " = "$jsonFileStatus"
   # "Config File-Name" = "$configName"
   # "Config File-Status" = "$config_status"
   # "Config File-path" = "$profile_config_path"
    "Function Called By" = "$scriptExecutedBy"

 }

Show-Core($storedScript_HashTable)
  
  
  
  
  
    #>


