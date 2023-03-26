
if($DEBUG["debug_function"] -eq "enable"){ Write-Output "--------------------------{profile_function.ps1}-------------------------"} 
 
function check_test(){ }

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