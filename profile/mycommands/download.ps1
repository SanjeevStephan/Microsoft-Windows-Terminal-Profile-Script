# Use this script to move pasted image files to designated directories.

# Define a function to copy/download files from MySecondBrain based on index.
function downloadFiles($index) {

    $ip_addr = "192.168.40.95"
   #  $move_pasted_files = "Pasted*.png"

    # Define source and destination paths.
    $from_paths = @(
        "$($ip_addr):/github/hackersbrain/*" # PowerShell Vault
    )

    $to_paths = @(
        "C:\Users\Samst\OneDrive\MySecondBrain\SKILLS\Hacking"
    )

    # Display source and destination paths.
    Write-Host "From Paths : " $from_paths[$index]
    Write-Host "To Paths : " $to_paths[$index]

    # Check if both source and destination paths exist.
    #     if((Test-Path $from_paths[$index]) -and (Test-Path $to_paths[$index])) {
    if(Test-Path $to_paths[$index]) {
        echo "Path : $("$($from_paths[$index])" + " => " + $to_paths[$index])"
        #  echo "Path : $("$($from_paths[$index])\$move_pasted_files" + " " + $to_paths[$index])"
        # Move files to the destination directory.
      #  mv "$($from_paths[$index])\$move_pasted_files" $to_paths[$index] -Verbose
       # cp "$($from_paths[$index])" $to_paths[$index] -Recurse -force -Verbose 


       scp -i "C:\Users\Samst\.ssh\kali_linux_id_rsa" -r "cipher@$($ip_addr):/github/hackersbrain/*" $to_paths[$index]


    } else { 
        Write-Host "Mentioned Directory Doesn't Exist"
    }
}

# Define a function to perform the task.
function download() {
    do {
        # Define tasks for Obsidian vault paths.
        $obsidian_vault_paths = @{
             1 = @{Vault = "Hackerbrain Vault (Kali Linux)"; Task="download MySecondBrain (Window Machine)"}
       #     2 = @{Vault = "Creator-Mind"; Task="Move the Pasted Images to /Assets/screenshots-copy-paste-images"}
       #     3 = @{Vault = "How-Money-Works"; Task="Move the Pasted Images to /assets/screenshots"}
       #     4 = @{Vault = "MySecondBrain (Google-Drive)"; Task="Move the Pasted Images to /assets/screenshots"}
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
             1 {  downloadFiles(0) }
         #   2 {  downloadFiles(1) }
         #   3 {  downloadFiles(2) }
         #   4 {  downloadFiles(3) }
            Default { Write-Host "Option not defined in switch. Sorry!"}
        }
    
    } while([String]::IsNullOrEmpty($input)) # Continue if empty; quit if not empty.
}
