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
 
function check_test($argument) { 
     $profile_exec_script = get_script_path("profile_exec_script")
    .$profile_exec_script $argument

}
function get_script() { get_script_path("test") }

function Launch_Script($executable_title) {  .$script["script_launcher"] $executable_title }

function display_script_list()
{
    $script_json_data | Sort-Object | Format-Table @{label="Script"; expression={$jsonArray.IndexOf($_) + 1}}, 
                            @{label="Script Name"; expression={$_.Name}}, 
                            @{label="Script File"; expression={$_.File}},
                            @{label="Location"; expression={$_.Path}},
                            @{label="Description"; expression={$_.Desc}} -AutoSize

}

function SHOW_TABLE() {

# Update the value of the 'show_all_paths' property
$TABLE.show_all_paths = "enable"

list_all_path
}

# SHOW_TABLE