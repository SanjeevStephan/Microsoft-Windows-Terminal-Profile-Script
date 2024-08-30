<#
    _         _          ___           _        _ _
   / \  _   _| |_ ___   |_ _|_ __  ___| |_ __ _| | | ___ _ __
  / _ \| | | | __/ _ \   | || '_ \/ __| __/ _` | | |/ _ \ '__|
 / ___ \ |_| | || (_) |  | || | | \__ \ || (_| | | |  __/ |
/_/   \_\__,_|\__\___/  |___|_| |_|___/\__\__,_|_|_|\___|_|

                   Р        Created By Sanjeev Stephan Murmu
.SYNOPSIS
    Auto-Installer for Windows 11 using winget

.DESCRIPTION
    This Script will install the following software packages on the window system using [winget] window-package-installer
Name                                     Id                        Version          Match                 Source
--------------------------------------------------------------------------------------------------------------------------------

PowerShell                                      Microsoft.PowerShell            7.3.4.0                                winget
OpenSSH Beta                                    Microsoft.OpenSSH.Beta          9.2.2.0                                winget
Microsoft Visual Studio Code                    Microsoft.VisualStudioCode      1.78.2          Moniker: vscode        winget
Windows Terminal                                Microsoft.WindowsTerminal       1.16.10261.0    Moniker: terminal      winget
Microsoft Edge                                  Microsoft.Edge                  113.0.1774.57                          winget
Power Automate for desktop                      Microsoft.PowerAutomateDesktop  2.32.111.23124                         winget
PowerToys (Preview)                             Microsoft.PowerToys             0.70.1                                 winget
Microsoft Visual C++ 2015-2022 Redistributable… Microsoft.VCRedist.2015+.x64    14.36.32532.0                          winget

Brave                                           Brave.Brave                  114.1.52.122                              winget
Git                                             Git.Git                      2.41.0                                    winget
Python 3.11                                     Python.Python.3.11           3.11.3          Command: python           winget
Node.js LTS                                     OpenJS.NodeJS.LTS            18.16.0         Tag: nodejs               winget
Notion                                          Notion.Notion                2.0.41                                    winget
Oracle VM VirtualBox                            Oracle.VirtualBox            7.0.8                                     winget

.NOTES
    -> Author : Sanjeev Stephan Murmu
    -> Created On : 8th June 2023
    -> Learn More About Winget (https://learn.microsoft.com/en-us/windows/package-manager/winget/)
#> 

$MAIN_DIR = "$($env:powershell)\scripts\autoinstaller-ps1-windows"
#$MAIN_DIR = "$home/Documents/GitHub/autoinstaller-ps1"
$SCRIPT_NAME = $MyInvocation.MyCommand.Name 
#$CONSOLE_JSON_FILEPATH = "$MAIN_DIR\console.json"
$AUTOINSTALLER_JSON_FILEPATH = "$MAIN_DIR\autoinstaller.json"
$LOCATION = Get-Location
#$CONSOLE_JSON = Get-Content -Raw $CONSOLE_JSON_FILEPATH | ConvertFrom-Json
$AUTOINSTALLER_JSON = Get-Content -Raw $AUTOINSTALLER_JSON_FILEPATH | ConvertFrom-Json
$AUTOINSTALLER_SETTINGS =  $AUTOINSTALLER_JSON.settings
$OS_INFO = $AUTOINSTALLER_JSON.info.os

Write-Host "├── $SCRIPT_NAME" -ForegroundColor White
Write-Host "├ OS ] $($AUTOINSTALLER_JSON.info.os)"
Write-Host "├ JSON ] $($AUTOINSTALLER_JSON.info.json)"
Write-Host "├ SCRIPT ] $($AUTOINSTALLER_JSON.info.script)"
Write-Host "├ DESC ] $($AUTOINSTALLER_JSON.info.desc)"
Write-Host "├ SEARCH ] $($AUTOINSTALLER_SETTINGS.search)"
Write-Host "├ INSTALL ] $($AUTOINSTALLER_SETTINGS.install)"
Write-Host "├ LOCATION ] $LOCATION"
Write-Host "├ AUTHOR ] $($AUTOINSTALLER_JSON.info.author)" -ForegroundColor Green

# Write-Output "JSON : $AUTOINSTALLER_JSON"
$Packages_to_install = $AUTOINSTALLER_JSON.packages
$Total_Packages      = $Packages_to_install.Length - 1 # Minus '1' to prevent for loop from displaying empty file-path

$current_installed_pkg = 0
# echo $AUTOINSTALLER_SETTINGS

for ($i = 0; $i -le $Total_Packages; $i++) 
{
  # Write-Host "|    |          ├  DEBUG ] Counting Total Objects : $i"
  # echo "INside the loop"
    $Packages_Name      = $Packages_to_install[$i].name
    $Packages_ID        = $Packages_to_install[$i].pkg_id
    $Packages_NAME        = $Packages_to_install[$i].pkg_name
    $Packages_Version   = $Packages_to_install[$i].version
    $install_pkg        = $Packages_to_install[$i].install


    if($install_pkg -eq "YES")
    {

        if($AUTOINSTALLER_SETTINGS.search -eq "YES")
        {
  
           # Kindly Specify Which Operating-System you are on in the autoinstaller.json file        
            if($OS_INFO -eq "Linux") {  

                Write-Host "[ Searching ] $Packages_Name with Package Name [" -NoNewline -ForegroundColor Cyan
                Write-Host " $Packages_Name " -ForegroundColor Black -BackgroundColor Cyan -NoNewline
                Write-Host "]"    
                Invoke-Expression "apt search $Packages_NAME" 

            }
            elseif ($OS_INFO -eq "Window") {  
                
                Write-Host "[ Searching ] $Packages_Name with Package ID [" -NoNewline -ForegroundColor Cyan
                Write-Host " $Packages_ID " -ForegroundColor Black -BackgroundColor Cyan -NoNewline
                Write-Host "]"
                Invoke-Expression "winget search $Packages_ID" 
            }
            else { Write-Host "[ Error ] OS Not Specified in the JSON"}


        }

        Write-Host "[ Installing ] $Packages_Name " -ForegroundColor Green
    
        # Kindly Specify Which Operating-System you are on in the autoinstaller.json file
        if($OS_INFO -eq "Linux") { Invoke-Expression "sudo apt install $Packages_NAME -y" }
        elseif ($OS_INFO -eq "Window") {  Invoke-Expression "winget install --id $Packages_ID --source winget" }
        else { Write-Host "[ Error ] OS Not Specified in the JSON"}
        
        Write-Host "[ Installed ] $Packages_Name " -ForegroundColor Black -BackgroundColor Cyan
    
        $current_installed_pkg = $i + 1
        Write-Host "[ Total ] Packages Installed Till Now { $current_installed_pkg } Out of { $Total_Packages }" -ForegroundColor Green
    
    }

}

if($AUTOINSTALLER_SETTINGS.install -eq "YES") 
{
    Write-Host "[" -NoNewline
    Write-Host "Successfully" -ForegroundColor Black -BackgroundColor Green  -NoNewline
    Write-Host "] Installed All { $current_installed_pkg } Packages" -ForegroundColor Green
}





