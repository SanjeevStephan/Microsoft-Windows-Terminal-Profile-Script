<#
 ____  _           _               ___        __
|  _ \(_)___ _ __ | | __ _ _   _  |_ _|_ __  / _| ___
| | | | / __| '_ \| |/ _` | | | |  | || '_ \| |_ / _ \
| |_| | \__ \ |_) | | (_| | |_| |  | || | | |  _| (_) |
|____/|_|___/ .__/|_|\__,_|\__, | |___|_| |_|_|  \___/
            |_|            |___/

.SYNOPSIS
    Display the Script Info & Json File Info.

.DESCRIPTION
    -> argsno : 5

.EXAMPLE
    .\display_script_info.ps1 -file "settingss.json" -location "somewhere\\in\\appdata\\local"
    .\display_script_info.ps1 -jsonFile "settings.json" -jsonLocation "appdata\\local\\programs\\Microsoft.NewTerminal_*\\localstate\\setting.json" -scriptFile ".\display_script_info.ps1" -scriptDesc "Display Script - Json FIle Info"
.OUTPUTS
|    |          |        |    |     ├──[ JSON ] File : settings.json
|    |          |        |    |     ├──[ JSON ] Location : appdata\\local\\programs\\Microsoft.NewTerminal_*\\localstate\\setting.json
|    |          |        |    |     ├──[ SCRIPT ] File : .\display_script_info.ps1
|    |          |        |    |     ├──[ SCRIPT ] Location :
|    |          |        |    |     ├──[ SCRIPT ] DESCRIPTION : Display Script - Json FIle Info
.NOTES
    -> Created On : 3rd June 2023
    -> By Author : Sanjeev Stephan Murmu
#>

param (
    [string]$jsonFile,
    [string]$jsonLocation,
    [string]$scriptFile,
    [string]$scriptLocation,
    [string]$scriptDesc
)

Write-Host "|    |          |        |    |     ├──[ JSON ] File : $jsonFile" -ForegroundColor Yellow 
Write-Host "|    |          |        |    |     ├──[ JSON ] Location : $jsonLocation" -ForegroundColor Yellow  
Write-Host "|    |          |        |    |     ├──[ SCRIPT ] File : $scriptFile" -ForegroundColor Yellow  
Write-Host "|    |          |        |    |     ├──[ SCRIPT ] Location : $scriptLocation" -ForegroundColor Yellow  
Write-Host "|    |          |        |    |     ├──[ SCRIPT ] DESCRIPTION : $scriptDesc" -ForegroundColor Yellow  

