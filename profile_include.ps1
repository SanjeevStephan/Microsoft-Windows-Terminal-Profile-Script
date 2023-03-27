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
# Define the path to the configuration file that contains additional dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# Include the configuration file to load any additional dependencies
 . $profile_config_path # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 

 # Debug profile_include.ps1 
 if($DEBUG["debug_include"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_include.ps1 } Loaded Successfully"} 

 
<# Function to include all dependencies using traditional hashtable#>
$profile_dependencies = @{
    "powerShell_profile" = "$profile_source\Microsoft.PowerShell_profile.ps1"
    "profile_console"    = "$profile_source\profile_console.ps1"
    "profile_func"       = "$profile_source\profile_function.ps1"
    "profile_getPath"    = "$profile_source\profile_getPath.ps1"
    "profile_getScript"  = "$profile_source\profile_getScript.ps1"
    "profile_getDependencies"  = "$profile_source\profile_getDependencies.ps1"    
    "profile_getJson"    = "$profile_source\profile_getJson.ps1"      
    "profile_alias"      = "$profile_source\profile_setAlias.ps1"    
    
}

. $profile_dependencies["profile_getPath"]
. $profile_dependencies["profile_getScript"]
. $profile_dependencies["profile_getDependencies"]
. $profile_dependencies["profile_getJson"]
. $profile_dependencies["profile_func"]


