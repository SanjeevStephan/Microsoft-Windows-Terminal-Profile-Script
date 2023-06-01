# Set the path to the directory
$dirPath = "C:\Users\Sanju\Documents\PowerShell\myfunction"

# Get all the files in the directory and display their names and paths in the desired format
Get-ChildItem $dirPath | Where-Object { !$_.PsIsContainer } | ForEach-Object {
    Write-Host "File : $($PSItem.Name) | Path : $($PSItem.FullName)"
}

