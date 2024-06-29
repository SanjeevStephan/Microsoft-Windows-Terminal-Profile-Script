$current_location = Get-Location

$sample_json = "$current_location\sample.json"
 $json_data = Get-Content -Raw -Path $sample_json | ConvertFrom-Json

echo $json_data

