<# 0.Microsoft.Profile_profile.ps1
 ____                        _   _               
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __ 
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__|
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |   
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|   
            |_|                                  
---------------------------------------------------------
.SYNOPSIS
    Microsoft.Profile_profile

.DESCRIPTION
    This PowerShell Script comprises the index of all the functions and alias for the window terminal

    .PREREQUISITES
        -You must be running Windows 10 2004 (build >= 10.0.19041.0) or later to run Windows Terminal
        -You must enable Developer Mode in the Windows Settings app to locally install and run Windows Terminal (https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development)
        -You must have PowerShell 7 or later installed (https://github.com/PowerShell/PowerShell/releases/latest)
        -You must have at least VS 2022 installed (https://visualstudio.microsoft.com/downloads/)
        -You must install the .NET Framework Targeting Pack to build test projects (https://docs.microsoft.com/dotnet/framework/install/guide-for-developers#to-install-the-net-framework-developer-pack-or-targeting-pack)
        
.LINK
    - My Github Repository                  (https://github.com/SanjeevStephan/superuser)
    - Microsoft Windows Terminal Repository (https://github.com/microsoft/terminal)
    - PowerShell v7+                        (https://github.com/PowerShell/PowerShell/releases/latest)
    - PowerShell-7.3.3-win-x64.zip (https://github.com/PowerShell/PowerShell/releases/download/v7.3.3/PowerShell-7.3.3-win-x64.zip)
.NOTES
    .AUTHOR
        -> Sanjeev_Stephan_Murmu

    .FILES
        -> Microsoft.PowerShell_profile.ps1
        -> profile_config.ps1
        -> profile_func.ps1
        -> profile_include.ps1
        -> profile_path.ps1
        -> profile_path.ps1

    .CONTAINS
        -> configuration
        -> dictionary
        -> dependencies        
        -> paths
        -> variables
        -> functions
#-------------------- Include Below File --------------------------------------#>
# Define the path to the configuration file that contains additional dependencies and settings
$profile_config = "$Home\Documents\PowerShell\profile_config.ps1"
$profile_path = "$Home\Documents\PowerShell\profile_get_path.ps1"
$profile_include = "$Home\Documents\PowerShell\profile_include.ps1"

# Include the configuration file to load any additional dependencies
#. $profile_config
#. $profile_path 
. $profile_include

#-------------------- Functions {Read-Only}--------------
#-------------------- Functions {Read-Only}--------------

function initialize() {



}
function debug($msg){ Write-Output "[DEBUG] $msg"}
#-------------------- Script Execution Begins from here-----
initialize  #calling the initialize() function 