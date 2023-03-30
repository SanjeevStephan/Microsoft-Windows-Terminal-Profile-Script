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
$profile_source = "$Home\Documents\PowerShell\"
$myscript_source = "$profile_source\myscripts"

# Debug profile_getfunction.ps1  
if(InitialCheckStatus(1) -eq "enable")
{ 
    Write-Output "<-------------------{ Loading Dependencies }-------------------------->"
    Write-Output "[ OK ] Profile include => { include.ps1 } Loaded Successfully"
} 


<# Function to include all dependencies using traditional hashtable#>
$profile_dependencies = @{
    "powerShell_profile" = "$profile_source\Microsoft.PowerShell_profile.ps1"
    "profile_config"     = "$profile_source\profile_config.ps1"
    "profile_function"   = "$profile_source\profile_function.ps1"
    "profile_console"    = "$myscript_source\profile_console.ps1"
    "getDependencies"    = "$myscript_source\getDependencies.ps1"    
    "getFunction"        = "$myscript_source\getFunction.ps1"
    "getJson"            = "$myscript_source\getJson.ps1"    
    "getPath"            = "$myscript_source\getPath.ps1"
    "getPython"          = "$myscript_source\getPython.ps1"
    "getScript"          = "$myscript_source\getScript.ps1"
    "setMyFunctions"     = "$myscript_source\\setMyFunctions.ps1"   
}

. $profile_dependencies["getPath"]
. $profile_dependencies["getJson"]
. $profile_dependencies["getScript"]
. $profile_dependencies["getDependencies"]
. $profile_dependencies["getPython"]
. $profile_dependencies["getFunction"]
. $profile_dependencies["profile_function"]
. $profile_dependencies["setMyFunctions"]

