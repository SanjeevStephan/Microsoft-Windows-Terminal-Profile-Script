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
  #. $profile_config_path  # <-------------- NOTE-1 : TO RUN THIS jsons | UNCOMMENT 

 # Debug profile_getjsons.ps1  
if($DEBUG[12]["Status"] -eq "enable"){ Write-Output "[ OK ] Check-Python()    => { getPython.ps1 } Loaded Successfully"} 
   
# Read the JSON data from the file
$python_json_raw_data = Get-Content -Path $JSON[8]["Path"] -Raw

# Convert the JSON data to a PowerShell object
$python_array_data = ConvertFrom-Json -InputObject $python_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getjsons by specifying jsons name
function Get-Python($python_script_name)
{
    # Filter 'Pythons-Name' in the array and store as $python_array_data
    $python_array_data = $python_array_data | Where-Object { $_.Name -eq $python_script_name }
    
    # Get the path to the jsons based on its name
    $python_script_path = $($python_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $python_script_path){ return $python_array_data }
    else{ Write-Output "Error: $python_script_name not found in JSON List 'myJsonList.json"  }   
}
function Get-JsonPath($python_script_name)
{
    # Filter 'jsons-Name' in the array and store as $python_array_data
    $python_array_data = $python_array_data | Where-Object { $_.Name -eq $python_script_name }
    
    # Get the path to the jsons based on its name
    $python_script_path = $($python_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $python_script_path){ return $python_script_path }
    else{ Write-Output "Error: $python_script_name not found in JSON List 'jsons.json"  }   
}

function Check-Python(){
    
    foreach ($python_script_file in $python_array_data) {
        if (Test-Path $python_script_file.Path) {
            Write-Output "[ OK ] Confirmed: $($python_script_file.File) at $($python_script_file.Path)"
        } else {
            Write-Output "[    ] Not found: $($python_script_file.File) at $($python_script_file.Path)"
        }
    }

}
function Read-Python($python_script_filename) {

    # Filter 'jsons-Name' in the array and store as $python_array_data
    $python_array_data = $python_array_data | Where-Object { $_.Name -eq $python_script_filename }
    
    # Get the path to the jsons based on its name
    $pathToPythonScriptFile = $($python_array_data.Path)    

    # Get the path to the JSON file as an argument
    #$pathToPythonScriptFile = $args[0]

    # Read the contents of the JSON file
    $jsonContent = Get-Content $pathToPythonScriptFile | Out-String

    # Convert the JSON string to a PowerShell object
    $jsonObject = ConvertFrom-Json $jsonContent

    # Output the object to the console
    Write-Output $jsonObject

    Table-Json
}
# Function to display all jsons specified in the JSON File 'jsons.json'
function List-Python(){

    if($($TABLE[6]["Status"]) -eq "enable") 
    {   
        $python_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$python_array_data.IndexOf($_) + 1}}, 
        @{label="Name"; expression={$_.Name}}, 
        @{label="JSON File"; expression={$_.File}},
        @{label="Path"; expression={$_.Path}} -AutoSize
    } 
    else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
}

 # getjsons("test")    # <-------------- NOTE-2 : TO RUN THIS jsons | UNCOMMENT 
 # Table-Json          # <-------------- NOTE-3 : TO RUN THIS jsons | UNCOMMENT 




