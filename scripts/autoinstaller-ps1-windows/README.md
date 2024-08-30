# autoinstaller-ps1
Install Windows Softwares & Linux Packages using winget tool on the window 11 and apt tool on linux in powershell from the json-list 

```

    _         _          ___           _        _ _
   / \  _   _| |_ ___   |_ _|_ __  ___| |_ __ _| | | ___ _ __
  / _ \| | | | __/ _ \   | || '_ \/ __| __/ _` | | |/ _ \ '__|
 / ___ \ |_| | || (_) |  | || | | \__ \ || (_| | | |  __/ |
/_/   \_\__,_|\__\___/  |___|_| |_|___/\__\__,_|_|_|\___|_|

                               Created By Sanjeev Stephan Murmu
.SYNOPSIS
    Auto-Installer for Windows 11 using winget

.DESCRIPTION
    This Script will install the following software packages on the window system
    using [winget] window-package-installer

Name                                     Id                        Version          Match
-----------------------------------------------------------------------------------------------

Brave                                           Brave.Brave                     114.1.52.122  
cURL                                            cURL.cURL                       8.0.1
DirectX                                         Microsoft.DirectX               9.29.1974.1
Docker Desktop                                  Docker.DockerDesktop            4.20.1
Git                                             Git.Git                         2.41.0  
GitHub Desktop                                  GitHub.GitHubDesktop            3.2.3
GNU Privacy Guard                               GnuPG.GnuPG                     2.4.2
Gpg4win                                         GnuPG.Gpg4win                   4.1.0
KeePass Desktop                                 DominikReichl.KeePass           2.54.0
Microsoft Edge                                  Microsoft.Edge                  113.0.1774.57   
Microsoft Visual Studio Code                    Microsoft.VisualStudioCode      1.78.2  
Microsoft Visual C++ 2015-2022 Redistributable… Microsoft.VCRedist.2015+.x64    14.36.32532.0   
Nmap                                            Insecure.Nmap                   7.80
Nano                                            GNU.Nano                        2.7.5
OpenSSH Beta                                    Microsoft.OpenSSH.Beta          9.2.2.0  
Oracle VM VirtualBox                            Oracle.VirtualBox               7.0.8   
OBS Studio                                      OBSProject.OBSStudio            29.1.2
PowerShell                                      Microsoft.PowerShell            7.3.4.0   
PowerToys (Preview)                             Microsoft.PowerToys             0.70.1                          
Power Automate for desktop                      Microsoft.PowerAutomateDesktop  2.32.111.23124 
Python 3.11                                     Python.Python.3.11              3.11.3  
Node.js LTS                                     OpenJS.NodeJS.LTS               18.16.0 
Notion                                          Notion.Notion                   2.0.41   
Windows Terminal                                Microsoft.WindowsTerminal       1.16.10261.0    

.NOTES
    -> Author : Sanjeev Stephan Murmu
    -> Created On : 8th June 2023
    -> Learn More About Winget
       (https://learn.microsoft.com/en-us/windows/package-manager/winget/)
 
```
