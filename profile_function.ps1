<#
 ____             __ _ _        _____                 _   _                 
|  _ \ _ __ ___  / _(_) | ___  |  ___|   _ _ __   ___| |_(_) ___  _ __  ___ 
| |_) | '__/ _ \| |_| | |/ _ \ | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
|  __/| | | (_) |  _| | |  __/ |  _|| |_| | | | | (__| |_| | (_) | | | \__ \ v1.0 | 26th March 2023
|_|   |_|  \___/|_| |_|_|\___| |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
      

.SYNOPSIS

.DESCRIPTION
    This PowerShell Script contains 'functions' that can be call from the terminal when required to perform task at any given time.

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    VERSION
        -v1.0
    DATE
        -26 March 2023   

#>
if($DEBUG["debug_function"] -eq "enable"){ Write-Output "[ OK ] Profile Script => { profile_function.ps1 } Loaded Successfully"} 
 

function exec($script_name,$argument) {
    $exec_script = getScript("profile_execScript") #"$Home\Documents\PowerShell\profile_execScript.ps1"

    if($script_name) # if script_name is not-empty | execute if-block 
    {
        if($argument) { & $exec_script.Path $script_name $argument} else { & $exec_script.Path $script_name }

    } else { Write-Output "Script Name is Empty | Try -> exec test"}  

    
 }

function display_script() {

    $script = getScript("test")
    Write-Output "SHOWING SCRIPT PATH $($script.Path) for the Script $($script.Name)"
}

function SHOW_TABLE() {

    switch ($json_table_name) {
        "script" { 
                    # Read the JSON data from the file
                    $script_json_data = Get-Content -Path "$Home\Documents\PowerShell\scripts.json" -Raw

                    # Convert the JSON data to a PowerShell object
                    $script_db = ConvertFrom-Json -InputObject $script_json_data 


         }
        Default {}
    }



# Update the value of the 'show_all_paths' property
$TABLE.show_all_paths = "enable"

list_all_path
}

