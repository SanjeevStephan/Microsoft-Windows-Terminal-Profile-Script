# Set the path to the directory
$dirtoscan = "C:\Users\Sanju\Documents\PowerShell\myfunction"
$dirPath = "C:\Users\Sanju\Documents\PowerShell\myjson\jsontest"

# Get all the files in the directory and append their names and paths to an array
$files = Get-ChildItem $dirtoscan | Where-Object { !$_.PsIsContainer } | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Path = $_.FullName
    }
}

# Load the JSON file as an object
$jsonFilePath = "$dirPath\profileFunctions.json"
$json = Get-Content $jsonFilePath -Raw | ConvertFrom-Json

# Loop through each file in the array of files and compare its name to the "File" property of each object in the JSON array
# If a match is found, append the file's name and path to the object
foreach ($file in $files) {
    $match = $json | Where-Object { $_.File -eq $file.Name }
    if ($match) {
        $match.Name = $match.Name
        $match.Path = $file.Path
    }
}

# Convert the modified JSON object to JSON and save it to the same file
$json | ConvertTo-Json | Out-File $jsonFilePath

