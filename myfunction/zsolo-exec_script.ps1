<#
 _____                     _         ____            _       _   
| ____|_  _____  ___ _   _| |_ ___  / ___|  ___ _ __(_)_ __ | |_ 
|  _| \ \/ / _ \/ __| | | | __/ _ \ \___ \ / __| '__| | '_ \| __|
| |___ >  <  __/ (__| |_| | ||  __/  ___) | (__| |  | | |_) | |_ 
|_____/_/\_\___|\___|\__,_|\__\___| |____/ \___|_|  |_| .__/ \__|  v1.0 | 26th-March-2023
                                                      |_|

.SYNOPSIS
    Validate and Execute the $script when passed the '$Param_Config_Key'

.DESCRIPTION
    This PowerShell Script takes Parameter $Param_Config_Key as the argument,
    it then checks if the $Param_Config_Key is 'available' and 'enabled' in the profile_config.ps1.
    if it is available and enabled then it checks if the key in the 'profile_config.ps1' has a matching '$($script.Name)' in the '$script_json_data'
    and when it found the matching '$($script.Name)' then it further 'Test-Path $($script.Path)' of the script to check if it exists or not.
    when all the checks have been passed it -> executes the '$($script.File)' at path '$($script.Path)'
    when all the checks have been failed it -> display the error message why the execution of the script failed.

.PARAMETER Param_Config_Key

.EXAMPLE
    .\profile_script.ps1 test

.OUTPUTS
    ON FAILURE
        PS C:\Users\Sanju\Documents\PowerShell> .\profile_script.ps1 test
        [ ] 'Enable' the 'display_script_info' in the profile_config.ps1
        [ ] 'Allow' the Execution of the script 'test' in the profile_config.ps1
        [ FAILED ] Execution
        [ FAILED ] All Checked
    ON SUCCESS
        PS C:\Users\Sanju\Documents\PowerShell> .\profile_script.ps1 test
        Is 'test' available in 'profile_config.ps1 : True
        Script Name : test
        Script File : test.ps1
        Script Path : C:\Users\Sanju\Documents\PowerShell\test.ps1
        You have successfully accessed this script! Well Done

       _____         _     ____                               __       _
      |_   _|__  ___| |_  / ___| _   _  ___ ___ ___  ___ ___ / _|_   _| |
        | |/ _ \/ __| __| \___ \| | | |/ __/ __/ _ \/ __/ __| |_| | | | |
        | |  __/\__ \ |_   ___) | |_| | (_| (_|  __/\__ \__ \  _| |_| | |
        |_|\___||___/\__| |____/ \__,_|\___\___\___||___/___/_|  \__,_|_|



        Executed Successfully
        [ SUCCESS ] All Checked    
.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    VERSION
        -v1.0
    DATE
        -26 March 2023   
#>

# Get the name of the script to execute as a command-line argument
$scriptName = $args[0]

# Get the argument for the script, if provided
$argument = $args[1]

# Read the JSON file 'scripts.json' and convert it to a PowerShell object
$scripts = Get-Content -Path "scripts.json" | ConvertFrom-Json

# Find the script with the given name
$script = $scripts | Where-Object { $_.Name -eq $scriptName }

# If the script is found, execute it with the argument if provided
if ($script) {
    if ($argument) {
        & $script.Path $argument
    } else {
        & $script.Path
    }
} else {
    Write-Error "Script '$scriptName' not found"
}
