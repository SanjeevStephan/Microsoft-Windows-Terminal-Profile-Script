<# 
 ____             __ _ _         ____             __ _       
|  _ \ _ __ ___  / _(_) | ___   / ___|___  _ __  / _(_) __ _ 
| |_) | '__/ _ \| |_| | |/ _ \ | |   / _ \| '_ \| |_| |/ _` |
|  __/| | | (_) |  _| | |  __/ | |__| (_) | | | |  _| | (_| | 1.profile_config.ps1
|_|   |_|  \___/|_| |_|_|\___|  \____\___/|_| |_|_| |_|\__, | v1.0 | 26th-March-2023
                                                       |___/  

                                                    
.SYNOPSIS
    Control how the Microsoft.Profile_profile's script behaves

 .DESCRIPTION
    This PowerShell Script defines the rule for the profile's scripts that will be run on the 'PowerShell Terminal v.7.2.2 & above'      

.NOTES

 #>

# Defined the TAGs of the configuration file that contains additional dependencies settings & paths

function ReadJson($JsonFile) {
    $json_data = Get-Content -Raw -Path $JsonFile | ConvertFrom-Json
    return $json_data
}

function ReadJsonPath($JsonPointer) {
    $profile_home = "$home\OneDrive\Documents"

    $full_path = "$profile_home\$($JsonPointer)" 

    # Write-Host "[ From-JSON ] File Path : $full_path" -ForegroundColor Cyan
    return $full_path
}

# Fetch Json Path from the 'Environment Variable -> superuser_data
$su = $env:superuser_data
# JSON Files in the SuperUser's Data Directory 
$Data = @{
    "ascii"   = "$su\ascii.json"
    "config"   = "$su\config.json"
    "dir"      = "$su\directories.json"
    "files"    = "$su\files.json"
    "settings" = "$su\settings.json"
}
# Read the JSON by call the function 'readJson()' and passing the value of the 'Json-path'
$Ascii_JSON = ReadJson($Data.ascii)
$Files_JSON = ReadJson($Data.files)

# # # Display Ascii-figlet Text "The Terminal"
$ascii_terminal = ReadJsonPath($Ascii_JSON.ascii.text.file[1].path) 
type $ascii_terminal

# Pass the argument to the function 'readPath' to parse the json-pointers and return it with '$home' path
Write-Host "[ INFO ] Function Name : ReadJsonPath()" -ForegroundColor Yellow
Write-Host "[ INFO ] Function Path : superuser.ps1"  -ForegroundColor Yellow

$the_prompt_ps1 = ReadJsonPath($Files_JSON.profile[1].file.the_prompt)

$total_files_to_include = $Files_JSON.profile[0].file.Length - 1
# Write-Host "Counting Total Objects : $total_files_to_include"

# initial run
$title = "SuperUser"
Write-Host "<-------------------{ Initializing $title }-------------------------->" -ForegroundColor Cyan

    for ($i = 0; $i -le $total_files_to_include; $i++) 
    {
        # Write-Host "[ DEBUG ] Counting Total Objects : $i"
        $pathFromJson          = $Files_JSON.profile[0].file[$i].path
        $currentScriptFullPath = ReadJsonPath($pathFromJson)
        Write-Host "[ Loaded ] $currentScriptFullPath " -ForegroundColor Cyan

        . $currentScriptFullPath
    }




<#
  YELLOW - INFO
  CYAN   - LOADED/LOADING
  BLUE - Process
  GREEN(bg)/BLACK(fg) => Functions (Auto-Discover)
#>


