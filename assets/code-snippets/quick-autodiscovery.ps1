$ps = $env:powershell
# $su_json = "$ps\superuser.json"

function ReadJsonFileAtHome($JsonFile) 
{ 
    $json_file_full_path = "$ps\$JsonFile"
    return Get-Content -Raw -Path $json_file_full_path | ConvertFrom-Json 
}


$SU_JSON_Data = ReadJsonFileAtHome("superuser.json")

echo $SU_JSON_Data.info.author
echo $SU_JSON_Data.superuser.json
echo $SU_JSON_Data.directory.assets



# $AsciiJSON =  ReadJsonFileAtHome($SU_JSON_Data.file.dependency.ascii)

$Total_Scripts_to_Execute = $SU_JSON_Data.file.initialize.file.Length - 1

echo $Total_Scripts_to_Execute

for($i = 0; $i -le $Total_Scripts_to_Execute; $i++)
{
    $scripts_to_run = $SU_JSON_Data.file.initialize.file[$i].Path
    $scripts_to_run_with_full_path = "$ps\$scripts_to_run"
    echo $scripts_to_run_with_full_path
}

echo $AsciiJSON




