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
        
#-------------------- Include Below File --------------------------------------#>
# Define the path to the functions.json file
# $jsonSource = $env:myjson

# Define the path to the functions.json file
#$profileFunctionFilePath = "$Home\Documents\PowerShell\myjson\myFunctions.json"
$profileFunctionFilePath = Get-JsonPath("profileFunctions")
$profileFunctionJsonFileName = Get-Filename($profileFunctionFilePath)

if(Test-Path $profileFunctionFilePath)
{
    Write-Host "[ OK ] Located => { $profileFunctionJsonFileName } at $profileFunctionFilePath" -ForegroundColor Yellow
    Write-Host "[ OK ] Loading  : All Profile Function from JSON List => { $profileFunctionJsonFileName }" -ForegroundColor Yellow   
    # Read the contents of the JSON file into a PowerShell object
    $myFunctionJsonContent = Get-Content $profileFunctionFilePath | ConvertFrom-Json

    # Define the path to the PowerShell profile directory
    $myFunctionSource = "$HOME\Documents\PowerShell\myfunctions"

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
            Write-Host "[    ] Missing  : Profile-Function => { $filename } at $profilefunction" -ForegroundColor Red
        }
    }

} else { Write-Host "[    ] Missing  : $profileFunctionJsonFileName at $profileFunctionFilePath" -ForegroundColor Red }

