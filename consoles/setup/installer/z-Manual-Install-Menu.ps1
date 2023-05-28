function TheManualInstallPrompt() {


        # Display Basic Menu from script /dependency/The-Prompt-Console-Menu.ps1
        Prompt-Console-Menu

        # Prompt the user for input
        $input = The-Prompt("Enter Your Choice ")
        # $input = Read-Host "Enter Your Choice (or 'e' to exit): "

         # Check if the user entered 'e' and exit if they did
        if ($input -eq 'q') {
            Write-Host "Exiting...SmartHome"
            #break
            exit 0
        }
        elseif ($input -eq 'h') { The-Console }
        elseif ($input -eq 'o') { The-Console }
        elseif ($input -eq 'e') { Edit-Installer-Files }
        elseif ($input -eq 's') { The-Setting  } 
        elseif ($input -eq 'w') { Start-Process explorer.exe $DIRECTORY.installer }
        else 
        {
                # Do something with the user's input
                # Write-Host "You entered: $input"

                switch($input) 
                {
                    0 { }
                    1 { Install-Git }
                    2 { Install-PowerShell }
                    3 { Start-Process "https://www.python.org/downloads/" }
                    4 { Start-Process "https://code.visualstudio.com/Download" }
                    5 { Start-Process "https://central.github.com/deployments/desktop/desktop/latest/win32" }
                    6 { }
                    7 { }
                    8 { }
                    9 { }
                    Default  { Write-Host "Wrong Input! " -ForegroundColor Red }
                }
            }
}


function Manual-Install-Menu() {

    $install_options = @{
        0 = @{Name = "Home";          Description = "Go the Home (Main Console)" }
        1 = @{Name = "Git";           Description = "Install { Git } cli for Terminal" }
        2 = @{Name = "PowerShell 7";  Description = "Install New Microsoft { PowerShell }" }
        3 = @{Name = "Python ";       Description = "Download the latest version of { Python } for Windows" }
        4 = @{Name = "VSCode";        Description = "Download The OpenSource Code Editor { VSCode }" }           
        5 = @{Name = "Github-Desktop";Description = "Download { GitHub Desktop } which simplifies your development workflow." }                   
    }

       do {
        Write-Host "Please Wait...Loading Menu."
        Start-Sleep -Seconds 2
        clear # Clear the Screen-Everytime 

        
        type $ASCII.manual_install
        $pwd = Get-Location 
        $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf

       $install_options.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Manual Install"; expression={$_.Value.Name}}, @{label="Description"; expression={$_.Value.Description}} -AutoSize

        TheManualInstallPrompt


    } while ($true)

}
