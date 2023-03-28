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
if($DEBUG["debug_myfunction"] -eq "enable"){ Write-Output "[ OK ] myfunction => { myfunctions.ps1 } Loaded Successfully"} 
 
# Define the path to the functions.json file
$myFunction_JsonFilePath = "$Home\Documents\PowerShell\myfunctions\myfunctions.json"

# Read the contents of the JSON file into a PowerShell object
$jsonContent = Get-Content $myFunction_JsonFilePath | ConvertFrom-Json

# Define the path to the PowerShell profile directory
$myFunctionSource = "$HOME\Documents\PowerShell\myfunctions"

# Create a hashtable to store the dependencies
$myfunction_hashtable = @{}

# Loop through each function in the JSON object and add it to the dependencies hashtable
foreach ($function in $jsonContent) {
    $myfunction_hashtable[$function.Name] = "$myFunctionSource\$($function.File)"
    #Write-Output "Added : $myfunction_hashtable[$function.Name] = $myFunctionSource\$($function.File) `n"
}

# Loop through each myfunction and include it in the profile
foreach ($myfunction in $myfunction_hashtable.Values) {
    . $myfunction

# Debug profile_myfunctions.ps1 
#if($DEBUG["debug_myfunction"] -eq "enable"){ "[ Included ] Dependencies : $myfunction" } else { <# Does nothing #>}


}


 