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

. "$Home\superuser.ps1"
$profile_config_path = $ROOTFILES.profileConfig
$jsons_json_raw_data = $JSON.myJsonList

#$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"
#$jsons_json_raw_data = "$Home\Documents\PowerShell\myjson\myJsonList.json"
$scriptName     = $MyInvocation.MyCommand.Name
$scriptFullPath = $MyInvocation.MyCommand.Path
$scriptExecutedBy = Split-Path -Path $MyInvocation.ScriptName -Leaf

$storedScript_HashTable = @{
    "Script Name"        = "$scriptName "
    "Script Path"        = "$scriptFullPath"
    "JSON Path"          = "$jsons_json_raw_data"
    "Function Called By" = "$scriptExecutedBy"
    "InvocationName"     = "$invocationName"
    "Invocation Line"    = "$invocationLine "
    "Invocation Command" = "$invocationCommand"
 }
 coreShowJSON($storedScript_HashTable)

# Read the JSON data from the file
$jsons_json_raw_data = Get-Content -Path $jsons_json_raw_data -Raw

# Convert the JSON data to a PowerShell object
$jsons_array_data = ConvertFrom-Json -InputObject $jsons_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getjsons by specifying jsons name
function Get-Json($jsons_name)
{

    if($jsons_name)
    {
        # Filter 'jsons-Name' in the array and store as $jsons_array_data
        $jsons_array_data = $jsons_array_data | Where-Object { $_.Name -eq $jsons_name }
        
        # Get the path to the jsons based on its name
        $jsons_path = $($jsons_array_data.Path)

        # Check if the file exists before including it
        if (Test-Path $jsons_path){ return $jsons_array_data }
        else{ Write-Warning "Error: $jsons_name not found in JSON List 'myJsonList.json"  }   
  }
    else { $jsons_array_data }
}
function Get-JsonPath($jsons_name)
{
    if($jsons_name)
    {
        # Filter 'jsons-Name' in the array and store as $jsons_array_data
        $jsons_array_data = $jsons_array_data | Where-Object { $_.Name -eq $jsons_name }
        
        # Get the path to the jsons based on its name
        $jsons_path = $($jsons_array_data.Path)

        # Check if the file exists before including it
        if (Test-Path $jsons_path){ return $jsons_path }
        else{ Write-Output "Error: $jsons_name not found in JSON List 'jsons.json"  }   
    }
    else
    { $jsons_array_data }
}

function Check-Json(){
    Write-Output "[ OK ] Dependency : getJson.ps1 => Included Successfully"    
    foreach ($jsons in $jsons_array_data) {
        if (Test-Path $jsons.Path) {
            Write-Output "[ OK ] Confirmed: $($jsons.File) at $($jsons.Path)"
        } else {
            Write-Host "[    ] Not found: $($jsons.File) at $($jsons.Path)" -ForegroundColor Red
        }
    }

}
function Read-Json($jsons_filename) {

    if($jsons_name)
    {
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
    else
    { $jsons_array_data }
}
# Function to display all jsons specified in the JSON File 'jsons.json'
function List-Json(){
 
        $jsons_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$jsons_array_data.IndexOf($_) + 1}}, 
        @{label="JSON Name"; expression={$_.Name}}, 
        @{label="JSON File"; expression={$_.File}},
        @{label="Path"; expression={$_.Path}} -AutoSize
}

<#
    Get-Json("test")
    Get-JsonPath("test")
    Check-Json
    Read-Json("test")
    $jsons_array_data
#>
    List-Json
