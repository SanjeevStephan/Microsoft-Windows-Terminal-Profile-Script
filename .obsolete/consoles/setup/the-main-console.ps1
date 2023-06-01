<#
 __  __       _              ____                      _
|  \/  | __ _(_)_ __        / ___|___  _ __  ___  ___ | | ___
| |\/| |/ _` | | '_ \ _____| |   / _ \| '_ \/ __|/ _ \| |/ _ \
| |  | | (_| | | | | |_____| |__| (_) | | | \__ \ (_) | |  __/
|_|  |_|\__,_|_|_| |_|      \____\___/|_| |_|___/\___/|_|\___|

#>

<#
.TITLE
    03-Main -> main.ps1

.SYNOPSIS
    Main Console Script when the user can begin interacting to the script via console.
    

.DESCRIPTION

#>
#. "$Home\superuser.ps1"

function TheConsolePrompt() {

        # Display Basic Menu from script /dependency/The-Prompt-Console-Menu.ps1
        Prompt-Console-Menu

        # Prompt the user for input
        $input = The-Prompt("Enter Your Choice ")
        # $input = Read-Host "Enter Your Choice (or 'e' to exit): "

         # Check if the user entered 'e' and exit if they did
        if ($input -eq 'q') {
            Write-Host "Exiting...Setup"
            #break
            exit 0
        }
        elseif ($input -eq 'h') { The-Console }
        elseif ($input -eq 'o') { The-Console }
        elseif ($input -eq 'e') { Edit-Console }
        elseif ($input -eq 's') { The-Setting  } 
        elseif ($input -eq 'w') { Start-Process explorer.exe $pwd }
        else 
        {
                # Do something with the user's input
                # Write-Host "You entered: $input"

                switch($input) 
                {
                    0 { }
                    1 { Auto-Install-Menu }
                    2 { Manual-Install-Menu }
                    3 { }
                    4 { }
                    5 { List-Json("") }
                    6 { }
                    7 { }
                    8 { }
                    9 { }
                    Default  { Write-Host "Wrong Input! " -ForegroundColor Red }
                }
            }
}



function The-Console() {

    $menu_list = @{
        0 = @{Name = "About";              Description = "Informations About This Setup Script." }
        1 = @{Name = "Auto Installer";     Description = "Automatic Install Necessary Softwares & Tools." }
        2 = @{Name = "Manual Install";     Description = "Manually  Install Required  Softwares & Tools." }
        3 = @{Name = "Downloads";          Description = "Downloaded Files." }
        4 = @{Name = "Resources";          Description = "Online Resources." }
        5 = @{Name = "SavedLinks";         Description = "Bookmarked Links From Json Files." }
#        6 = @{Name = "";       Description = "" }
#        7 = @{Name = "";       Description = "" }
#        8 = @{Name = "";       Description = "" }
#        9 = @{Name = "";       Description = "" }

    }


    do {
        Write-Host "Please Wait...Loading Menu."
        Start-Sleep -Seconds 2
        clear # Clear the Screen-Everytime 

        
        type $ASCII.setup
        $pwd = Get-Location 
        $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf

        $menu_list.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Setup Menu"; expression={$_.Value.Name}}, @{label="Description"; expression={$_.Value.Description}} -AutoSize

        TheConsolePrompt


    } while ($true)


}



The-Console # Start the Console 