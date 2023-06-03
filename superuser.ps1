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

#This Function : ReadJson() takes [ Path-to-Json-File ] as argument
#And Returns : the Whole JSON Object
function ReadJson($JsonFile) {
    $json_data = Get-Content -Raw -Path $JsonFile | ConvertFrom-Json
    return $json_data
}
# This Function : ReadJsonPath() takes takes the-path-from-the-json-file 
# which consists something like this : PowerShell\\data\ascii.json and 
# Returns the Full-Path such as : C:\\Users\\<Username>\\OneDrive\\Documents\\ + PowerShell\\data\\\ascii.json
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

function LoadSuperData() { return Get-Content -Raw -Path $su_json | ConvertFrom-Json }

# =============================== 2.ACCESSING THE JSON CONTENT ==================================
# Break-down of the below code
<#
    0. First We Supplied the Function : ReadJSON() with the path-to-the-json-file name 'superuser.json'
        and Stored in the Variable named : $JSON_SuperData
        Which returns the JSON-OBJECT (means -> data consisting of KEY:VALUE Pairs )
#>   $JSON_SuperData  = LoadSuperData
<#
    1. $JSON_SuperData.file.dependency.ascii
        -> $JSON_SuperData is a Json Object & When we use (.) we are basically
         
        saying that go-inside-this-JSON-Object and and fetch the value by pointing it using they KEY.
        Which in this case will be 
        Go-inside-the JSON_Object => $JSON_SuperData -> file -> dependency -> ascii (grab-the-value-of-ascii) 
    2. Get The Value from the KEY (ascii)

        TYPE This in Console -> echo $JSON_SuperData.file.dependency.ascii
        You'll Get -> PowerShell\data\ascii.json

    3. Now are have the VALUE from our KEY (ascii)
        the value we have is incomplete and we cannot access the json-file with it.
        We have to use another function named : ReadJsonFile() 
        which takes (the path-value-from-above-step) and 
        Add the $home directory path to it which is : C:\\Users\\<Username>\\OneDrive\\Documents
        And Returns the Full-Path...
    4. Which we later on supplied again to the Function : ReadJson()
        and gets the JSON_Objects for the file we supplied the path for!
    5. Now we can grab the Value by Accessing using the STEP:1 Method.
        such as 
       TYPE This in Console -> echo $Ascii_JSON.ascii.script.superuser
       
#>

$Ascii_JSON      = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.ascii))
#$Dependency_JSON = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.dependencies))
$Directory_JSON  = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.directories))
$Python_JSON     = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.python))
$Script_JSON     = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.scripts))
$Terminal_JSON   = ReadJson(ReadJsonPath($JSON_SuperData.file.dependency.terminal))

# ===============================3. Declaring Global Variables =====================================
# Pass the argument to the function 'ReadJsonPath' to parse the json-pointers and return it with '$home' path
$su_ascii = ReadJsonpath($Ascii_JSON.ascii.script.superuser)
$Python_PATH = ReadJsonPath($Python_JSON.info.path) 

$total_dependency_to_include = $JSON_SuperData.file.initialize.file.Length - 1
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
    for ($i = 0; $i -le $total_dependency_to_include; $i++) 
    {
      # Write-Host "|    |          ├  DEBUG ] Counting Total Objects : $i"
        $pathFromJson          = $JSON_SuperData.file.initialize.file[$i].path
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
  CYAN   - LOADED/LOADING/SOMETHING Happening
  BLUE - Process
  GREEN(bg)/BLACK(fg) => Functions (Auto-Discover)
#>

