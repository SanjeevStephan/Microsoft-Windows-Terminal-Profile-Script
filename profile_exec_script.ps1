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

param(
    [Parameter(Mandatory=$true)]
    [string]$Param_Config_Key
)


# Read the JSON data from the file
$script_json_data = Get-Content -Path "$Home\Documents\PowerShell\scripts.json" -Raw

# Convert the JSON data to a PowerShell object
$script_db = ConvertFrom-Json -InputObject $script_json_data 

#-------------------- Include Below File ----------------
# Define the path to the configuration file that contains additional key dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1"

# Include the configuration file to load any additional dependencies
# . $profile_config_path # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

# Debug debug_exec_script.ps1
if($DEBUG["debug_exec_script"] -eq "enable"){ Write-Output "--------------------------{profile_exe_script.ps1}-------------------------"} 
 
#-------------------- Functions {Read-Only}--------------


# Look for the Specific Key in 'Name' whose Value '$Param_Config_Key'
$script = $script_db | Where-Object { $_.Name -eq $Param_Config_Key }

$script_name = $($script.Name)
$script_file = $($script.File)
$script_path = $($script.Path)

<#
    Display useful information when this script is executed
    Helpful for debuging the script
#>
function display_script_info()
{
    if($DEBUG["debug_exec_script"] -eq "enable")
    {
        $choice = check_config
        Write-Output "Is '$Param_Config_Key' available in 'profile_config.ps1 : $choice "
    
        #Write-Output "Argument Passed : $Param_Config_Key "
        Write-Output "Script Name : $script_name"
        Write-Output "Script File : $script_file"
        Write-Output "Script Path : $script_path"
    }
    else { Write-Output "[ ] 'Enable' the 'display_script_info' in the $config_file" }
}

<#
    Check if the Key $Param_Config_Key in the 'profile_config.ps1' exists and enabled
#>
function check_config() 
    { if ($ExecutableScript[$Param_Config_Key] -eq "allow") { return $true }  
    else {return $false }
}
<#
    What to do what you get an ERROR!
#>
function handle_error() {
    $is_script_allowed_in_config = check_config
    $does_script_exist = Test-Path $script_path
   
    # Check if the '$script_name' is allowed to execute in the config_file and throw an error
     if($is_script_allowed_in_config -eq $false) {Write-Output "[ ] 'Allow' the Execution of the script '$script_name' in the $config_file"} 
    # Check if the 'script_path' exists and throw an error
     if($does_script_exist -eq $false) {Write-Output "[ ] 'Script '$script_name' in the does not exist at path : $script_path"} 

}

<#
    Checks if the $Param_Config_Key and $script_path exists and return $true or $false accordingly
#>
function validate_script() 
{ if (($script) -and (Test-Path $script_path)) {return $true } else { return $false } }

<#
    Check and Validat the script once more before execution begins
#>
function execute_script() { 
    # clears the screen
    if ((check_config) -and (validate_script))
    {
        display_script_info    
        . $script_path                         #execute the script
        Write-Output "Executed Successfully"
        Write-Output "[ SUCCESS ] All Checked"        
    } else { 
        display_script_info
        handle_error                          # Handles Related Errors
        Write-Output "[ FAILED ] Execution "
        Write-Output "[ FAILED ] All Checked"
        
    }
}


# execute_script #initilize the .\profile_script.ps1