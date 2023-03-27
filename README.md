# PowerShell's $uperUser
```
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| Microsoft.Profile_profile.ps1
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    v1.0 | 26th March 2023
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------
```

### SYNOPSIS
    Microsoft.Profile_profile

## DESCRIPTION
    This PowerShell Script comprises the index of all the functions and alias for the window terminal

## PREREQUISITES
        -You must be running Windows 10 2004 (build >= 10.0.19041.0) or later to run Windows Terminal
        -You must enable Developer Mode in the Windows Settings app to locally install and run Windows Terminal (https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development)
        -You must have PowerShell 7 or later installed (https://github.com/PowerShell/PowerShell/releases/latest)
        -You must have at least VS 2022 installed (https://visualstudio.microsoft.com/downloads/)
        -You must install the .NET Framework Targeting Pack to build test projects (https://docs.microsoft.com/dotnet/framework/install/guide-for-developers#to-install-the-net-framework-developer-pack-or-targeting-pack)
        
## LINK
    - My Github Repository                  (https://github.com/SanjeevStephan/superuser)
    - Microsoft Windows Terminal Repository (https://github.com/microsoft/terminal)
    - PowerShell v7+                        (https://github.com/PowerShell/PowerShell/releases/latest)
    - PowerShell-7.3.3-win-x64.zip          (https://github.com/PowerShell/PowerShell/releases/download/v7.3.3/PowerShell-7.3.3-win-x64.zip)

## NOTES

### AUTHOR
        -> Sanjeev_Stephan_Murmu

### VERSION 
        -> 1.0 | 26th March 2023

### PROFILE_MAIN 
        -> Microsoft.PowerShell_profile.ps1
        -> include.ps1
        -> README.md

### SCRIPT
        -> profile_config.ps1
        -> profile_include.ps1
        -> profile_exec_script.ps1
        -> profile_function.ps1
        -> profile_getDependencies.ps1
        -> profile_getFunction.ps1
        -> profile_getJson.ps1
        -> profile_getPath.ps1
        -> profile_getScript.ps1

### JSON
        -> dependencies.json
        -> directories.json
        -> functions.json
        -> include.json
        -> jsons.json
        -> scripts.json
        
### DIRECTORY
        -> myfunctions
        -> myscripts
        -> mytest       

### CONTAINS
        -> configuration
        -> dictionary
        -> dependencies        
        -> paths
        -> variables
        -> functions

### FILE_TYPE
        -> powershell.ps1
        -> json_file.json
        -> markdown.md




#-------------------- Must Include Below File --------------------------------------#>
```
. "$HOME\Documents\PowerShell\include.ps1"
```
#-------------------- Functions {Read-Only}-------------------------------------

