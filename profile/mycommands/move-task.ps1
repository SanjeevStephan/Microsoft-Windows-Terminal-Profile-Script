# Use this script to move pasted image files to designated directories.

# Define a function to move files based on index.
function moveFiles($index) {
    $move_pasted_files = "Pasted*.png"

    # Define source and destination paths.
    $from_paths = @(
        "C:\Users\Samst\OneDrive\Documents\PowerShell", # PowerShell Vault
        "E:\OBSIDIAN\CREATOR-MIND",                     # Creator-Mind
        "C:\Users\Samst\OneDrive\Documents\Obsidian Vault\MySecondBrain-onAndroid\desktop-notes\how-money-works", # How-Money-Works
        "E:\OBSIDIAN\MySecondBrain", # MySecondBrain-onAndroid
        "C:\Users\Samst\OneDrive\MySecondBrain"
    )

    $to_paths = @(
        "C:\Users\Samst\OneDrive\Documents\PowerShell\assets\screenshots",
        "E:\OBSIDIAN\CREATOR-MIND\Assets\screenshots-copy-paste-images",
        "C:\Users\Samst\OneDrive\Documents\Obsidian Vault\MySecondBrain-onAndroid\desktop-notes\how-money-works\assets\screenshots",
        "E:\OBSIDIAN\MySecondBrain\assets\screenshots", # MySecondBrain-onAndroid's Assets
        "C:\Users\Samst\OneDrive\MySecondBrain\assets\screenshots"
    )

    # Display source and destination paths.
    Write-Host "From Paths : " $from_paths[$index]
    Write-Host "To Paths : " $to_paths[$index]

    # Check if both source and destination paths exist.
    if((Test-Path $from_paths[$index]) -and (Test-Path $to_paths[$index])) {
        echo "Path : $("$($from_paths[$index])\$move_pasted_files" + " " + $to_paths[$index])"
        # Move files to the destination directory.
        mv "$($from_paths[$index])\$move_pasted_files" $to_paths[$index] -Verbose
    } else { 
        Write-Host "Mentioned Directory Doesn't Exist"
    }
}

# Define a function to perform the task.
function move-task() {
    do {
        # Define tasks for Obsidian vault paths.
        $obsidian_vault_paths = @{
            1 = @{Vault = "PowerShell"; Task="Move the Pasted Images to /assets/screenshots"}
            2 = @{Vault = "Creator-Mind"; Task="Move the Pasted Images to /Assets/screenshots-copy-paste-images"}
            3 = @{Vault = "How-Money-Works"; Task="Move the Pasted Images to /assets/screenshots"}
            4 = @{Vault = "MySecondBrain (Google-Drive)"; Task="Move the Pasted Images to /assets/screenshots"}
            5 = @{Vault = "MySecondBrain (Microsoft-OneDrive)"; Task="Move the Pasted Images to /assets/screenshots"}
        }

        # Display tasks.
        $display_task = $obsidian_vault_paths.GetEnumerator() | Sort-Object | Format-Table @{Label="S.No";Expression={$_.Key}},
                                                                                           @{Label="Vault Name";Expression={$_.Value.Vault}},
                                                                                           @{Label="Task to Perform"; Expression={$_.Value.Task}} -AutoSize
        echo $display_task
        $input = Read-Host "Which Task to Perform (1 - 9): "
        echo $input

        # Perform the task based on user input.
        switch($input) {
            1 {  moveFiles(0) }
            2 {  moveFiles(1) }
            3 {  moveFiles(2) }
            4 {  moveFiles(3) }
            5 {  moveFiles(4) }
            Default { Write-Host "Option not defined in switch. Sorry!"}
        }
    
    } while([String]::IsNullOrEmpty($input)) # Continue if empty; quit if not empty.
}
