<#
  ____      _     ____       _   _     
 / ___| ___| |_  |  _ \ __ _| |_| |__  
| |  _ / _ \ __| | |_) / _` | __| '_ \ 
| |_| |  __/ |_  |  __/ (_| | |_| | | |
 \____|\___|\__| |_|   \__,_|\__|_| |_|  v1.0 | 26th-March-2023
                                      
                                                     
.SYNOPSIS
    function to getfunction other PowerShell functions as dependencies

.DEfunctionION
    Execute the function_files that are 'getfunctiond' in this 'profile_getfunction.ps1' function

.NOTES
    AUTHOR
        -Sanjeev Stephan Murmu
    function
        -profile_getfunction.ps1
    VERSION
        -v1.0    

#-------------------- getFunction.ps1 --------------------------------------#>
# Read the JSON data from the file
$functionJsonFilePath = "$Home\Documents\PowerShell\myjson\profileFunctions.json"

$function_json_raw_data = Get-Content -Path $functionJsonFilePath -Raw

# Convert the JSON data to a PowerShell object
$function_array_data = ConvertFrom-Json -InputObject $function_json_raw_data 

#-------------------- Functions {Read-Only | Don't Modify unless u know what u are doing}--------------
# Function to getfunction by specifying function name
function Get-Function($function_name)
{
    # Filter 'function-Name' in the array and store as $function_array_data
    $function_array_data = $function_array_data | Where-Object { $_.Name -eq $function_name }
    
    # Get the path to the function based on its name
    $function_path = $($function_array_data.Path)

    # Check if the file exists before including it
    if (Test-Path $function_path){ return $function_array_data }
    else{ Write-Output "Error: $function_name not found in JSON List 'functions.json"  }   
}
# Define the function that reads a JSON file
function Get-FunctionFromJSON($filename) {
    $content = Get-Content $filename -Raw | ConvertFrom-Json
    return $content
}
function Check-Function(){
Write-Output "[ OK ] Dependency : getfunction.ps1 => Included { 4 } Functions Successfully"
# Read the 'functions.json' file
$jsonSource = "$Home\Documents\PowerShell\myjson\profileFunctions.json"
$functions = Get-FunctionFromJSON $jsonSource

    if(Test-Path $jsonSource)
    {
            # Loop through each function in the file
        foreach ($function in $functions) 
        {
            # Call the function without passing any arguments
            $result = & $function.Path

            # Check if the function returned true
            if($result -eq $true)
            {
                $status = "Success"
            }
            else
            {
                $status = "Failed"
            }

            # Output the result
            Write-Output "Function Name : $($function.Name) [$status]"
        }

    }  else { Write-Warning "Invalid Path $jsonSource"}

}

# Function to filter data from the JSON File 'functions.json' based on the specified '$column_name
function List-Function($column_name){
<#
   Function to display only specified '$column_name' 
#>
    switch($column_name)
    {

        "name"
        {
            if($($TABLE[7]["Status"]) -eq "enable") 
            {  
                $function_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$function_array_data.IndexOf($_) + 1}}, 
                @{label="Function Name"; expression={$_.Name}} -AutoSize
            } 
            else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }  
        }
        "desc"
        {
            if($($TABLE[7]["Status"]) -eq "enable") 
            {  
                $function_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$function_array_data.IndexOf($_) + 1}}, 
                @{label="Function Name"; expression={$_.Name}}, 
                @{label="Description"; expression={$_.Desc}} -AutoSize
            } 
            else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }           
        }

        "path"
        {
            if($($TABLE[7]["Status"]) -eq "enable") 
            {  
                $function_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$function_array_data.IndexOf($_) + 1}}, 
                @{label="Function Name"; expression={$_.Name}}, 
                @{label="Path"; expression={$_.Path}} -AutoSize
            } 
            else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
        }
        "param"
        {
            if($($TABLE[7]["Status"]) -eq "enable") 
            {  
                $function_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$function_array_data.IndexOf($_) + 1}}, 
                @{label="Function Name"; expression={$_.Name}}, 
                @{label="Argument"; expression={$_.Argument}},
                @{label="Parameter"; expression={$_.Parameter}},
                @{label="Description"; expression={$_.Desc}} -AutoSize
            } 
            else { <# Write-Output "[] 'Enable' the 'show_all_paths' in the $config_file" #> }
        }      
        "all"
        {
            $function_array_data | Sort-Object | Format-Table @{label="S.No"; expression={$function_array_data.IndexOf($_) + 1}}, 
            @{label="Function Name"; expression={$_.Name}}, 
            @{label="Path"; expression={$_.Argument}},
            @{label="Path"; expression={$_.Parameter}},
            @{label="Path"; expression={$_.Syntax}},
            @{label="Description"; expression={$_.Desc}} -AutoSize
        }  
        Default 
        {
            Write-Output "1. Show MyFunctions"
            Write-Output "2. Show Profile-Functions"
            $chooce = Read-Host "Please Choose Your Option (1-2) : "
            switch($chooce)
            {
                "1" { $functionJsonFilePath = $JSON[3]["Path"] }
                "2" { $functionJsonFilePath = $JSON[7]["Path"] }
                Default { Write-Output "You have Entered '$choose' which is invalid | Try (1 or 2)"}
            }

            $function_json_raw_data = Get-Content -Path $functionJsonFilePath -Raw

            # Convert the JSON data to a PowerShell object
            $function_array_data = ConvertFrom-Json -InputObject $function_json_raw_data 
            $function_array_data
        }
    }


}
function Run-thisFunction() {

<#
    Check-Function
    getfunction("test")
#>   
    List-Function("all") 

}

Run-thisFunction