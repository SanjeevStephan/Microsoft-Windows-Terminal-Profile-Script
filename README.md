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

### SYNOPSIS
> Microsoft.Profile_profile

## Description
> This PowerShell Repository comprises the index of all the usefull functions and scripts for the window terminal

### Author
> Sanjeev_Stephan_Murmu

### Version 
| Version | Release Date |
|:---------:|:-----------|
| v1.0 | 26th March 2023 |
|      |                 |


#
This repository contains :
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

## Directory Structure
### Main 
    | File | Description |
    |:---------:|:-----------|
    | Microsoft.PowerShell_profile.ps1| Main Profile File |
    | include.ps1 |  Read dependencies from JSON and Include it  |
    | config.ps1  |  Controls how the Scripts Behaves   |    
    | README.md   |  This Readme file   |


### Dependencies
    * profile_config.ps1
    * profile_include.ps1
    * profile_exec_script.ps1
    * profile_function.ps1
    * profile_getDependencies.ps1
    * profile_getFunction.ps1
    * profile_getJson.ps1
    * profile_getPath.ps1
    * profile_getScript.ps1

* JSON
    * dependencies.json
    * directories.json
    * functions.json
    * include.json
    * jsons.json
    * scripts.json
        
* Sub-Directories
    * myfunctions
    * myscripts
    * mytest       



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

x



> Must Include Below File 
```
. "$HOME\Documents\PowerShell\include.ps1"
```
