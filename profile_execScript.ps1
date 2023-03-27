<#
 _____                     _         ____            _       _   
| ____|_  _____  ___ _   _| |_ ___  / ___|  ___ _ __(_)_ __ | |_ 
|  _| \ \/ / _ \/ __| | | | __/ _ \ \___ \ / __| '__| | '_ \| __|
| |___ >  <  __/ (__| |_| | ||  __/  ___) | (__| |  | | |_) | |_ 
|_____/_/\_\___|\___|\__,_|\__\___| |____/ \___|_|  |_| .__/ \__|  v1.0 | 26th-March-2023
                                                      |_|

.SYNOPSIS
    Validate and Execute the $script when passed the '$scriptName_args'

.DESCRIPTION
    This PowerShell Script takes Parameter $scriptName_args as the argument,
    it then checks if the $scriptName_args is 'available' and 'enabled' in the profile_config.ps1.
    if it is available and enabled then it checks if the key in the 'profile_config.ps1' has a matching '$($script.Name)' in the '$script_json_data'
    and when it found the matching '$($script.Name)' then it further 'Test-Path $($script.Path)' of the script to check if it exists or not.
    when all the checks have been passed it -> executes the '$($script.File)' at path '$($script.Path)'
    when all the checks have been failed it -> display the error message why the execution of the script failed.

.PARAMETER $scriptName_args = $args[0], $argument = $args[1]

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
----------------------------------------------{ CODE BELOW }-----------------------------------        
#>

<# 
param(
    [Parameter(Mandatory=$true)]
    [string]$scriptName_args
)
#> 

# Get the name of the script to execute as a command-line argument
$scriptName_args = $args[0]

# Get the argument for the script, if provided
$argument = $args[1]

# Script JSON File Name
$json_file_name = "scripts.json"

# Read the JSON data from the file
$script_json_data = Get-Content -Path "$Home\Documents\PowerShell\scripts.json" -Raw

# Convert the JSON data to a PowerShell object
$script_db = ConvertFrom-Json -InputObject $script_json_data 

# Define the path to the configuration file that contains additional key dependencies
$profile_config_path = "$Home\Documents\PowerShell\profile_config.ps1" # <----------- Include This Config File #>

# Include the configuration file to load any additional dependencies
. $profile_config_path # <-------------- NOTE-1 : TO RUN THIS SCRIPT | UNCOMMENT 

# Debug debug_exec_script.ps1
if($DEBUG["debug_exec_script"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_exe_script.ps1 } Loaded Successfully"} 
 
# Look in 'Name' Property whose Value '$scriptName_args'
$script = $script_db | Where-Object { $_.Name -eq $scriptName_args }

# Assign to new memorable variable
$script_name = $($script.Name)
$script_file = $($script.File)
$script_path = $($script.Path)

#-------------------- Functions {Read-Only}--------------
<# Display useful information when this script is executed | Helpful for debuging the script #>
function display_script_info()
{
    if($DEBUG["debug_exec_script"] -eq "enable")
    {
        Write-Output "-------------------{ SCRIPT INFO }--------------------------------"
        if($script_path) { Write-Output "Script Available in JSON List '$json_file_name' : Yes"} else { Write-Output "Script Available in JSON List '$json_file_name' : No"}
        if($script_name) { Write-Output "Script Name : $script_name" } else {}
        if($script_file) { Write-Output "Script File : $script_file" } else {}
        if($script_path -and (Test-Path $script_path)) { Write-Output "Script Path : $script_path" } else { Write-Output "[Invalid or Empty] Path :'$script_path'"  }
        if($script_path){if(Test-Path $script_path) { Write-Output "Conclusion : '$scriptName_args' is available in the JSON List and Have a valid Path"} else { Write-Output "Conclusion : '$scriptName_args' available in JSON but does not exists at the above given Path"}} else { Write-Output "Conclusion : '$scriptName_args' is not available in the JSON List"}

    }
    else { Write-Output "[ ] 'Allow' the 'debug_exec_script' in the $config_file" }

}

function display_all_available_scripts()
{
    if($TABLE["show_all_scripts"] -eq "enable")
    {
        Write-Output "----------------------------------{All Available Scripts }--------------------------------------"
        $script_db | Sort-Object | Format-Table @{label="No"; expression={$script_db.IndexOf($_) + 1}}, 
                                @{label="Script Name"; expression={$_.Name}}, 
                            # @{label="Script File"; expression={$_.File}},
                                @{label="Location"; expression={$_.Path}},
                                @{label="Args"; expression={$_.Argument}},
                                @{label="Parameter"; expression={$_.Parameter}},
                                @{label="Description"; expression={$_.Desc}}  -AutoSize

    }  else { Write-Output "[ ] 'Enable' the 'show_all_scripts' in the $config_file" }
}

function execute_script() { 
    # clear # clears the screen 

    <# Enable Display for Debugging  #>
    # $DEBUG.debug_exec_script = "enable"

    display_all_available_scripts
    display_script_info

    <# MAKING DECISION NOW #>
    if ($script) # Execute if-block only if '$script' is not-empty
    {
        if($script_path) # Execute if-block only if '$script_path' is not-empty means it is available in JSON list
        {
            if (Test-Path $script_path)  # If the $($script.Name) has valid $($script.Path), execute it with the argument if provided
            {
                Write-Output "------------------{ OUTPUT }------------------------"
                if ($argument) { & $script.Path $argument} else { & $script.Path } 
        
                Write-Output "[ SUCCESS ] All Checked | Executed Successfully" 
        
            } else {  Write-Output "[ FAILED ] Execution Failed "}
               
        } else { Write-Output "[ERROR] '$scriptName_args' not found in the JSON list"}
    
    } else { Write-Output "[NOT-AVAILABLE] Script Name: '$scriptName_args', is not available in the JSON list '$json_file_name' "   }

}

execute_script #initilize the .\profile_exec_script.ps1