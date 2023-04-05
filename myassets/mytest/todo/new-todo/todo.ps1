Clear
Figlet "todo tasks"

# Set the path to the directory
$dirPath = "C:\Users\Sanju\Documents\todo\new-todo"

# Load the tasks from the JSON file if it exists, or create an empty array
if (Test-Path "$dirPath\tasks.json") {
    $tasks = Get-Content "$dirPath\tasks.json" -Raw | ConvertFrom-Json
} else {
    $tasks = @()
}

function Add_Task(){
            # Get the task name and add it to the array
            $taskName = Read-Host "Enter the task name"
            $tasks += [PSCustomObject]@{
                Name = $taskName
                Completed = $false
            }
            #Save_Task
            Write-Host "Task '$taskName' added."
}
function Show_Task() {
         # Display the tasks in the array
            if ($tasks) {
                $tasks | ForEach-Object {

                    <#
                    $status = if ($_.Completed) { "Completed" } else { "Incomplete" }
                    Write-Host "Task: $($_.Name) | Status: $status"
                    #>

                }

                $tasks | Sort-Object | Format-Table @{label="S.No"; expression={$tasks.IndexOf($_) + 1}},
                @{label="Task Name"; expression={$_.Name}},
                #@{label="Directory"; expression={$_.Directory}},
                @{label="Status"; expression={$_.Completed}} -AutoSize 
                 
            } else { Write-Host "No tasks to display." }





}
Show_Task
function Modify_Task(){
# Get the index of the task to modify and the new task name
            $index = Read-Host "Enter the index of the task to modify"
            $newTaskName = Read-Host "Enter the new task name"

            # Modify the task name in the array
            if ($index -lt $tasks.Count) {
                $tasks[$index].Name = $newTaskName
                #Save_Task
                Write-Host "Task updated."
            } else {
                Write-Host "Invalid index."
            }
}
function Remove_Task(){
            # Get the index of the task to remove and remove it from the array
            $index = Read-Host "Enter the index of the task to remove"
            if ($index -lt $tasks.Count) {
                $tasks = $tasks[0..($index-1)] + $tasks[($index+1)..($tasks.Count-1)]
                #Save_Task
                Write-Host "Task removed."
            } else {
                Write-Host "Invalid index."
            }
}
function Save_Task(){ 
            # Convert the tasks array to JSON and save it to the JSON file
            $tasks | ConvertTo-Json | Out-File "$dirPath\tasks.json"
            Write-Host "[ OK ] Task Saved Successfully" -ForegroundColor Green
}
function Quit_TODO(){
            
            Write-Host "Exiting TODO list."
            $continue = $false
            break
}
# Loop to get user input and perform actions until the user chooses to quit
# Display a menu of options
$continue = $true
while ($continue) {
    # Display the menu options
    Write-Host "TODO List Options:"
    Write-Host "1. Add Task"
    Write-Host "2. Show Tasks"
    Write-Host "3. Modify Task"
    Write-Host "4. Remove Task"
    Write-Host "5. Save The Tasks"
    Write-Host "6. Quit"

    # Get the user's choice
    $choice = Read-Host "Enter an option number (1-6)"

    # Perform the action based on the user's choice
    switch ($choice) 
    {
        1 {  Add_Task }
        2 {  Show_Task }
        3 {  Modify_Task }
        4 {  Remove_Task }
        5 {  Save_Task } 
        6 { $continue = $false }
        default { Write-Host "Invalid choice. Please choose a valid option." }
    }
}

