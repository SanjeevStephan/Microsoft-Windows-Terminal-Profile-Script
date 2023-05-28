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
        
#-------------------- Must Check the Configuration File  --------------------------------------#>
# Define the path to the configuration file that contains additional Paths
#$profile_config_path = Get-Content "$Home\Documents\PowerShell\profile.config"
$profile_config_path = "$home\superuser.ps1"
# getPath the configuration file to load any additional Paths
. $profile_config_path  # <-------------- NOTE : LOAD THE CONFIG-FILE via (Dot-Sourcing)

# Display Ascii-figlet Text "The Terminal"
type $ASCII.theterminal 

if(Test-Path $DEPENDENCY.TheConfigurationFile) 
{

    if(Test-Path $DIRECTORY.dependency)
    {

        Write-Output "<-------------------{ Loading Dependencies }-------------------------->"
        Write-Host "[ INCLUDE-ALL ] The {*.ps1} in the $($DIRECTORY.dependency)" -ForegroundColor Cyan
        Write-Output "[ OK ] Profile include => { profile_include.ps1 } Loaded Successfully"
    
        # Get all the *.ps1 files in the "dependency" directory
        $dependency_files = Get-ChildItem -Path $DIRECTORY.dependency -Filter "*.ps1" | Select-Object -ExpandProperty FullName
    
        Write-Debug "Directory Dependency : $($DIRECTORY.dependency)"
        # Loop through each dependency file and include it in the profile
        foreach ($path in $dependency_files) {
            if (Test-Path $path) {
    
                Write-Host "[ OK ] Dependency : $(Split-Path -Leaf $path) : Included $path " -ForegroundColor Blue
                . $path
            } else {
                Write-Warning "Missing $(Split-Path -Leaf $path) at path $path"
            }
        }

    } else { Write-Error "Dependency directory path is empty : $($DIRECTORY.dependency)"} 



} else { Write-Error "Configuration File Missing { $($DEPENDENCY.TheConfigurationFile)}"}
