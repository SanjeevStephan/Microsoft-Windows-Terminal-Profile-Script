# Welcome PowerShell's [$uperUser](https://github.com/SanjeevStephan/superuser/blob/main/assets/log/welcome_log.txt)
> To The Windows Terminal, Console and Command-Line repository
```
 ____                        _   _
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| v1.0 | 26th March 2023
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    by Sanjeev Stephan Murmu
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|    https://github.com/SanjeevStephan/
            |_|

[ OK ] Profile Function => { profile_function.ps1 } Loaded Successfully
┌──(superuser㉿192.168.29.200)-[C:\Users\Sanju\Documents\PowerShell]
└─$ PS>                                 
```
## Index
* [Description](https://github.com/SanjeevStephan/superuser/blob/main/README.md#Description)
* [Directory Structure](https://github.com/SanjeevStephan/superuser/blob/main/README.md#Directory-Structure)
* [How to Setup](https://github.com/SanjeevStephan/superuser/blob/main/README.md#How-to-Setup)
* [How this Works](https://github.com/SanjeevStephan/superuser/blob/main/README.md#How-this-Works)
* [How to Contribute](https://github.com/SanjeevStephan/superuser/blob/main/README.md#How-to-Contribute)
* [Installing and running New Windows Terminal](https://github.com/SanjeevStephan/superuser/blob/main/README.md#Installing-and-running-New-Windows-Terminal)
* [Welcome Terminal Log](https://github.com/SanjeevStephan/superuser/blob/main/assets/log/welcome_log.txt)

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
> This PowerShell Repository comprises the index of **all the usefull functions and scripts** for the window terminal

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
    | File | Description | Explaination |
    |:---------:|:-----------|:---------:|
    | [Microsoft.PowerShell_profile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/Microsoft.PowerShell_profile.ps1)| Main PowerShell Profile File | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 
    | [TheConfigurationFile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/TheConfigurationFile.ps1) | Controls Settings  | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 
    | [profile_include.ps1](https://github.com/SanjeevStephan/superuser/blob/main/myautoscript/profile_include.ps1)  |  Includes all {*.ps1} files in the ./dependency directory  | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) |                     
    | [ProfileFunctions.ps1](https://github.com/SanjeevStephan/superuser/blob/main/ProfileFunctions.ps1)  |  Save your funtions here & execute directly on terminal   | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) |     
    | [The-Prompt.ps1](https://github.com/SanjeevStephan/superuser/blob/main/profileFunction/The-Prompt.ps1)  |  The SuperUser Prompt   | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 


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
    | dependencies.json | list of all the files that the profile depends on |
    | directories.json | index of all directories in-use |
    | myFunctions.json | list of simple but useful functions |
    | myIncludes.json | index of must-include dependencies |
    | myJsonList.json  | index of all json-file used |
    | myPythonScript.json | index of all the python-scripts in-use| 
    | myFileList.json | any refrerences files used |
    | profileFunctions.json | important profile functions used by other scripts|
    | myScripts.json | index of all the advanced scripts|     
        
* Sub-Directories
    | Directory | Description |
    |:-----:|:------:|
    | assets | contains profile's assets {cloned-github-repo,pics,syntax } |    
    | depnedency | contains all the scripts which the profile dependes upone |
    | myautoscripts | contains all the automated scripts |    
    | myfunctions | contains all the simple but useful functions to do certian tasks |    
    | myjson | contains json files lists|           
    | mypython | contains all the executable python scripts |
    | profileFunction | contains main functions used for by other scripts|       

# How to Setup
By Default PowerShell Executions is restricted for `CurrentUser`.
1. Firstly, PowerShell execution policy is required to be one of: Unrestricted, RemoteSigned or ByPass to execute the installer. For example:
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
2. Download **git** for terminal [click here](https://git-scm.com/downloads)
3. Open Terminal & navigate to User's home directory which is (C:\Users\\<username\>\Documents\)
```
cd $home\Documents
 ```
4. Clone the repository using *git clone*
 ```
 git clone https://github.com/SanjeevStephan/superuser.git
```
5. Now you will see a folder named SuperUser, renamed it to PowerShell
6. Restart the Terminal & start powerShell
```
 pwsh
```
7. If all the things went well you will be greeted by the terminal,similarly like this. [CLick here to see the log](https://github.com/SanjeevStephan/superuser/blob/main/assets/log/welcome_log.txt)

# How this Works?
> To know how this profile script works. Kindly [click here to read the docs](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md)


# How to Contribute 
> To know how you can contribute to this repository. Kindly [Click here](https://github.com/SanjeevStephan/superuser/blob/main/CONTRIBUTING.md)

# Installing and running New Windows Terminal

> Note: Windows Terminal requires Windows 10 2004 (build 19041) or later


## Prerequisites
* You must be running Windows 10 2004 (build >= 10.0.19041.0) or later to run Windows Terminal
* You must [enable Developer Mode in the Windows Settings app](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development) to locally install and run Windows Terminal 
* You must have [PowerShell 7 or later](https://github.com/PowerShell/PowerShell/releases/latest) installed
* You must have [Git](https://git-scm.com/downloads) installed
* You must have at least [VS 2022](https://visualstudio.microsoft.com/downloads/) installed or [Visual Studio Code](https://code.visualstudio.com/download) popularly known as VSCode
* You must install the [.NET Framework Targeting Pack](https://docs.microsoft.com/dotnet/framework/install/guide-for-developers#to-install-the-net-framework-developer-pack-or-targeting-pack) to build test projects
## LINK
* This Github Repository                  (https://github.com/SanjeevStephan/superuser)
* Microsoft Windows Terminal Repository (https://github.com/microsoft/terminal)
* PowerShell v7+                        (https://github.com/PowerShell/PowerShell/releases/latest)
* Download [PowerShell-7.3.3-win-x64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.3.3/PowerShell-7.3.3-win-x64.zip)
