<# 
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| 0.Microsoft.Profile_profile.ps1
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    v1.0 | 26th March 2023
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------
.SYNOPSIS
    Microsoft.Profile_profile

.DESCRIPTION
    This PowerShell Script comprises the index of all the functions and alias for the window terminal
        
.LINK
    - My Github Repository                  (https://github.com/SanjeevStephan/superuser)
    - Microsoft Windows Terminal Repository (https://github.com/microsoft/terminal)
    - PowerShell v7+                        (https://github.com/PowerShell/PowerShell/releases/latest)
    - PowerShell-7.3.3-win-x64.zip          (https://github.com/PowerShell/PowerShell/releases/download/v7.3.3/PowerShell-7.3.3-win-x64.zip)
.NOTES
    .AUTHOR
        -> Sanjeev_Stephan_Murmu

    .VERSION 
        -> 1.0 | 26th March 2023

    .PROFILE_MAIN 
        -> Microsoft.PowerShell_profile.ps1
        -> include.ps1
        -> README.md

    .CONTAINS
        -> configuration
        -> dictionary
        -> dependencies        
        -> functions

    .FILE_TYPE
        -> powershell.ps1
        -> json_file.json
        -> markdown.md

.DIRECTORY_STRUCTURE
    $Home\Documents\PowerShell\
    ├───lost
    │   └───works-great-but-not-in-use
    ├───myfunctions
    │   └───parameterArgs
    ├───myjson/
        ├───.\dependencies.json
        ├───.\directories.json
        ├───.\myFunctions.json
        ├───.\myIncludes.json
        ├───.\myJsonList.json
        ├───.\myPythonScript.json
        ├───.\myScripts.json
        └───.\profileFunctions.json
    ├───mypython
        └───.\figlet.py    
    ├───myscripts
        └──────setEnv
               ├───.\argsAddVariableToEnv.ps1
               └───.\passArgsViaHashTable.ps1               
        ├───.\execScript.ps1
        ├───.\getDependencies.ps1
        ├───.\getFunction.ps1
        ├───.\getJson.ps1
        ├───.\getPath.ps1
        ├───.\getPython.ps1
        ├───.\getScript.ps1
        ├───.\setEnv.ps1
        └───.\setMyfunctions.ps1
    └───mytest
        └───env            

#-------------------- Must Include Below File --------------------------------------#>
. "$HOME\Documents\PowerShell\include_dependecies.ps1"
#-------------------- Functions {Read-Only}-------------------------------------

function initialize() {

    # $CHECKS[1]["Status"] = "enable"
    # $DEBUG[1]["Status"]  = "enable"

    if($CHECKS[1]["Status"] -eq "enable") { Check-File all } # Test-Path Of all the dependencies
    if($FEATURE[1]["Status"] -eq "enable") { & python "$HOME\Documents\PowerShell\mypython\figlet.py" --message $SETTINGS[1]["Value"] } 
    if($DEBUG[1]["Status"] -eq "enable") { Show-Config }     # initial_debug 
    Home # Change Directory 'cd' to $Home\Documents\PowerShell

 }

initialize  #calling the initialize() function 