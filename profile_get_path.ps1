<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    Script to get_path other PowerShell scripts as dependencies

.DESCRIPTION
    Execute the script_files that are 'get_pathd' in this 'profile_get_path.ps1' script

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_get_path.ps1
    VERSION
        -v1.0    




#-------------------- get_path Below File --------------------------------------#>
# Define the path to the configuration file that contains additional dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# get_path the configuration file to load any additional dependencies
 # . $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

 # Debug profile_get_path.ps1  
if($DEBUG["debug_path"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_get_path.ps1 } Loaded Successfully"} 
   
# Define a JSON string that contains the names and paths of the dependencies to be get_pathd
# Read the JSON data from the file
$profile_path_json_data = Get-Content -Path "$Home\Documents\PowerShell\paths.json" -Raw

# Convert the JSON data to a PowerShell object
$profile_path_array = ConvertFrom-Json -InputObject $profile_path_json_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to get_path by specifying directory name
function get_path($directory_name)
{
    # Get the path to the directory based on its name
    $directory_path_data = $profile_path_array | Where-Object { $_.Name -eq $directory_name }
    $directory_path = $($directory_path_data.Path)

    if(($DEBUG["debug_path"]) -eq "enable") { Write-Output "Directory Name : $directory_name | Path $directory_path" }

    # Check if the file exists before including it
    if (Test-Path $directory_path){
        # get_path the dependency file
        #. $directory_path

            if(($DEBUG["debug_path"]) -eq "enable") { Write-Output "Directory Name : $directory_name | Path $directory_path Exists" } 
    }
    else{
        Write-Error "Error: $directory_name not found at path $directory_path"
    }
    return $directory_path
}

# Function to get_path all dependencies specified in the JSON string
function list_all_path(){

    if(($TABLE["show_all_paths"]) -eq "enable") 
    {   #Write-Output "Directory Name : $directory_name | Path $directory_path" 
        $profile_path_array | Sort-Object | Format-Table @{label="Serial"; expression={$profile_path_array.IndexOf($_) + 1}}, 
        @{label="Title"; expression={$_.Name}}, 
        @{label="Type"; expression={$_.Type}},
        @{label="Path"; expression={$_.Path}},
        @{label="Description"; expression={$_.Desc}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }



}

# get_path_Dependencies # get_path necessary dependencies for the Microsoft.PowerShell_Profile.ps1
 # get_path("powershell") # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 
 # list_all_path          # <-------------- NOTE-3 : TO RUN THIS SCRIPT | UNCOMMENT 