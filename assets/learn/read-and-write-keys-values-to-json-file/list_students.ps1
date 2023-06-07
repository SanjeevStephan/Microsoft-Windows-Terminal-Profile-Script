$location = Get-Location
$jsonfile = "student_list.json"
$fpath = "$location\$jsonfile"
$json_data = Get-Content -Raw $fpath | ConvertFrom-Json
function list_from_json() {
    Write-Host "List of Student Names From Json-File : $jsonfile"

    $total_student = $json_data.student.Length - 1
    echo "Total Student : $total_student"
    for($i = 0 ; $i -le $total_student  ; $i++)
    {
        Write-Host "[$i] Student Name : $($json_data.student[$i].name)"
    }
}

function change_student_name($newName) {

    # First Read the json file and convert it to a hashtable
    # -> see line no : 4
    Write-Host "Changing Name : $($json_data.student[2].name) => $newName"
    # Write a new value to the key named 'student'
    $json_data.student[2].name = $newName 

    # Convert the hashtable back to json and write it to the file
    $json_data | ConvertTo-Json | Set-Content -Path $jsonfile
    Start-Sleep 1
}

function check_for_key($findName){
    "Check for $findName"
    # if ($json_data.student.Keys -contains $findName) {
    #     Write-Output "The value of $findName key is $($hashtable.student.Keys)"
    # }

    # foreach ($h in $json_data.GetEnumerator()) {
    #     Write-Output "$($h.Name) : $($h.Value)"
    # }

}

list_from_json
change_student_name("Sanjeev Stephan Murmu")
list_from_json
change_student_name("Alice in Wonderland")

list_from_json
check_for_key("Alice")
