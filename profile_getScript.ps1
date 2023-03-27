<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    Script to getScript other PowerShell scripts as dependencies

.DESCRIPTION
    Execute the script_files that are 'getScriptd' in this 'profile_getScript.ps1' script

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_getScript.ps1
    VERSION
        -v1.0    




#-------------------- getScript Below File --------------------------------------#>
# Define the path to the configuration file that contains additional dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# getScript the configuration file to load any additional dependencies
 # . $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

 # Debug profile_getScript.ps1  
if($DEBUG["debug_path"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_getScript.ps1 } Loaded Successfully"} 
   
# Define a JSON string that contains the names and paths of the dependencies to be getScriptd
# Read the JSON data from the file
$profile_path_json_data = Get-Content -Path "$Home\Documents\PowerShell\scripts.json" -Raw

# Convert the JSON data to a PowerShell object
$profile_path_array = ConvertFrom-Json -InputObject $profile_path_json_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getScript by specifying Script name
function getScript($script_name)
{
    # Get the path to the Script based on its name
    $script_array_data = $profile_path_array | Where-Object { $_.Name -eq $script_name }
    $script_path = $($script_array_data.Path)
    # Write-Output "Script Name : $script_name | Path $script_path"
    # Check if the file exists before including it
    if (Test-Path $script_path){
        # getScript the dependency file
        # .$script_path

            if(($DEBUG["debug_path"]) -eq "enable") 
            { Write-Output "Script Name : $script_name | Path $script_path" } 
            else { <# Write-Output "[] 'Enable' the 'display_getScript_confirmation' in the $config_file" #> }
    }
    else{
        Write-Error "Error: $script_name not found at path $script_path"
    }
    return $script_array_data
}

# Function to getScript all dependencies specified in the JSON string
function list_all_script(){

    if(($TABLE["show_all_scripts"]) -eq "enable") 
    {   #Write-Output "Script Name : $script_name | Path $script_path" 
        $profile_path_array | Sort-Object | Format-Table @{label="Serial"; expression={$profile_path_array.IndexOf($_) + 1}}, 
        @{label="Name"; expression={$_.Name}}, 
 #       @{label="File"; expression={$_.File}},
        @{label="Path"; expression={$_.Path}},
        @{label="Description"; expression={$_.Desc}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }



}

# getScript_Dependencies # getScript necessary dependencies for the Microsoft.PowerShell_Profile.ps1
 # getScript("profile_exec_script") # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 
 # list_all_script          # <-------------- NOTE-3 : TO RUN THIS SCRIPT | UNCOMMENT 

 # $getScript('test')