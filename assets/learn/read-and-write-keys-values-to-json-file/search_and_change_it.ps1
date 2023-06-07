# Based on web search results, one possible way to write a PowerShell script to find “Alice” from file name ‘$jsonfile’ 
# whose contents are ->{ “student”: [ { “name”: “Sanjeev Stephan Murmu” }, { “name”: “Sanju Murmu” }, 
#{ “name”: “Alice in Wonderland” }, { “name”: “Keren Elazari” } ] } and change it to ‘Harry’ and 
#display it is to use the Get-Content, ConvertFrom-Json, ConvertTo-Json and Set-Content cmdlets. For example:
param(
    [string]$oldName,
    [string]$newName
)


# function filter_and_change_name() {
    $location = Get-Location
$jsonfile = "student_list.json"
$fpath = "$location\$jsonfile"
#$json_data = Get-Content -Raw $fpath | ConvertFrom-Json

# Read the json file and convert it to a hashtable
$hashtable = Get-Content -Path $jsonfile | ConvertFrom-Json

Write-Host "Changing Name : $oldName => $newName"

# Loop through the student array and find the one with name containing 'Alice'
foreach ($student in $hashtable.student) {
    if ($student.name -like "*$oldName*") {
        # Change the name to '$newName'
        $student.name = $newName
    }
}

# Convert the hashtable back to json and display it
$hashtable | ConvertTo-Json

# Optionally, write the updated json back to the file
$hashtable | ConvertTo-Json | Set-Content -Path $jsonfile
# This will update the name of the student with ‘Alice’ in it to ‘Harry’ and display the updated json.
# It will also overwrite the original json file with the updated one if the last line is uncommented.
# }

# filter_and_change_name("Harry","Robert")