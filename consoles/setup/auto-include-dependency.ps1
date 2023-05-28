<#
.TITLE
    03-Include -> auto-include-script.ps1

.SYNOPSIS
    An Script to include all the scripts in the directory /setup/installer without specifying the name of the script!.
    

.DESCRIPTION

#>

$TheConfigFile = (Get-Content -Path "$home\OneDrive\.sanjeevstephan\paths\config.path" | Select-Object -Index 4) 
#. "$Home\superuser.ps1"
#$TheConfigFile =  $CONFIG.setup_config
# getPath the configuration file to load any additional Paths
 . $TheConfigFile  # <-------------- NOTE : LOAD THE CONFIG-FILE via (Dot-Sourcing)

type $ASCII.setup 
 
<# ================================ Include All the Dependency Scripts =============================#>



if(Test-Path $TheConfigFile) 
{

    if(Test-Path $DIRECTORY.dependency)
    {

        Write-Output "<-------------------{ Loading Setup Dependencies }-------------------------->"
        Write-Host "[ INCLUDE-ALL ] The {*.ps1} in the $($DIRECTORY.dependency)" -ForegroundColor Cyan
    
        # Get all the *.ps1 files in the "dependency" directory
        $dependency_files = Get-ChildItem -Path $DIRECTORY.dependency -Filter "*.ps1" | Select-Object -ExpandProperty FullName
    
        Write-Debug "Directory Dependency : $($DIRECTORY.dependency)"

       
        # Loop through each dependency file and include it in the profile
        foreach ($path in $dependency_files) {
            if (Test-Path $path) {
    
                Write-Host "[ OK ] Dependency : $(Split-Path -Leaf $path) -> Located {$path} " -ForegroundColor Blue
                #Start-Sleep -Seconds 0.5
                . $path #syntax to include all the dependecny
            } else {
                Write-Warning "Missing $(Split-Path -Leaf $path) at path $path"
            }
            
        }
        

    } else { Write-Error "Dependency directory path is empty : $($DIRECTORY.dependency)"} 

} else { Write-Error "Configuration File Missing { $($DEPENDENCY.config)}"}





