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

#-------------------- Include Below File --------------------------------------#>
# Define the path to the configuration file that contains additional dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# getScript the configuration file to load any additional dependencies
 # . $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

 # Debug profile_getScript.ps1  
if($DEBUG["debug_path"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_getScript.ps1 } Loaded Successfully"} 
   
# Read the JSON data from the file
$script_json_raw_data = Get-Content -Path "$Home\Documents\PowerShell\scripts.json" -Raw

# Convert the JSON data to a PowerShell object
$script_array_data = ConvertFrom-Json -InputObject $script_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getScript by specifying Script name
function getScript($script_name)
{
    # Filter 'Script-Name' in the array and store as $script_array_data
    $script_array_data = $script_array_data | Where-Object { $_.Name -eq $script_name }
    
    # Get the path to the Script based on its name
    $script_path = $($script_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $script_path){ return $script_array_data }
    else{ Write-Output "Error: $script_name not found in JSON List 'scripts.json"  }   
}

function checkScripts(){
    
    foreach ($scripts in $script_array_data) {
        if (Test-Path $scripts.Path) {
            Write-Output "[ OK ] Confirmed: $($scripts.File) at $($scripts.Path)"
        } else {
            Write-Output "[    ] Not found: $($scripts.File) at $($scripts.Path)"
        }
    }

}

# Function to display all script specified in the JSON File 'scripts.json'
function tableScript(){

    if(($TABLE["show_all_scripts"]) -eq "enable") 
    {   #Write-Output "Script Name : $script_name | Path $script_path" 
        $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
        @{label="Name"; expression={$_.Name}}, 
 #      @{label="File"; expression={$_.File}},
        @{label="Path"; expression={$_.Path}},
        @{label="Description"; expression={$_.Desc}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
}

 # getScript("test")    # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 
 # tableScript          # <-------------- NOTE-3 : TO RUN THIS SCRIPT | UNCOMMENT 