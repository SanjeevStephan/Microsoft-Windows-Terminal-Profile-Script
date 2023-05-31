<#                                
 ____             __ _ _        ___            _           _      
|  _ \ _ __ ___  / _(_) | ___  |_ _|_ __   ___| |_   _  __| | ___ 
| |_) | '__/ _ \| |_| | |/ _ \  | || '_ \ / __| | | | |/ _` |/ _ \
|  __/| | | (_) |  _| | |  __/  | || | | | (__| | |_| | (_| |  __/ 2.profile_include.ps1
|_|   |_|  \___/|_| |_|_|\___| |___|_| |_|\___|_|\__,_|\__,_|\___| v1.0 | 26th-March-2023
                                                                  
.SYNOPSIS
    Script to include other PowerShell scripts as dependencies

.DESCRIPTION
    Execute the script_files that are 'included' in this 'profile_include.ps1' script

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_include.ps1
    VERSION
        -v1.0    
        
#----------------------------------------------------------------------------------#>
# Define the path to the myFunctions.json file
#$myFunctionFilePath = "$Home\Documents\PowerShell\myjson\myFunctions.json"

if(Test-Path $JSON.myFunctions)
{
    $scriptName     = $MyInvocation.MyCommand.Name
    $scriptFullPath = $MyInvocation.MyCommand.Path
    
    $scriptExecutedBy = Split-Path -Path $MyInvocation.ScriptName -Leaf
    
    $jsonFilePath = $JSON.myFunctions
    $storedScript_HashTable = @{
        "Script Name"        = "$scriptName "
        "Script Path"        = "$scriptFullPath"
        "JSON Path"          = "$jsonFilePath"
        "Function Called By" = "$scriptExecutedBy"
        "InvocationName"     = "$invocationName"
        "Invocation Line"    = "$invocationLine "
        "Invocation Command" = "$invocationCommand"
     }
     coreShowJSON($storedScript_HashTable)
    
    # Read the contents of the JSON file into a PowerShell object
    $myFunctionJsonContent = Get-Content $JSON.myFunctions | ConvertFrom-Json

    # Create a hashtable to store the dependencies
    $myfunction_hashtable = @{}

    # Loop through each function in the JSON object and add it to the dependencies hashtable
    foreach ($function in $myFunctionJsonContent) {
        $myfunction_hashtable[$function.Name] = "$($function.Path)"

        Write-Host "[ OK ] Included : MyFunction => { $($function.Name) }  Successfully"  -ForegroundColor Green 
        #Write-Output "Added : $myfunction_hashtable[$function.Name] = $myFunctionSource\$($function.File) `n"
    }
    # Write-Output "[ OK ] setMyFunction     => { setMyFunction.ps1 } Loaded Successfully"
    # Loop through each myfunction and include it in the profile
    foreach ($myfunction in $myfunction_hashtable.Values | Sort-Object -Property Key ) {

        if(Test-Path $myfunction)
        {

        . $myfunction
    
        } else 
        { 
            $filename = [System.IO.Path]::GetFileNameWithoutExtension($myfunction)
            Write-Host "[    ] Missing  : MyFunction => { $filename } at $myfunction" -ForegroundColor Red
        }
    }

} else { Write-Error "[    ] Missing  : $(Get-FileName($JSON.myfunctions)) at $($JSON.myFunctions)" }