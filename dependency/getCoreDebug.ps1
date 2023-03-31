

function coreShowJSON($jsonFilePath )
{
    $jsonFileName = Split-Path -Path $MyInvocation.ScriptName -Leaf

     # $jsonFileName = $jsonHashTableData["Json-File-Name"]
     # $jsonFilePath = $jsonHashTableData["Json-File-Path"]

    Write-Host "[ OK ] Located => { $jsonFileName } at $jsonFilePath" -ForegroundColor Yellow
    Write-Host "[ OK ] Loading  : All My Function from JSON List => { $jsonFileName }" -ForegroundColor Yellow    
}
<#

Copybelow hastable to any dependency and enter the json-file and json-name 
    $storedFuncHashTable = @{

        "JSON-File-Name" = "$profileFunctionJsonFileName"
        "JSON-File-Path" = "$profileFunctionFilePath"
    }

    coreDebugJSON($storedFuncHashTable)
#>



function show-core($HashTable){


    <#
    
    
    
  
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
  #>
}


