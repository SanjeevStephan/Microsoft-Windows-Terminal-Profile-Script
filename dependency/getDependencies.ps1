<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    Script to getDependencies other PowerShell dependencies as dependencies

.DESCRIPTION
    Execute the script_files that are 'getDependenciesd' in this 'profile_getDependencies.ps1' script

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_getDependencies.ps1
    VERSION
        -v1.0    

#-------------------- getDependencies.ps1 --------------------------------------#>
# Read the JSON data from the file $PATH[3]["Path"]
$dependencies_json_source = "$Home\Documents\PowerShell\myjson\dependencies.json"

coreShowJSON($dependencies_json_source)

$dependencies_json_raw_data = Get-Content -Path $dependencies_json_source -Raw

# Convert the JSON data to a PowerShell object
$dependencies_array_data = ConvertFrom-Json -InputObject $dependencies_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getDependencies by specifying Script name
function Get-Profile($dependencies_name)
{
    # Filter 'Script-Name' in the array and store as $dependencies_array_data
    $dependencies_array_data = $dependencies_array_data | Where-Object { $_.Name -eq $dependencies_name }
    
    # Get the path to the Script based on its name
    $dependencies_path = $($dependencies_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $dependencies_path){ return $dependencies_array_data }
    else{ 
        Write-Output "Error: $dependencies_name not found in JSON List 'dependencies.json"  
        List-Profile
        }   
}
function Check-Profile(){

    Write-Output "[ OK ] Dependency : getDependencies.ps1 => Included { 3 } Functions Successfully"
    foreach ($dependency in $dependencies_array_data) {
        if (Test-Path $dependency.Path) {
            Write-Output "[ OK ] Confirmed: $($dependency.File) at $($dependency.Path)"
        } else {
            Write-Host "[    ] Not found: $($dependency.File) at $($dependency.Path)" -ForegroundColor Red
        }
    }

}
# Function to display all script specified in the JSON File 'dependencies.json'
function List-Profile()
{
    $dependencies_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$dependencies_array_data.IndexOf($_) + 1}}, 
    @{label="Name"; expression={$_.Name}}, 
    @{label="File"; expression={$_.File}},
    @{label="Path"; expression={$_.Path}} -AutoSize

}


List-Profile
