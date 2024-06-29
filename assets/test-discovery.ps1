# Set the path to the "auto" directory
$autoDir = "C:\Users\Samst\OneDrive\Documents\PowerShell\profile\auto"

# Get all the PS1 files in the "auto" directory
$ps1Files = Get-ChildItem -Path $autoDir -Filter *.ps1

# Loop through each PS1 file and execute it
foreach ($ps1File in $ps1Files) {
    # Output a message indicating which file is being executed
    Write-Host "Executing $($ps1File.FullName)"

    # Execute the PS1 file
   # & $ps1File.FullName

. $ps1File
}