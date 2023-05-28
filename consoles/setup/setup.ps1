<#
.TITLE
    01-Setup -> setup.ps1

.SYNOPSIS
    Setting up the to include the basic depedencies to get the script running!

.DESCRIPTION
    This Script 'setup.ps1' 
#>
#$setup_dir = (Get-Content -Path "$home\OneDrive\.sanjeevstephan\paths\directory.path" | Select-Object -Index 4) 

. "$Home\superuser.ps1"
$setup_dir = $DIRECTORY.setup
#---------------- Must-Include-Below-File ----------------------------#>
cd $setup_dir
. "$setup_dir\the-config-file.ps1"
. "$setup_dir\auto-include-dependency.ps1"
. "$setup_dir\auto-include-installer.ps1"
. "$setup_dir\dependency\The-Prompt.ps1"
. "$setup_dir\the-main-console.ps1"