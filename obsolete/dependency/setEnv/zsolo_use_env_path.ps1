$path = "${env:USERPROFILE}\Documents\file.txt"
$terminal = "${env:TERMINAL}\taskarray\"
$json = ${env:superuser_profile_myjson}

Write-Output "Path $json"

dir $superuser_profile_myjson
cd ${env:superuser_profile_myjson}
echo "Moved to the JSON"