<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    Script to getPath other PowerShell scripts as Paths

.DESCRIPTION
    Execute the script_files that are 'getPathd' in this 'profile_getPath.ps1' script

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_getPath.ps1
    VERSION
        -v1.0    

#-------------------- getPath Below File --------------------------------------#>
# Define the path to the configuration file that contains additional Paths
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# getPath the configuration file to load any additional Paths
 # . $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

 # Debug profile_getPath.ps1  
if($DEBUG["debug_path"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_getPath.ps1 } Loaded Successfully"} 
   
# Read the JSON data from the file
$paths_json_raw_data = Get-Content -Path "$Home\Documents\PowerShell\directories.json" -Raw

# Convert the JSON data to a PowerShell object
$paths_array_data = ConvertFrom-Json -InputObject $paths_json_raw_data 

#-------------------- Functions {Read-Only }--------------
# Function to getPath by specifying directory name
function getPath($directory_name)
{
    # Get the path to the directory based on its name
    $directory_path_data = $paths_array_data | Where-Object { $_.Name -eq $directory_name }
    $directory_path = $($directory_path_data.Path)

    if(($DEBUG["debug_path"]) -eq "enable") { Write-Output "Directory Name : $directory_name | Path $directory_path" }

    # Check if the file exists before including it
    if (Test-Path $directory_path){ return $directory_path_data }
    else{ Write-Error "Error: $directory_name not found in the path : $directory_path" }
}
function checkPaths(){
    
    foreach ($paths in $paths_array_data) {
        if (Test-Path $paths.Path) {
            Write-Output "[ OK ] Confirmed: $($paths.Directory) at $($paths.Path)"
        } else {
            Write-Output "[    ] Not found: $($paths.Directory) at $($paths.Path)"
        }
    }

}
# Function to getPath all Paths specified in the JSON string
function tablePath(){

    if(($TABLE["show_all_paths"]) -eq "enable") 
    {   
        $paths_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$paths_array_data.IndexOf($_) + 1}}, 
        @{label="Title"; expression={$_.Name}}, 
        @{label="Directory"; expression={$_.Directory}},
        @{label="Path"; expression={$_.Path}},
        @{label="Description"; expression={$_.Desc}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
}

 # getPath("powershell") # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 
 # tablePath             # <-------------- NOTE-3 : TO RUN THIS SCRIPT | UNCOMMENT 
