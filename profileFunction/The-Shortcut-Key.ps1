

function dispplay_terminal_shortcut_key(){

# Output the value of the 'choice' variable to the console
#Write-Output "Received : $choice"

# Set the value of the 'pshell_path' variable to the user's PowerShell directory
$pshell_path = "$Home\Documents\PowerShell"

# Set the value of the 'myjson_path' variable to the path to the 'myjson' directory
$myjson_path = Join-Path $pshell_path "myjson"

# Set the value of the 'python_path' variable to the path to the 'display_shortcut_key_for_terminal.py' script
$python_path = Join-Path $pshell_path "mypython\display_shortcut_key_for_terminal.py"

# Change the current working directory to 'myjson_path'
cd $myjson_path

# Output the values of the 'pshell_path', 'myjson_path', and 'python_path' variables to the console
Write-Output "[ OK ] PowerShell Path  : $pshell_path"
Write-Output "[ OK ] MyJson Path      : $myjson_path"
Write-Output "[ OK ] Python File Path : $python_path"

# Call the 'display_shortcut_key_for_terminal.py' script using the Python interpreter
& python $python_path

# Change the current working directory back to the user's home directory
cd $Home
}

function Shortcut-Key() {
    figlet "Shortcut Keys"

    Write-Host "1. Window Terminal Shorcut Key"
    Write-Host "2. Windows Shortcut Key"


    $choice = Read-Host "[ INPUT ] Which Shortcut Keys to display (1-n) : "
    

    switch($choice){
        "1" { dispplay_terminal_shortcut_key }
        Default { Write-Host "Invalid Choice | Please Enter Valid Number " -ForegroundColor Red}

    }

}