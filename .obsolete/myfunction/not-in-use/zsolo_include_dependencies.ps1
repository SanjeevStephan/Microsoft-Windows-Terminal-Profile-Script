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

<# -------------------- Functions {Read-Only | Below Function wasn't able to include the dependecies}--------------##>

 # Function to include a specific dependency by name
function include($profile_file_name)
{
    # Define a JSON string that contains the names and paths of the dependencies to be included
    # Read the JSON data from the file
    $profile_dependencies_json_data = Get-Content -Path "$Home\Documents\PowerShell\dependencies.json" -Raw

    # Convert the JSON data to a PowerShell object
    $dependencies_db = ConvertFrom-Json -InputObject $profile_dependencies_json_data 

    # Get the path to the dependency file based on its name
    $dependencies_data = $dependencies_db | Where-Object { $_.Name -eq $profile_file_name }

    if($dependencies_data) {
        # Check if the file exists before including it
        if (Test-Path $dependencies_data.Path) {
            # Include the dependency file
            . $dependencies_data.Path
            Write-Output $dependencies_data.Path

            if($DEBUG["debug_includes"] -eq "enable") {
                Write-Output "Included $profile_file_name successfully"
            } else {
                Write-Output "[] 'Enable' the 'display_include_confirmation' in the $config_file"
            }
        } else {
            Write-Error "Error: $profile_file_name not found at path $($dependencies_data.Path)"
        }
    } else {
        Write-Error "Error: Dependency $profile_file_name not found in the dependencies.json file"
    }
}

# Function to include all dependencies specified in the JSON string
include("profile_getPath")
include("profile_getScript")
include("profile_func")


