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
. "$Home\superuser.ps1"
$myScriptJsonSource = $JSON.myScripts
# $myScriptJsonSource = Get-JsonPath("myScripts")
# $myScriptJsonSource = "$Home\Documents\PowerShell\myjson\myScript.json"

$scriptName        = $MyInvocation.MyCommand.Name
$scriptFullPath    = $MyInvocation.MyCommand.Path
$scriptExecutedBy  = Split-Path -Path $MyInvocation.ScriptName -Leaf
$invocationName    = $($MyInvocation.InvocationName)
$invocationLine    = "$($MyInvocation.Line)"
$invocationCommand = "$($MyInvocation.MyCommand)"

$storedScript_HashTable = @{
    "Script Name"        = "$scriptName "
    "Script Path"        = "$scriptFullPath"
    "JSON Path"          = "$myScriptJsonSource"
    "Function Called By" = "$scriptExecutedBy"
    "InvocationName"     = "$invocationName"
    "Invocation Line"    = "$invocationLine "
    "Invocation Command" = "$invocationCommand"
 }
 coreShowJSON($storedScript_HashTable)

<#
 Write-Host "[ INFO ] Invocation-Name    => { $invocationName } "     -ForegroundColor White 
 Write-Host "[ INFO ] Invocation-Line    => { $invocationLine } "     -ForegroundColor White 
 Write-Host "[ INFO ] Invocation-Command => { $invocationCommand } "     -ForegroundColor White 
#>

# Read the JSON data from the file
$script_json_raw_data = Get-Content -Path $myScriptJsonSource  -Raw

# Convert the JSON data to a PowerShell object
$script_array_data = ConvertFrom-Json -InputObject $script_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getScript by specifying Script name
function Get-Script($script_name)
{

    if($script_name)
    {
        # Filter 'Script-Name' in the array and store as $script_array_data
        $script_array_data = $script_array_data | Where-Object { $_.Name -eq $script_name }
        
        # Get the path to the Script based on its name
        $script_path = $($script_array_data.Path)

        # Check if the file exists before including it
        if (Test-Path $script_path){ return $script_array_data }
        else{ Write-Output "Error: $script_name not found in JSON List 'scripts.json"  }   
    } else { $script_array_data  }

}

function Check-Script(){

    foreach ($scripts in $script_array_data) {
        if (Test-Path $scripts.Path) {

            $scriptArray_HashTable = @{
                "Script Name" = "$($scripts.Name)"
                "Script Path" = "$($scripts.Path)"
            }

            

            Write-Host "[ OK ] Confirmed: '$($scripts.Name)' at $($scripts.Path)" -ForegroundColor White
        } else {
            Write-Host "[    ] Not found: $($scripts.File) at $($scripts.Path)" -ForegroundColor Red
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
            Default
            {
 
                $script_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$script_array_data.IndexOf($_) + 1}}, 
                @{label="Script File"; expression={$_.File}}, 
                @{label="Path"; expression={$_.Path}},
                @{label="Description"; expression={$_.Desc}} -AutoSize

            }
        }
 }

 List-Script

