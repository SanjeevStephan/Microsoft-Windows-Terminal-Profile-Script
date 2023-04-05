
function Get-Directory($directory_name)
{
    # The Path to the JSON Directory Source fetched from '100AllTags.ps1'
    # Read the JSON data from the file 
    $directory_json_raw_data = Get-Content -Path $JSON.directories  -Raw
    # Convert the JSON data to a PowerShell object
    $directory_paths_array_data = ConvertFrom-Json -InputObject $directory_json_raw_data 

    if($directory_name)
    {
        # Get the path to the directory based on its name
        $directory_path_data = $directory_paths_array_data | Where-Object { $_.Name -eq $directory_name }

        $directory_path = $($directory_path_data.Path)

        # Write-Output "Directory Name : $directory_name | Path $directory_path" 

        # Check if the file exists before including it
        if (Test-Path $directory_path){ return $directory_path }
        else{ Write-Warning " $directory_name not found in the path : $directory_path" }

    } else { $directory_paths_array_data }
}


function Get-File($file_name)
{

    # Read the JSON data from the file 
    $file_json_raw_data = Get-Content -Path $directoryJsonSource  -Raw
    # Convert the JSON data to a PowerShell object
    $file_paths_array_data = ConvertFrom-Json -InputObject $file_json_raw_data 

    if($file_name)
    {
        # Get the path to the directory based on its name
        $file_path_data = $file_paths_array_data | Where-Object { $_.Name -eq $file_name }

        $file_path = $($file_path_data.Path)

        # Write-Output "Directory Name : $directory_name | Path $file_path" 

        # Check if the file exists before including it
        if (Test-Path $file_path){ return $file_path }
        else{ Write-Warning "Error: $file_name not found in the path : $file_path" }

    } else { $file_paths_array_data }
}

function Get-FileName($path){
   $filename = Split-Path -Path $path -Leaf
# $filename = [System.IO.Path]::GetFileNameWithoutExtension($path)
   return $filename
}