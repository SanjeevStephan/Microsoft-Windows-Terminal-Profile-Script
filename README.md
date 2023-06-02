# Welcome PowerShell's [$uperUser](https://sanjeevstephan.github.io/superuser/)
> To The Windows Terminal, Console and Command-Line repository
```
 ____                        _   _
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| v2.0 | 30th May 2023
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
| v2.0 | 30th May 2023 |
|      |                 |

## Description
> This PowerShell Repository comprises the index of **all the usefull functions and scripts** for the window terminal

### Directory Structure
* Main 
    | File | Description | Explaination |
    |:---------:|:-----------|:---------:|
    | [Microsoft.PowerShell_profile.ps1](https://github.com/SanjeevStephan/superuser/blob/main/Microsoft.PowerShell_profile.ps1)| Main PowerShell Profile File | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 
    | [superuser.ps1](https://github.com/SanjeevStephan/superuser/blob/main/TheConfigurationFile.ps1) | Controls Settings  | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 
    | [Auto-Discover.ps1](https://github.com/SanjeevStephan/superuser/blob/main/myautoscript/profile_include.ps1)  |  Includes all {*.ps1} files in the ./dependency directory  | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) |                     
    | [The-Prompt.ps1](https://github.com/SanjeevStephan/superuser/blob/main/profileFunction/The-Prompt.ps1)  |  The SuperUser Prompt   | [ReadMe](https://github.com/SanjeevStephan/superuser/blob/main/mydocs/readme.md) | 

### For In-Detail Explaination | Please refer to [My Detailed Guide](https://sanjeevstephan.github.io/superuser/)

# How to Setup
By Default PowerShell Executions is restricted for `CurrentUser`.
1. Firstly, PowerShell execution policy is required to be one of: Unrestricted, RemoteSigned or ByPass to execute the installer. For example:
```
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
### For Windows 11 
2. Install Git From Terminal via Winget tool 
Install [winget tool](https://docs.microsoft.com/en-us/windows/package-manager/winget) if you don't already have it, then type this command in command prompt or Powershell.
```
winget install --id Git.Git -e --source winget
```
3.Install PowerShell using Winget (recommended) <br/>
The following commands can be used to install PowerShell using the published winget packages:
```
winget search Microsoft.PowerShell
```
4. You'll get Output below like this
```
Name               Id                           Version Source
---------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.3.4.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.4.0.3 winget
```
5. Now Install PowerShell or PowerShell Preview using the id parameter
```
winget install --id Microsoft.Powershell --source winget
```
or 
```
winget install --id Microsoft.Powershell.Preview --source winget
```
Note : You have to execute any one of the command and not both <br/>
You should the success message like this below
```
Found PowerShell [Microsoft.PowerShell] Version 7.3.4.0
This application is licensed to you by its owner.
Microsoft is not responsible for, nor does it grant any licenses to, third-party packages.
Successfully verified installer hash
Starting package install...
Successfully installed
```
6. Verify The Powershell Installation by checking its version using below command
```
$PSVersionTable
```
### Downloading & Installing SuperUser Script
7. Open Terminal & navigate to User's home directory <br/>
```
    For Windows 11 : C:\Users\<username>\OneDrive\Documents\
    For Windows 10 : C:\Users\<username>\Documents\
```
Using Below Command
```
cd $home\OneDrive\Documents\
 ```
8. Now Clone the "superuser' repository using bellow command
 ```
 git clone https://github.com/SanjeevStephan/superuser.git
```
9. Now you will see a folder named SuperUser, renamed it to PowerShell
```
mv superuser PowerShell
```
10. Open *Environment Variable* using below Command
```
rundll32.exe sysdm.cpl,EditEnvironmentVariables
```
11. Add a new environment-variable named  <br/>
Key #1
```
        Key : superuser 
        Value : C:\Users\<Username>\OneDrive\Documents\PowerShell\superuser.ps1
```
Key #2
```
        Key : superuser_data
        Value : C:\Users\<Username>\OneDrive\Documents\PowerShell\data
```
Key #3
```
        Key : superuser_profile
        Value : C:\Users\<Username>\OneDrive\Documents\PowerShell\profile
```
12.  Now Restart the Terminal & switch to powerShell 7
13.  Check if the system recognize the 'environment-variable' we just added
```
 echo $env:superuser
 echo $env:superuser_data
 echo $env:superuser_profile
```
11. If all the things went well you will be greeted by the terminal,similarly like this. [CLick here to see the log](https://github.com/SanjeevStephan/superuser/blob/main/assets/log/welcome_log.txt)

# How this Works?
> To know how this profile script works. Kindly [click here to read the docs](https://sanjeevstephan.github.io/superuser/)


# How to Contribute 
> To know how you can contribute to this repository. Kindly [Click here](https://github.com/SanjeevStephan/superuser/blob/main/CONTRIBUTING.md)

# Installing and running New Windows Terminal

> Note: Windows Terminal requires Windows 10 2004 (build 19041) or later

## Additional Settings for Window 11 (New Microsoft Terminal)
Go To Settings and do the following to maximize productivity
* Change th <b>Default Profile</b> from Windows PowerShell {5.3} to PowerShell {7.3}
* Change the <b>Default Terminal Application</b> from <i>Let Window Decide</i> to <b>Windows Terminal</b>
* <b>Toggle ON</b> -> Launch on machine startup (if you want the window to open terminal at launch) 

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
* Download [git for terminal](https://git-scm.com/downloads)
