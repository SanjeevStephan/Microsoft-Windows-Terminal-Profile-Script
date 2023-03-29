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
# Defined the path and Load the configuration file that contains additional dependencies settings
. "$Home\Documents\PowerShell\profile_config.ps1"
#----------------------------------------------------------------------------------

# Debug profile_getfunction.ps1  
if($DEBUG[10]["Status"] -eq "enable"){ Write-Output "[ OK ] setMyFunction     => { setMyFunction.ps1 } Loaded Successfully"} 
 
# Define the path to the functions.json file
# $jsonSource = $env:myjson

# Read the contents of the JSON file into a PowerShell object
#$myFunctionJsonContent = Get-Content "$jsonSource\myfunctions.json" | ConvertFrom-Json

#$myFunctionJsonContent = Get-Json("myFunctions")

# Define the path to the functions.json file
# $myFunctionFilePath = "$Home\Documents\PowerShell\myjson\myFunctions.json"
$myFunctionFilePath = Get-JsonPath("myFunctions")

# Read the contents of the JSON file into a PowerShell object
$myFunctionJsonContent = Get-Content $myFunctionFilePath | ConvertFrom-Json

# Define the path to the PowerShell profile directory
$myFunctionSource = "$HOME\Documents\PowerShell\myfunctions"

# Create a hashtable to store the dependencies
$myfunction_hashtable = @{}

# Loop through each function in the JSON object and add it to the dependencies hashtable
foreach ($function in $myFunctionJsonContent) {
    $myfunction_hashtable[$function.Name] = "$($function.Path)"

    Write-Output "[ OK ] Included : MyFunction => { $($function.Name) }  Successfully" 
    #Write-Output "Added : $myfunction_hashtable[$function.Name] = $myFunctionSource\$($function.File) `n"
}

# Loop through each myfunction and include it in the profile
foreach ($myfunction in $myfunction_hashtable.Values) {
    . $myfunction


# Debug profile_myfunctions.ps1 
#if($DEBUG["debug_myfunction"] -eq "enable"){ "[ Included ] Dependencies : $myfunction" } else { <# Does nothing #>}

}


 