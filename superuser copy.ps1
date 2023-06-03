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

# =============================== 1.Initializing Functions ==================================
#$su = $env:superuser # Fetch Json Path from the 'Environment Variable -> superuser_data
$ps = $su.Split("superuser")[0]
$su_file = Split-Path -Leaf $su
$su_name = $su_file.Split(".ps1")[0]
$su_json = "$( $su.Split(".ps1")[0] ).json"
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
    #$ascii_filepath = ReadJsonPath($asciiFilePath)
    #type  $ascii_filepath
}

function LoadData() {
    $Data_JSON = Get-Content -Raw -Path "$ps/superuser.json"
    $Data_DIR = $Data_JSON.directory.data

}

$JSON_SuperData  = ReadJson($su_json)

# JSON Files in the SuperUser's Data Directory 
$Data = @{
    "ascii"      = "$ps\data\ascii.json"
    "config"     = "$ps\data\.empty\config.json"
    "dir"        = "$ps\data\directories.json"
    "dependency" = "$ps\data\dependencies.json"
    "python"     = "$ps\data\python.json"
    "settings"   = "$ps\data\.empty\settings.json"
    "scripts"    = "$ps\data\scripts.json"
    "terminal"   = "$ps\data\terminal.json"
}

# =============================== 2.ACCESSING THE JSON CONTENT ==================================
# Read the JSON by call the function 'readJson()' and passing the value of the 'Json-path'
# $Ascii_JSON      = ReadJson($JSON_SuperData.file.dependency.ascii)
# $Dependency_JSON = ReadJson($JSON_SuperData.file.dependency.dependencies)

# $Python_JSON    = ReadJson($JSON_SuperData.file.dependency.python)
# $Script_JSON    = ReadJson($JSON_SuperData.file.dependency.scripts)
# $Terminal_JSON  = ReadJson($JSON_SuperData.file.dependency.terminal)

# Read the JSON by call the function 'readJson()' and passing the value of the 'Json-path'
$Ascii_JSON      = ReadJson($Data.ascii)
$Dependency_JSON = ReadJson($Data.dependency)
$Directory_JSON  = ReadJson($Data.dir)
$Python_JSON     = ReadJson($Data.python)
$Terminal_JSON   = ReadJson($Data.terminal)


# echo "Python_JSON : $Python_JSON "
# echo "Ascii_JSON : $Ascii_JSON "
# echo "Script_JSON : $Script_JSON "
# echo "Terminal_JSON : $Terminal_JSON "
# echo "Dependency_JSON : $Dependency_JSON "
# ===============================3. Declaring Global Variables =====================================
# Pass the argument to the function 'ReadJsonPath' to parse the json-pointers and return it with '$home' path
$su_ascii = ReadJsonpath($Ascii_JSON.ascii.script.superuser)
$Python_PATH = ReadJsonPath($Python_JSON.info.path) 

$total_dependency_to_include = $Dependency_JSON.profile.initialize.file.Length - 1
# ===============================4.BEGIN INITIALIZATION ==================================
Write-Host "|          " -ForegroundColor Cyan
Write-Host "├────SuperUser.ps1"
Write-Host "|    |     └────├ Initializing ] $su_name" -ForegroundColor Cyan
Write-Host "|    |          ├ INFO ] Function Name : ReadJson()" -ForegroundColor Yellow
Write-Host "|    |          ├ INFO ] Function Name : ReadJsonPath()" -ForegroundColor Yellow
# =============================== 4.LOAD THE SCRIPTS FROM JSON FILE ==================================
Write-Host "|    |          ├ JSON ] Loading Scripts From JSON File : dependencies.json" -ForegroundColor Yellow
if(Test-Path $su)
{
    echo "hi"
    for ($i = 0; $i -le $total_dependency_to_include; $i++) 
    {
      # Write-Host "|    |          ├  DEBUG ] Counting Total Objects : $i"
        $pathFromJson          = $Dependency_JSON.profile.initialize.file[$i].path
        $currentScriptFullPath = ReadJsonPath($pathFromJson)
        Write-Host "|    |          ├ Loaded ] $currentScriptFullPath " -ForegroundColor Cyan
        
        . $currentScriptFullPath # Loads the PowerSchell Scripts 
    }
        Write-Host "|    |          | " -ForegroundColor Cyan
        Write-Host "|    |          └──[ JSON ] Finished Loading Scripts From JSON File : dependencies.json" -ForegroundColor Yellow
    
} else { Write-Host "Looking For [ superuser.ps1 ] at $su" -ForegroundColor Red -BackgroundColor Black }

        Write-Host "|    |           " -ForegroundColor Cyan
# =============================== 4.DISPLAY ASCII SUPERUSER ==================================
. $su_ascii # Display the ASCII Superuser
# =============================== 5.SuperUser Terminated =====================================
        Write-Host "|    |" -ForegroundColor Cyan
        Write-Host "|    └───[ Status ]  Script Terminated -> superuser.ps1 " -ForegroundColor Cyan
        Write-Host "|    " -ForegroundColor Cyan
<#
  YELLOW - INFO
  CYAN   - LOADED/LOADING
  BLUE - Process
  GREEN(bg)/BLACK(fg) => Functions (Auto-Discover)
#>

