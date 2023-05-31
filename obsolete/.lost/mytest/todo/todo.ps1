$directoryJsonPathSource = ".\tasks.json"

$paths_json_raw_data = Get-Content -Path $directoryJsonPathSource  -Raw

# Convert the JSON data to a PowerShell object
$tasks = ConvertFrom-Json -InputObject $paths_json_raw_data



function loadMyJson() {


<#
$tasks | Sort-Object | Format-Table @{label="S.No"; expression={$tasks.IndexOf($_) + 1}},
                @{label="Directory"; expression={$_.TaskDate}},
                #@{label="Directory"; expression={$_.Directory}},
                #@{label="Path"; expression={$_.Path}},
                @{label="Description"; expression={$_.TaskDescription}} -AutoSize
#>

<#
 # Read the contents of the JSON file into a PowerShell object
$tasks = Get-Content -Path ".\tasks.json" | ConvertFrom-Json

 # Create a hashtable to store the dependencies
    $mytask_hashtable = @{}

# Loop through each task in the JSON object and add it to the dependencies hashtable
    foreach ($task in $mytask_hashtable) {
        $mytask_hashtable[$task.Name] = "$($task.TaskDate)"

        Write-Host "[ OK ] Included : Tasks => { $($task.TaskDescription) }  Successfully"  -ForegroundColor Green
        #Write-Output "Added : $mytask_hashtable[$task.Name] = $mytaskSource\$($task.File) `n"
    }


$mytask_hashtable | Sort-Object | Format-Table @{label="S.No"; expression={$mytask_hashtable.IndexOf($_) + 1}},
                @{label="Directory"; expression={$_.TaskDate}},
                #@{label="Directory"; expression={$_.Directory}},
                @{label="Description"; expression={$_.TaskDescription}} -AutoSize   
                
                #> 


    if ($tasks.Count -eq 0) {
        Write-Host "No tasks found." -ForegroundColor Yellow
    } else {
        Write-Host "Task List:" -ForegroundColor Green
        for ($i=0; $i -lt $tasks.Count; $i++) {
            $task = $tasks[$i]
            $taskNumber = $task.TaskNumber
            $taskDate = Get-Date $task.TaskDate -Format "yyyy-MM-dd"
            $taskDescription = $task.TaskDescription
            Write-Host "$taskNumber. [$taskDate] $taskDescription"
        }
    }
}
loadMyJson

# Define a task to save the tasks to a JSON file
function SaveTasks {
    $tasks | ConvertTo-Json | Out-File -FilePath ".\tasks.json" -Encoding utf8
}

# Define a task to load the tasks from a JSON file
function LoadTasks {
    if (Test-Path -Path ".\tasks.json") {
        try {
            $tasks = Get-Content -Path ".\tasks.json" -Raw | ConvertFrom-Json
        } catch {
            Write-Host "Error loading tasks from JSON file: $_" -ForegroundColor Red
            return
        }
    } else {
        Write-Host "JSON file not found." -ForegroundColor Yellow
        return
    }
}

# Check if the $tasks array is empty, and create a new empty array if it is
if ($tasks -eq $null) {
    $tasks = @()
}

# Load the tasks from the JSON file
LoadTasks

# Define a task to display the tasks
function ShowTasks {
    if ($tasks.Count -eq 0) {
        Write-Host "No tasks found." -ForegroundColor Yellow
    } else {
        Write-Host "Task List:" -ForegroundColor Green
        for ($i=0; $i -lt $tasks.Count; $i++) {
            $task = $tasks[$i]
            $taskNumber = $task.TaskNumber
            $taskDate = Get-Date $task.TaskDate -Format "yyyy-MM-dd"
            $taskDescription = $task.TaskDescription
            Write-Host "$taskNumber. [$taskDate] $taskDescription"
        }
    }
}

# Define a task to add a task
function AddTask {
    $task = [PSCustomObject]@{
        TaskNumber = $tasks.Count + 1
        TaskDate = Get-Date
        TaskDescription = Read-Host "Enter the task description"
    }
    $tasks += $task
    SaveTasks
}

# Define a task to modify a task
function ModifyTask {
    ShowTasks
    $taskIndex = Read-Host "Enter the index of the task to modify"
    if ([int]::TryParse($taskIndex, [ref]$null) -and $taskIndex -gt 0 -and $taskIndex -le $tasks.Count) {
        $newTaskDescription = Read-Host "Enter the new task description"
        $tasks[$taskIndex-1].TaskDescription = $newTaskDescription
        SaveTasks
    } else {
        Write-Host "Invalid task index" -ForegroundColor Red
    }
}

# Define a task to remove a task
function RemoveTask {
    ShowTasks
    $taskIndex = Read-Host "Enter the index of the task to remove"
    if ([int]::TryParse($taskIndex, [ref]$null) -and $taskIndex -gt 0 -and $taskIndex -le $tasks.Count) {
        $tasks = $tasks | Where-Object { $_ -ne $tasks[$taskIndex-1] }
        $tasks | ForEach-Object { $_.TaskNumber = $_.TaskNumber - 1 }
        SaveTasks
    } else {
        Write-Host "Invalid task index" -ForegroundColor Red
    }
}


# Display a menu of options
$continue = $true
while ($continue) {
    Write-Host "TODO List Menu:" -ForegroundColor Cyan
    Write-Host "1. Show tasks"
    Write-Host "2. Add task"
    Write-Host "3. Modify task"
    Write-Host "4. Remove task"
    Write-Host "5. Quit"
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        1 { ShowTasks }
        2 { AddTask }
        3 { ModifyTask }
        4 { RemoveTask }
        5 { $continue = $false }
        default { Write-Host "Invalid choice" -ForegroundColor Red }
    }
}