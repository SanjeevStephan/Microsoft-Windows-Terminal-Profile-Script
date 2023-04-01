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
# Read the JSON data from the file 
# $directoryJsonPathSource = "$Home\Documents\PowerShell\myjson\directories.json"
$directoryJsonPathSource = "$Home\Documents\PowerShell\myjson\directories.json"

$scriptName     = $MyInvocation.MyCommand.Name
$scriptFullPath = $MyInvocation.MyCommand.Path
$scriptExecutedBy = Split-Path -Path $MyInvocation.ScriptName -Leaf

$storedScript_HashTable = @{
    "Script Name"        = "$scriptName "
    "Script Path"        = "$scriptFullPath"
    "JSON Path"          = "$directoryJsonPathSource"
    "Function Called By" = "$scriptExecutedBy"
    "InvocationName"     = "$invocationName"
    "Invocation Line"    = "$invocationLine "
    "Invocation Command" = "$invocationCommand"
 }
 coreShowJSON($storedScript_HashTable)

$paths_json_raw_data = Get-Content -Path $directoryJsonPathSource  -Raw

# Convert the JSON data to a PowerShell object
$paths_array_data = ConvertFrom-Json -InputObject $paths_json_raw_data 

#-------------------- Functions {Read-Only }--------------
# Function to getPath by specifying directory name
function Get-PathJson($directory_name)
{
    if($directory_name)
    {
        # Get the path to the directory based on its name
        $directory_path_data = $paths_array_data | Where-Object { $_.Name -eq $directory_name }
        $directory_path = $($directory_path_data.Path)

        Write-Output "Directory Name : $directory_name | Path $directory_path" 

        # Check if the file exists before including it
        if (Test-Path $directory_path){ return $directory_path_data }
        else{ Write-Warning "Error: $directory_name not found in the path : $directory_path" }
    } else { $paths_array_data }

}
function Get-Path($directory_name)
{
    if($directory_name)
    {
        # Get the path to the directory based on its name
        $directory_path_data = $paths_array_data | Where-Object { $_.Name -eq $directory_name }
        $directory_path = $($directory_path_data.Path)

        # Write-Output "Directory Name : $directory_name | Path $directory_path" 

        # Check if the file exists before including it
        if (Test-Path $directory_path){ return $directory_path }
        else{ Write-Error "Error: $directory_name not found in the path : $directory_path" }
    } else { $paths_array_data }

}
function Check-Path(){
    Write-Output "[ OK ] Dependency : getPath.ps1 => Included { 5 } Functions  Successfully"
    foreach ($paths in $paths_array_data) {
        if (Test-Path $paths.Path) {
            Write-Host "[ OK ] Confirmed: $($paths.Directory) at $($paths.Path)"
        } else {
            Write-Warning "[    ] Not found: $($paths.Directory) at $($paths.Path)"
        }
    }

}
function Check-ThisPath($directory_path) { if(Test-Path $directory_path) { Write-Output "Yes! This path exists at : $directory_path"} else { Write-Warning "Sorry! This Path Doesn't exists"}}
function Get-Path($directory_name)
{
    if($directory_name)
    {
        # Get the path to the directory based on its name
        $directory_path_data = $paths_array_data | Where-Object { $_.Name -eq $directory_name }
        $directory_path = $($directory_path_data.Path)

        Write-Output "Directory Name : $directory_name | Path $directory_path" 

        # Check if the file exists before including it
        if (Test-Path $directory_path){ return $directory_path }
        else{ Write-Error "Error: $directory_name not found in the path : $directory_path" }
    }
    else { $paths_array_data } 

    
}
function Get-to-the-Directory($index)
{ 
    if(ispythoninstalled -eq $true){ Figlet $dir_name}
    List-Path
    $index = Read-Host "Which directory you want to go (1+N) :"
    cd $paths_array_data[$index - 1].Path 
}


function Get-FileName($file_fullpath) {
    # $getfileName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    $getfileName = Split-Path -Path $file_fullpath -Leaf
    #Write-Host "The caller's script file name is: $getfileName"
    return $getfileName
}
function Is-Available($full_path)
{
    $storeStatus = @{
        "Status" =  "[ No Status Changed ]"
        "IsAvailable" = "No Changes Made"
    }

    if(Test-Path $full_path) 
    {
        $storeStatus["Status"] = "[ OK ]"
        $storeStatus["IsAvailable"] = "Available"
    } 
    else 
    {
        $storeStatus["Status"] = "[    ]"
        $storeStatus["IsAvailable"] = "Not Available"
    }
    return $storeStatus
}
# Function to filter data from the JSON File 'functions.json' based on the specified '$column_name
function List-Path($column_name){
    <#
       Function to display only specified '$column_name' 
    #>
    
        switch($column_name)
        {
    
            "name"
            {
                if($($TABLE[2]["Status"]) -eq "enable") 
                {   
                    $paths_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$paths_array_data.IndexOf($_) + 1}}, 
                    @{label="Name"; expression={$_.Name}}, 
                    @{label="Path"; expression={$_.Path}},
                    @{label="Description"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
            }
            "desc"
            {
                if($($TABLE[2]["Status"]) -eq "enable") 
                {   
                    $paths_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$paths_array_data.IndexOf($_) + 1}}, 
                    @{label="Directory"; expression={$_.Directory}},
                    @{label="Description"; expression={$_.Desc}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }        
            }
    
            "path"
            {
                if($($TABLE[2]["Status"]) -eq "enable") 
                {   
                    $paths_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$paths_array_data.IndexOf($_) + 1}}, 
                    @{label="Directory"; expression={$_.Directory}},
                    @{label="Path"; expression={$_.Path}} -AutoSize
                } 
                else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
            }
            Default
            {
                $paths_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$paths_array_data.IndexOf($_) + 1}}, 
                @{label="Directory"; expression={$_.Name}}, 
                #@{label="Directory"; expression={$_.Directory}},
                @{label="Path"; expression={$_.Path}},
                @{label="Description"; expression={$_.Desc}} -AutoSize
            }
        }
 }

 <#
  cd $paths_array_data[$index - 1].Path

     Get-PathJson("terminal")
     Get-Path("powershell")
     Check-Path("powershell")
     Check-ThisPath
     Get-FileName("C:\Users\Sanju\Documents\PowerShell\profile_config.ps1")
     Is-Available("C:\Users\Sanju\Documents\PowerShell\profile_config.ps1")
     Read-Json("test")
     $paths_array_data
 #>
    List-Path
 