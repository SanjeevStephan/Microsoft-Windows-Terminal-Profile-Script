# Set the path to the directory
$dirPath = "C:\Users\Sanju\Documents\PowerShell\myjson\jsontest"
$fileDirtoscan = "C:\Users\Sanju\Documents\PowerShell\myfunction"

# Get all the files in the directory and display their names and paths in the desired format
Get-ChildItem $fileDirtoscan | Where-Object { !$_.PsIsContainer } | ForEach-Object {
    Write-Host "File : $($PSItem.Name) | Path : $($PSItem.FullName)"

        [PSCustomObject]@{
        Name = "$($PSItem.Name)"
        Path = "$($PSItem.FullName)"
    }


}

# Load the JSON file as an object
$jsonFilePath = "$dirPath\profileFunctions.json"
$json = Get-Content $jsonFilePath -Raw | ConvertFrom-Json

# Loop through each object in the JSON array and compare its "Name" property with the file names in the array
# If a match is found, append the "Desc" and "Syntax" properties to a new array
$newJson = foreach ($obj in $json) {
    $match = $files | Where-Object { $_.Name -eq $obj.File }
    if ($match) {
        [PSCustomObject]@{
            Name = $obj.Name
            Path = $match.Path
            Desc = $obj.Desc
            Syntax = $obj.Syntax
        }
        # Write-Output "FOund : 
    }
}

# Convert the new array to JSON and save it to a new file named "newfunctions.json"
$newJson | ConvertTo-Json | Out-File "$dirPath\newfunctions.json"
