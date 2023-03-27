<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    jsons to getjsons other PowerShell jsons as dependencies

.DEjsonsION
    Execute the jsons_files that are 'getjsonsd' in this 'profile_getjsons.ps1' jsons

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    jsons
        -profile_getjsons.ps1
    VERSION
        -v1.0    

#-------------------- Include Below File --------------------------------------#>
# Define the path to the configuration file that contains additional dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# getjsons the configuration file to load any additional dependencies
 # . $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS jsons | UNCOMMENT 

 # Debug profile_getjsons.ps1  
if($DEBUG["debug_path"] -eq "enable"){ Write-Output "[ OK ] Profile jsons => { profile_getjsons.ps1 } Loaded Successfully"} 
   
# Read the JSON data from the file
$jsons_json_raw_data = Get-Content -Path "$Home\Documents\PowerShell\jsons.json" -Raw

# Convert the JSON data to a PowerShell object
$jsons_array_data = ConvertFrom-Json -InputObject $jsons_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getjsons by specifying jsons name
function getjsons($jsons_name)
{
    # Filter 'jsons-Name' in the array and store as $jsons_array_data
    $jsons_array_data = $jsons_array_data | Where-Object { $_.Name -eq $jsons_name }
    
    # Get the path to the jsons based on its name
    $jsons_path = $($jsons_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $jsons_path){ return $jsons_array_data }
    else{ Write-Output "Error: $jsons_name not found in JSON List 'jsons.json"  }   
}

function checkJsons(){
    
    foreach ($jsons in $jsons_array_data) {
        if (Test-Path $jsons.Path) {
            Write-Output "[ OK ] Confirmed: $($jsons.File) at $($jsons.Path)"
        } else {
            Write-Output "[    ] Not found: $($jsons.File) at $($jsons.Path)"
        }
    }

}
function readJson($jsons_filename) {

    # Filter 'jsons-Name' in the array and store as $jsons_array_data
    $jsons_array_data = $jsons_array_data | Where-Object { $_.Name -eq $jsons_filename }
    
    # Get the path to the jsons based on its name
    $pathToJsonFile = $($jsons_array_data.Path)    

    # Get the path to the JSON file as an argument
    #$pathToJsonFile = $args[0]

    # Read the contents of the JSON file
    $jsonContent = Get-Content $pathToJsonFile | Out-String

    # Convert the JSON string to a PowerShell object
    $jsonObject = ConvertFrom-Json $jsonContent

    # Output the object to the console
    Write-Output $jsonObject

}
# Function to display all jsons specified in the JSON File 'jsons.json'
function tablejsons(){

    if(($TABLE["show_all_jsons"]) -eq "enable") 
    {   #Write-Output "jsons Name : $jsons_name | Path $jsons_path" 
        $jsons_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$jsons_array_data.IndexOf($_) + 1}}, 
        @{label="Name"; expression={$_.Name}}, 
 #      @{label="File"; expression={$_.File}},
        @{label="File"; expression={$_.File}},
        @{label="Path"; expression={$_.Path}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
}

 # getjsons("test")    # <-------------- NOTE-2 : TO RUN THIS jsons | UNCOMMENT 
 # tablejsons          # <-------------- NOTE-3 : TO RUN THIS jsons | UNCOMMENT 




