<# 
 ____             __ _ _         ____             __ _       
|  _ \ _ __ ___  / _(_) | ___   / ___|___  _ __  / _(_) __ _ 
| |_) | '__/ _ \| |_| | |/ _ \ | |   / _ \| '_ \| |_| |/ _` |
|  __/| | | (_) |  _| | |  __/ | |__| (_) | | | |  _| | (_| | 1.profile_config.ps1
|_|   |_|  \___/|_| |_|_|\___|  \____\___/|_| |_|_| |_|\__, | v1.0 | 26th-March-2023
                                                       |___/  

                                                    
.SYNOPSIS
    Control how the Microsoft.Profile_profile's script behaves

 .DESCRIPTION
    This PowerShell Script defines the rule for the profile's scripts that will be run on the 'PowerShell Terminal v.7.2.2 & above'                                                 
 #>


$config_file    = "profile_config.ps1"
$profile_source = "$Home\Documents\PowerShell"
<#
    DEBUG -> enable | disable
#>
$DEBUG = @{
    "debug_config"        = "disable"
    "debug_exec_script"   = "enable"
    "debug_includes"      = "disable"
    "debug_path"          = "disable"  
    "debug_function"      = "disable"  
}
<#
    FEATURE -> enable | disable
#>
$TABLE = @{
    "show_all_paths"   = "enable"
    "show_all_scripts" = "enable"
}
$FEATURE = @{
        "figlet"       = "disable"
        "ascii"        = "enable"
        "dependencies" = "enable"
    




        
    }
<#
    ExecutableScript => 'allow' | 'refuse'
#>
$ExecutableScript = @{
    "test" = "allow"
    "test2" = "allow"
}

# Debug profile_get_path  
if($DEBUG["debug_config"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_config.ps1 } Loaded Successfully"} 
    
