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
if($DEBUG[4]["Status"] -eq "enable"){ Write-Output "[ OK ] Check-Script()    => { getScript.ps1 } Loaded Successfully"} 
   
# Read the JSON data from the file
$script_json_raw_data = Get-Content -Path $JSON[6]["Path"]  -Raw

# Convert the JSON data to a PowerShell object
$script_array_data = ConvertFrom-Json -InputObject $script_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getScript by specifying Script name
function GET-SCRIPT($script_name)
{
    # Filter 'Script-Name' in the array and store as $script_array_data
    $script_array_data = $script_array_data | Where-Object { $_.Name -eq $script_name }
    
    # Get the path to the Script based on its name
    $script_path = $($script_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $script_path){ return $script_array_data }
    else{ Write-Output "Error: $script_name not found in JSON List 'scripts.json"  }   
}

function Check-Script(){
    
    foreach ($scripts in $script_array_data) {
        if (Test-Path $scripts.Path) {
            Write-Output "[ OK ] Confirmed: '$($scripts.Name)' at $($scripts.Path)"
        } else {
            Write-Output "[    ] Not found: $($scripts.File) at $($scripts.Path)"
        }
    }

}


# Function to filter data from the JSON File 'functions.json' based on the specified '$column_name
function List-Script($column_name){
    <#
       Function to display only specified '$column_name' 
    #>
    
        switch($column_name)
        {
            "name"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script Name"; expression={$_.Name}}, 
                    @{label="What does it do ?"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }  
            }    
            "file"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script File"; expression={$_.File}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }  
            }
            "desc"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script File"; expression={$_.File}}, 
                    @{label="Description"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }           
            }
    
            "path"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script File"; expression={$_.File}}, 
                    @{label="Path"; expression={$_.Path}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
            }
            "basic"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script File"; expression={$_.Path}},
                    @{label="Description"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
            }
            "all"
            {
                if($($TABLE[3]["Status"]) -eq "enable") 
                {  
                    $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                    @{label="Script File"; expression={$_.File}}, 
                    @{label="Path"; expression={$_.Path}},
                    @{label="Description"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
            }
            Default {}
        }
        return $true
 }

 # getScript("test")    # <-------------- NOTE-2 : TO RUN THIS SCRIPT | UNCOMMENT 
 # List-Script          # <-------------- NOTE-3 : TO RUN THIS SCRIPT | UNCOMMENT 