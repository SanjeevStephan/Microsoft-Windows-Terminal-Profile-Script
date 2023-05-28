<#
.TITLE
    03-Include -> auto-include-script.ps1

.SYNOPSIS
    An Script to include all the scripts in the directory /setup/installer without specifying the name of the script!.
    

.DESCRIPTION

#>

$TheConfigFile = (Get-Content -Path "$home\OneDrive\.sanjeevstephan\paths\config.path" | Select-Object -Index 4) 
# getPath the configuration file to load any additional Paths
 . $TheConfigFile  # <-------------- NOTE : LOAD THE CONFIG-FILE via (Dot-Sourcing)

#type $ASCII.setup 
 

<# ================================ Include All the Installer Scripts =============================#>


if(Test-Path $TheConfigFile) 
{

    if(Test-Path $DIRECTORY.installer)
    {

        Write-Output "<-------------------{ Loading Setup Installer Scripts }-------------------------->"
        Write-Host "[ INCLUDE-ALL ] The {*.ps1} in the $($DIRECTORY.installer)" -ForegroundColor Cyan
    
        # Get all the *.ps1 files in the "dependency" directory
        $installer_files = Get-ChildItem -Path $DIRECTORY.installer -Filter "*.ps1" | Select-Object -ExpandProperty FullName
    
        Write-Debug "Directory Dependency : $($DIRECTORY.installer)"

       
        # Loop through each dependency file and include it in the profile
        foreach ($path in $installer_files) {
            if (Test-Path $path) {
    
                Write-Host "[ OK ] Installer : $(Split-Path -Leaf $path) -> Located {$path} " -ForegroundColor Blue
                #Start-Sleep -Seconds 0.5
                . $path #syntax to include all the dependecny
            } else {
                Write-Warning "Missing $(Split-Path -Leaf $path) at path $path"
            }
            
        }
        

    } else { Write-Error "Installer directory path is empty : $($DIRECTORY.installer)"} 

} else { Write-Error "Configuration File Missing { $($DEPENDENCY.config)}"}







