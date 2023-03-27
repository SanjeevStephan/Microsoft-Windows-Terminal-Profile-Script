# Get the path to the JSON file as an argument
$pathToJsonFile = $args[0]

# Read the contents of the JSON file
$jsonContent = Get-Content $pathToJsonFile | Out-String

# Convert the JSON string to a PowerShell object
$jsonObject = ConvertFrom-Json $jsonContent

# Output the object to the console
Write-Output $jsonObject
