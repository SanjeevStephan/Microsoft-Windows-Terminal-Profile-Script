function intro(){
Write-Output "--------------------------- {TEST}-----------------------------------"
Write-Output "You have successfully accessed this script! Well Done"


Write-Output "
 _____         _     ____                               __       _
|_   _|__  ___| |_  / ___| _   _  ___ ___ ___  ___ ___ / _|_   _| |
  | |/ _ \/ __| __| \___ \| | | |/ __/ __/ _ \/ __/ __| |_| | | | |
  | |  __/\__ \ |_   ___) | |_| | (_| (_|  __/\__ \__ \  _| |_| | |
  |_|\___||___/\__| |____/ \__,_|\___\___\___||___/___/_|  \__,_|_|
"
Write-Output "--------------------------- {JSON FILE : test.json}-----------------------------------"
cat "$HOME\Documents\PowerShell\test.json"
Write-Output "--------------------------- {SCRIPT FILE : test.ps1}-----------------------------------"
}

# Read the JSON data from the file
$test_json_data = Get-Content -Path "$Home\Documents\PowerShell\test.json" -Raw

# Convert the JSON data to a PowerShell object
$test_people_array = ConvertFrom-Json -InputObject $test_json_data 

function reading_json(){

    $person = $test_people_array | Where-Object { $_.Name -eq "Stephan" }

    # Access the properties of the object
    Write-Output "Name: $($person.Name)"
    Write-Output "Age: $($person.Age)"
    Write-Output "Gender: $($person.Gender)"
    Write-Output "Profession: $($person.Profession -join ', ')"
    Write-Output "Residence: $($person.Residence)"

}
function list_json() {

    $test_people_array | Sort-Object | Format-Table @{label="Serial"; expression={$test_people_array.IndexOf($_) + 1}}, 
    @{label="Person Name"; expression={$_.Name}}, 
    @{label="Age"; expression={$_.Age}},
    @{label="Gender"; expression={$_.Gender}},
    @{label="Profession"; expression={$_.Profession}},
    @{label="Residence"; expression={$_.Residence}} -AutoSize

}
function check_json_for_name(){

    #  checking if a JSON object contains a Name property with the value 'Stephan'    
    $check_for_name = $test_people_array | Where-Object { $_.Name -eq 'Stephan' } 
    # Check if the 'Name' property contains 'Stephan'
    if ($check_for_name) {
        Write-Output "Found Stephan in the JSON data"
    } else {
        Write-Output "Did not find Stephan in the JSON data"
    }

}
function get_position_by_name() {

        $stephan_object = $test_people_array | Where-Object { $_.Name -eq 'John' }
    if ($stephan_object) {
        $position = $test_people_array.IndexOf($stephan_object) + 1
        Write-Output "Found Stephan in the JSON data at position $position"
    } else {
        Write-Output "Did not find Stephan in the JSON data"
    }

}

function initialize() {
    # clear 
    intro
    Write-Output "--------------------------- {READING JSON DATA}-----------------------------------"
    reading_json
    Write-Output "--------------------------- {LIST JSON DATA TABLE}-----------------------------------"    
    list_json
    Write-Output "--------------------------- {CHECK JSON DATA FOR NAME}-----------------------------------"  
    check_json_for_name
    Write-Output "--------------------------- {GET POSITION BY NAME}-----------------------------------"      
    get_position_by_name
}

initialize