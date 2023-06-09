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
        -> superuser.ps1
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

# Fetch Path From Environment-Variables
$su = $env:superuser 
$github = "$($env:OneDrive)\Documents\GitHub"
$autoinstaller = "$github\autoinstaller"

# Verify 'superuser.ps1' exists on the path '$env:superuser'
if([string]::IsNullOrEmpty($su))
{

    Write-Host "[ Missing ] Superuser.ps1 " -ForegroundColor Black -BackgroundColor Red -NoNewline
    Write-Host " Add " -ForegroundColor Black -BackgroundColor Cyan -NoNewline
    Write-Host " Key { superuser } to the Environment Variable " -ForegroundColor Black -BackgroundColor  Green
    
     if(Test-Path $autoinstaller)
     {
        type "$autoinstaller\setup.instructions"
        cd $autoinstaller
     }
     else 
     {

        Write-Host "[ Missing ] setup.instructions " -ForegroundColor Black -BackgroundColor Red -NoNewline
        Write-Host " At " -ForegroundColor Black -BackgroundColor Cyan -NoNewline
        Write-Host "{ $autoinstaller }" -ForegroundColor Black -BackgroundColor  Green

        # $autoinstaller_repository = ""
        # Invoke-Expression "winget install --id Git.Git --source winget"
        # cd $github
        # Invoke-Expression "git clone $autoinstaller_repository"
     }

} else 
{  

    if(Test-Path $su) 
    {
        Write-Host "[ Found ] Superuser.ps1 at $su" -ForegroundColor Black -BackgroundColor Green
        Write-Host "Microsoft.PowerShell_profile.ps1"
        . $su 
    } 
    else { Write-Host "[ MISSING ] $su_name at $su" -ForegroundColor Black -BackgroundColor Red }

    Write-Host "└────────[ Status ]  Script Terminated -> Microsoft.PowerShell_profile.ps1 " -ForegroundColor Cyan

}