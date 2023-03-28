$path = "${env:USERPROFILE}\Documents\file.txt"
$terminal = "${env:TERMINAL}\taskarray\"

Write-Output "Path $path"

dir $terminal
cd ${env:TERMINAL}
echo "Moved to the Terminal"