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
        -> 2.0 | 28th May 2023

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
    ├───assets
    │   └───tools
    ├───data
    |    |──────ascii
    |    |       ├───.\script
    |    |       └───.\text   
    |    ├───.\ascii.json
    |    ├───.\config.json
    |    ├───.\directories.json
    |    ├───.\files.json
    |    ├───.\settings.json
    |    └───.\source.json
    ├───profile
    |    ├───.\auto
    |    |       ├───.\Auto-Discover.ps1
    |    |       ├───.\discover_cmdlets.ps1
    |    |       ├───.\discover_dependency.ps1
    |    |       └───.\discover_functions.ps1 
    |    ├───.\cmdlets
    |    ├───.\dependency
    |    ├───.\functions
    |    └───.\prompt
    |            ├───.\Superuser-Prompt.ps1
    |            └───.\The-Prompt.ps1 
    ├───mypython
    |    └───.\figlet.py    
    └───mytest
        └───env            
#-------------------- Must Include Below File --------------------------------------#>

. $env:superuser

