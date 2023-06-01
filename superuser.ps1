<# 
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| superuser.ps1
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    v2.0 | 28th May 2023
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------                                                     
                                                    
.SYNOPSIS
    Control how the Microsoft.Profile_profile's script behaves

 .DESCRIPTION
    This PowerShell Script defines the rule for the profile's scripts that will be run on the 'PowerShell Terminal v.7.2.2 & above'      

.NOTES

 #>

# Defined the TAGs of the configuration file that contains additional dependencies settings & paths

# =============================== 1.ACCESSING THE JSON CONTENT ==================================


# Fetch Json Path from the 'Environment Variable -> superuser_data
#$su = $env:superuser_data
$su = $env:superuser
$ps = $su.Split("superuser")[0]
$su_name = Split-Path -Leaf $su

if(Test-Path $su) { Write-Host "[ Found ] $su_name at $su" -ForegroundColor Black -BackgroundColor Green } else {  Write-Host "[ MISSING ] $su_name at $su" -ForegroundColor Black -BackgroundColor Red ;}
function ReadJson($JsonFile) {
    $json_data = Get-Content -Raw -Path $JsonFile | ConvertFrom-Json
    return $json_data
}

function ReadJsonPath($JsonPointer) {
    $profile_home = $ps.Split("PowerShell")[0]
    $full_path = "$profile_home\$($JsonPointer)" 
    return $full_path
}

function DisplayASCII($asciiFilePath)
{
    $ascii_filepath = ReadJsonPath($asciiFilePath)
    type $ascii_filepath 
}

function LoadData() {
    $Data_JSON = Get-Content -Raw -Path "$ps/superuser.json"
    $Data_DIR = $Data_JSON.directory.data

}


# JSON Files in the SuperUser's Data Directory 
$Data = @{
    "ascii"      = "$ps\data\ascii.json"
    "config"     = "$ps\data\config.json"
    "dir"        = "$ps\data\directories.json"
    "dependency" = "$ps\data\dependencies.json"
    "settings"   = "$ps\data\settings.json"
}

# =============================== 2.DISPLAY THE ASCII TEXT ==================================
# Read the JSON by call the function 'readJson()' and passing the value of the 'Json-path'
#$Ascii_JSON = ReadJson($Data.ascii)
$Ascii_JSON = ReadJson($Data.ascii)
$Dependency_JSON = ReadJson($Data.dependency)
$Directory_JSON = ReadJson($Data.dir)

# # # Display Ascii-figlet Text "The Terminal"
DisplayASCII($Ascii_JSON.ascii.figlet.superuser)
DisplayASCII($Ascii_JSON.ascii.txt.directory_structure)

# =============================== 3.BEGIN INITIALIZATION ==================================
# Pass the argument to the function 'readPath' to parse the json-pointers and return it with '$home' path
Write-Host "[ INFO ] Function Name : ReadJson()" -ForegroundColor Yellow
Write-Host "[ INFO ] Function Name : ReadJsonPath()" -ForegroundColor Yellow
# initial run
$title = "SuperUser"
Write-Host "<-------------------{ Initializing $title }-------------------------->" -ForegroundColor Cyan

# =============================== 4.LOAD THE SCRIPTS FROM JSON FILE ==================================

$total_dependency_to_include = $Dependency_JSON.profile[0].file.Length - 1
# Write-Host "Counting Total Objects : $total_dependency_to_include"

if(Test-Path $su)
{
    for ($i = 0; $i -le $total_dependency_to_include; $i++) 
    {
        # Write-Host "[ DEBUG ] Counting Total Objects : $i"
        $pathFromJson          = $Dependency_JSON.profile[0].file[$i].path
        $currentScriptFullPath = ReadJsonPath($pathFromJson)
        Write-Host "[ Loaded ] $currentScriptFullPath " -ForegroundColor Cyan

        . $currentScriptFullPath
    }

} else { Write-Host "Looking For [ superuser.ps1 ] at $su" -ForegroundColor Red -BackgroundColor Black }






<#
  YELLOW - INFO
  CYAN   - LOADED/LOADING
  BLUE - Process
  GREEN(bg)/BLACK(fg) => Functions (Auto-Discover)
#>


