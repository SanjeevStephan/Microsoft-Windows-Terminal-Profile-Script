function convertjson($JsonFile)
{
    $current_path = Get-Location
    $json_file_full_path = "$current_path\$JsonFile"
    $converted_data = Get-Content -Raw -Path $json_file_full_path | ConvertFrom-Json
    Write-Output "Successfully Coverted to PowerShell OBJECT Data"
    Write-Output $converted_data
    return $converted_data
}