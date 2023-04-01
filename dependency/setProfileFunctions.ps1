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
        
#-------------------- setProfileFunctions.ps1 --------------------------------------#>

# Define the path to the functions.json file
#$profileFunctionFilePath = "$Home\Documents\PowerShell\myjson\myFunctions.json"
# $profileFunctionFilePath = Get-JsonPath("profileFunctions")

if(Test-Path $JSON.profileFunctions)
{
    $scriptName     = $MyInvocation.MyCommand.Name
    $scriptFullPath = $MyInvocation.MyCommand.Path
    $scriptExecutedBy = Split-Path -Path $MyInvocation.ScriptName -Leaf
    
    $storedScript_HashTable = @{
        "Script Name"        = "$scriptName "
        "Script Path"        = "$scriptFullPath"
        "JSON Path"          = "$($JSON.profileFunctions)"
        "Function Called By" = "$scriptExecutedBy"
        "InvocationName"     = "$invocationName"
        "Invocation Line"    = "$invocationLine "
        "Invocation Command" = "$invocationCommand"
     }
     coreShowJSON($storedScript_HashTable)
    
    # Read the contents of the JSON file into a PowerShell object
    $myFunctionJsonContent = Get-Content $JSON.profileFunctions | ConvertFrom-Json

    # Create a hashtable to store the dependencies
    $profileFunction_hashtable = @{}

    # Loop through each function in the JSON object and add it to the dependencies hashtable
    foreach ($function in $myFunctionJsonContent) {
        $profileFunction_hashtable[$function.Name] = "$($function.Path)"

        Write-Host "[ OK ] Included : Profile-Function => { $($function.Name) }  Successfully"  -ForegroundColor Green 
        #Write-Output "Added : $profileFunction_hashtable[$function.Name] = $myFunctionSource\$($function.File) `n"
    }

    # Loop through each myfunction and include it in the profile
    foreach ($profilefunction in $profileFunction_hashtable.Values | Sort-Object -Property Key ) {

        if(Test-Path $profilefunction)
        {

        . $profilefunction

        } else 
        { 
            $filename = [System.IO.Path]::GetFileNameWithoutExtension($profilefunction)
            Write-Error "[    ] Missing  : Profile-Function => { $filename } at $profilefunction" 
        }
    }

} else { Write-Error "[    ] Missing  : $(Get-FileName($JSON.profileFunctions)) at $($JSON.profileFunctions)" }

