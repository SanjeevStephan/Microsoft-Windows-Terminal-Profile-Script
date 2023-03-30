<#                                
 ____             __ _ _        ___            _           _      
|  _ \ _ __ ___  / _(_) | ___  |_ _|_ __   ___| |_   _  __| | ___ 
| |_) | '__/ _ \| |_| | |/ _ \  | || '_ \ / __| | | | |/ _` |/ _ \
|  __/| | | (_) |  _| | |  __/  | || | | | (__| | |_| | (_| |  __/ 2.profile_include.ps1
|_|   |_|  \___/|_| |_|_|\___| |___|_| |_|\___|_|\__,_|\__,_|\___| v1.0 | 26th-March-2023
                                                                  
.SYNOPSIS
    Script to include other PowerShell scripts as dependencies
.DESCRIPTION
    Execute the script_files that are 'included' in this 'profile_include.ps1' script
.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    SCRIPT
        -profile_include.ps1
    VERSION
        -v1.0    
        
#-------------------- Include Below File --------------------------------------#>
# Defined the path to the configuration file that contains additional dependencies settings
$profile_config_source = "$Home\Documents\PowerShell\profile_config.ps1"
$profile_source = "$Home\Documents\PowerShell"
$dependency_source = "$profile_source\dependency"

# Load the configuration file that contains additional dependencies settings
. $profile_config_source
#----------------------------------------------------------------------------------


if(Test-Path $profile_config_source) 
{

    Write-Output "<-------------------{ Loading Dependencies }-------------------------->"
    Write-Output "[ OK ] Profile include => { include.ps1 } Loaded Successfully"

    $profile_dependencies = @{
       # "powerShell_profile" = "$profile_source\Microsoft.PowerShell_profile.ps1"
        "getDependencies"    = "$dependency_source\getDependencies.ps1"  
        "getColorSchemes"    = "$dependency_source\getColorSchemes.ps1"
        "getCore"            = "$dependency_source\getCore.ps1"  
        "getFunction"        = "$dependency_source\getFunction.ps1"
        "getJson"            = "$dependency_source\getJson.ps1"    
        "getPath"            = "$dependency_source\getPath.ps1"
        "getPython"          = "$dependency_source\getPython.ps1"
        "getLink"            = "$dependency_source\getLink.ps1"
        "getScript"          = "$dependency_source\getScript.ps1"
        "setMyFunctions"     = "$dependency_source\setMyFunctions.ps1"  
        "setProfileFunctions"= "$dependency_source\setProfileFunctions.ps1"  
        "profile_function"   = "$profile_source\profile_function.ps1"
        "profile_config"     = "$profile_source\profile_config.ps1"
        "profile_console"    = "$dependency_source\profile_console.ps1"
    }


    foreach ($dependency in $profile_dependencies.GetEnumerator() | Sort-Object -Property Key ) {
        $path = $dependency.Value
        if (Test-Path $path) {
            Write-Host "[ OK ] Dependency : $($dependency.Key) : Included $path " -ForegroundColor Blue
        . $path
        } else {
            Write-Warning "Missing { $($dependency.Key) } at path $path"
        }
    }



    <#  Function to include all dependencies using traditional hashtable
    $profile_dependencies = @{
        "powerShell_profile" = "$profile_source\Microsoft.PowerShell_profile.ps1"
        "profile_config"     = "$profile_source\profile_config.ps1"
        "profile_function"   = "$profile_source\profile_function.ps1"
        "profile_console"    = "$dependency_source\profile_console.ps1"
        "getDependencies"    = "$dependency_source\getDependencies.ps1"    
        "getFunction"        = "$dependency_source\getFunction.ps1"
        "getJson"            = "$dependency_source\getJson.ps1"    
        "getPath"            = "$dependency_source\getPath.ps1"
        "getPython"          = "$dependency_source\getPython.ps1"
        "getLink"            = "$dependency_source\getLink.ps1"
        "getScript"          = "$dependency_source\getScript.ps1"
        "setMyFunctions"     = "$dependency_source\\setMyFunctions.ps1"   
    }
    #>
    <# 
    . $profile_dependencies["getPath"]
    . $profile_dependencies["getJson"]
    . $profile_dependencies["getScript"]
    . $profile_dependencies["getDependencies"]
    . $profile_dependencies["getPython"]
    . $profile_dependencies["getFunction"]
    . $profile_dependencies["profile_function"]
    . $profile_dependencies["setProfileFunctions"]
    . $profile_dependencies["setMyFunctions"]
    # . $profile_dependencies["getLink"]
#>
} else { Write-Warning "Configuration File Missing {$profile_config_source}"}
