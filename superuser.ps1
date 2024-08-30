<# 
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| superuser.ps1
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    v2.0 | 28th May 2023
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------        

                                                   
.SYNOPSIS
    Control how the SuperUser.ps1 script behaves when the Window's Terminal Loads.

 .DESCRIPTION
    This PowerShell Script defines the rule for the profile's scripts that will be run on the 'PowerShell Terminal v.7.2.2 & above'      

#>

$ps = $env:powershell
$su_json = "superuser.json"


function ReadJsonFileAtHome($JsonFile)
{
    $json_file_full_path = "$ps\$JsonFile"
    return Get-Content -Raw -Path $json_file_full_path | ConvertFrom-Json 
}


$MAIN_JSON_Data = ReadJsonFileAtHome("superuser.json")
$Total_Scripts_to_Execute = $MAIN_JSON_Data.dependency.initialize.script.Length 


Write-Host "|          " -ForegroundColor Cyan
Write-Host "|────SuperUser.ps1"
Write-Host "|    |     └────├ Initializing ] $su_name" -ForegroundColor Cyan
Write-Host "|    |          ├ INFO  ] Function Name : " -ForegroundColor Yellow -NoNewline
Write-Host "ReadJsonFileAtHome(`$JsonFile)" -ForegroundColor Green -BackgroundColor Black
Write-Host "|    |          ├ TOTAL ] Total ( $Total_Scripts_to_Execute ) to Execute from JSON File : " -ForegroundColor Yellow -NoNewline
Write-Host $su_json -ForegroundColor Green
Write-Host "|    |          ├ JSON  ] Loading Scripts From JSON File : " -ForegroundColor Yellow -NoNewline
Write-Host $su_json -ForegroundColor Green


# Checks if the $MAIN_JSON_Data is empty or not and take action based on that.
if([string]::IsNullOrEmpty($MAIN_JSON_Data)) 
{

}
else
{
    for($i = 0; $i -le $Total_Scripts_to_Execute -1 ; $i++)
    {
        $pathFromJson      =  $MAIN_JSON_Data.dependency.initialize.script[$i].path
        $jsonfile_fullpath =  $ps + $pathFromJson
        Write-Host "|    |          ├ Loaded ] $jsonfile_fullpath" -ForegroundColor Cyan

        . $jsonfile_fullpath

        Write-Host "|    |          | " -ForegroundColor Cyan

    }

    Write-Host "|    |          └──[ JSON ] Finished Loading Scripts From JSON File : " -ForegroundColor Yellow -NoNewline
    Write-Host " superuser.json" -ForegroundColor Green -BackgroundColor Black
}

    Write-Host "|    |" -ForegroundColor Cyan  
    Write-Host "|    └───[ Status ]  Script Terminated -> " -ForegroundColor Cyan -NoNewline
    Write-Host "Superuser.ps1" -ForegroundColor Green -BackgroundColor Black