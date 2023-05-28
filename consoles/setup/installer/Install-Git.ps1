function TheGitPrompt() {

        # Prompt the user for input
        $input = The-Prompt("Enter Your Choice ")
        # $input = Read-Host "Enter Your Choice (or 'e' to exit): "

                # Do something with the user's input
                # Write-Host "You entered: $input"

                switch($input) 
                {
                    0 { The-Console }
                    1 { Start-Process "https://git-scm.com/downloads" }
                    2 { winget install --id Git.Git -e --source winget }
                    3 { Write-Host "Empty Script Code" -ForegroundColor Red }
                    Default  { Write-Host "Wrong Input! " -ForegroundColor Red }
                }
}


function Install-Git() {


   clear
   type $ASCII.git_cli

   $install_options = @{
        0 = @{Name = "Home";                         Description = "Go to the Git-Website" }
        1 = @{Name = "Visit Website";                Description = "Go to the Git-Website" }
        2 = @{Name = "Install via Terminal";         Description = "For Window-11 | Choose this Straight-forward installation!" }
        3 = @{Name = "Install via ExecutableFile";   Description = "For Window-10 | Download & Install through Graphical Interface!" }
        
    }

   $install_options.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, @{label="Install Git"; expression={$_.Value.Name}}, @{label="Description"; expression={$_.Value.Description}} -AutoSize


   TheGitPrompt
}

