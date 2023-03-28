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
if($DEBUG["debug_include"] -eq "enable"){ Write-Output "[ OK ] Profile include => { include.ps1 } Loaded Successfully"} 
 
#$json_file = $args[0]

# Define the path to the functions.json file
$jsonFilePath = "$Home\Documents\PowerShell\myjson\dependencies.json"

# Read the contents of the JSON file into a PowerShell object
$jsonContent = Get-Content $jsonFilePath | ConvertFrom-Json

# Create a hashtable to store the dependencies
$profileDependencies = @{}

# Loop through each function in the JSON object and add it to the dependencies hashtable
foreach ($function in $jsonContent) {
   #  $profileDependencies[$function.Name] = "$profileSource\$($function.File)"
    $profileDependencies[$function.Name] = "$($function.Path)"
    #Write-Output "Added : $profileDependencies[$function.Name] = $profileSource\$($function.File) `n"
}

# Loop through each dependency and include it in the profile
foreach ($dependency in $profileDependencies.Values) {
    . $dependency

# Debug profile_include.ps1 
#if($DEBUG["debug_include"] -eq "enable"){ "[ Included ] Dependencies : $dependency" } else { <# Does nothing #>}


}


