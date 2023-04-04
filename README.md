# Welcome PowerShell's $uperUser
> To The Windows Terminal, Console and Command-Line repository
```
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| Microsoft.Profile_profile.ps1
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    v1.0 | 26th March 2023
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------
```

## SYNOPSIS
> Microsoft Window Terminal Profile : SuperUser

### Author
> Sanjeev_Stephan_Murmu

### Version 
| Version | Release Date |
|:---------:|:-----------|
| v1.0 | 26th March 2023 |
|      |                 |

## Description
> This PowerShell Repository comprises the index of all the usefull functions and scripts for the window terminal

_This repository contains_ :
* configuration
* dictionary
* dependencies        
* paths
* variables
* functions
* file-Types
    | File | Extension |
    |:---------:|:-----------|
    | Powershell-script| ps1 |
    | JSON-file    |   json  |
    | Markdown     |    md   |

### Directory Structure
* Main 
    | File | Description |
    |:---------:|:-----------|
    | [Microsoft.PowerShell_profile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/Microsoft.PowerShell_profile.ps1)| Main PowerShell Profile File |
    | [TheConfigurationFile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/TheConfigurationFile.ps1) | Controls Settings  |
    | [profile_include.ps1](https://github.com/SanjeevStephan/superuser/blob/main/myautoscript/profile_include.ps1)  |  Includes all {*.ps1} files in the ./dependency directory |    
    | [ProfileFunctions.ps1](https://github.com/SanjeevStephan/superuser/blob/main/ProfileFunctions.ps1)  |  Save your funtions here & execute directly on terminal  |    
    | [The-Prompt.ps1](https://github.com/SanjeevStephan/superuser/blob/main/profileFunction/The-Prompt.ps1)  |  The SuperUser Prompt  |


* Dependencies
    | Profile-File | Description |
    |:---------:|:-------:|
    | TheCommands | | 
    | Get-Dir | | 
    | ASCIIFiglet | | 
    | IsPythonInstalled | | 
    | AllImportantFunc|  | 
    | getColorSchema.ps1 |  | 
    | getCoreDebug.ps1 | | 
    | getDependencies.ps1 | fetch directory path from 'directories.json' by directory name | 
    | getFunction.ps1 | | 
    | getJson.ps1 |  | 
    | getPath.ps1 | | 
    | getPython.ps1 | fetch directory path from 'directories.json' by directory name | 
    | getScript.ps1 | | 
    | setAllProfileFunctions.ps1 |  | 
    | setMyfunctions.ps1 | | 
    
* JSON
    | JSON-File | Description |
    |:---------:|:-------:|
    | dependencies.json | list of all the files that makes up the profile  |
    | directories.json | index of all directories in-use |
    | functions.json | list of useful functions |
    | include.json | index of must-include dependencies |
    | jsons.json  | index of all json-file used |
    | scripts.json | index of all the scripts in-use| 
        
* Sub-Directories
    | Directory | Description |
    |:-----:|:------:|
    | myfunctions | contains all the function in-use |
    | myscripts | contains all the executable complex scripts |
    | mytest | contains files used for testing purpose |       



# Installing and running Windows Terminal

> Note: Windows Terminal requires Windows 10 2004 (build 19041) or later


## Prerequisites
* You must be running Windows 10 2004 (build >= 10.0.19041.0) or later to run Windows Terminal
* You must [enable Developer Mode in the Windows Settings app](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development) to locally install and run Windows Terminal 
* You must have [PowerShell 7 or later](https://github.com/PowerShell/PowerShell/releases/latest) installed
* You must have at least [VS 2022](https://visualstudio.microsoft.com/downloads/) installed
* You must install the [.NET Framework Targeting Pack](https://docs.microsoft.com/dotnet/framework/install/guide-for-developers#to-install-the-net-framework-developer-pack-or-targeting-pack) to build test projects
## LINK
* This Github Repository                  (https://github.com/SanjeevStephan/superuser)
* Microsoft Windows Terminal Repository (https://github.com/microsoft/terminal)
* PowerShell v7+                        (https://github.com/PowerShell/PowerShell/releases/latest)
* Download [PowerShell-7.3.3-win-x64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.3.3/PowerShell-7.3.3-win-x64.zip)

## NOTES

> Must [Include Below File](https://github.com/SanjeevStephan/superuser/blob/main/include.ps1) in [Microsoft.Profile_profile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/Microsoft.PowerShell_profile.ps1)
```
. "$HOME\Documents\PowerShell\include.ps1"
```
