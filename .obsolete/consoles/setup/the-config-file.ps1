<#
 _____ _
|_   _| |__   ___
  | | | '_ \ / _ \
  | | | | | |  __/
  |_| |_| |_|\___|
  ____             __ _                       _   _                   _____ _  _
 / ___|___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __       |  ___(_)| | ___
| |   / _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \ _____| |_  | || |/ _ \
| |__| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |_____|  _| | || |  __/
 \____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|     |_|   |_||_|\___|
                        |___/
#>
<#
.TITLE
    02-Configuration-File -> the-config-file.ps1

.SYNOPSIS
    Key-Value Based Variable Dictionary

.DESCRIPTION
    This Script 'setup.ps1' 
#>

echo "ehlo"
$asciiLocation = (Get-Content -Path "$home\OneDrive\.sanjeevstephan\paths\directory.path" | Select-Object -Index 2) 
$setupLocation = (Get-Content -Path "$home\OneDrive\.sanjeevstephan\paths\directory.path" | Select-Object -Index 4) 

$ASCII = @{
    "setup"            = "$asciiLocation\setup_basic.ascii"
    "mainconsole"      = "$asciiLocation\mainconsole.ascii"
    "powershell"       = "$asciiLocation\powershell_basic.ascii"
    "git_cli"          = "$asciiLocation\git_cli_basic.ascii"
    "manual_install"   = "$asciiLocation\manual_install_standard.accii"
    "autoinstaller"    = "$asciiLocation\autoinstaller_standard.ascii"
    
}

$DEPENDENCY = @{
    "setup"  = "$setupLocation\the-setup-index.ps1"
    "config" = "$setupLocation\the-config-file.ps1"
    "include"= "$setupLocation\auto-include-script.ps1"
    "main"   = "$setupLocation\the-main-console.ps1"

}
$DIRECTORY = @{
    "setup"     = "$setupLocation"
    "installer" = "$setupLocation\installer"
    "dependency"= "$setupLocation\dependency"
    "jsons"     = "$setupLocation\jsons"

}

#echo "Hello Config"