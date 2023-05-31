function copyFrom($copyFile,$dest){
$currentLocation = Get-Location

$trimmedFileName = $copyFile.Replace("./","").Replace("/","")
Write-Output $trimmedFileName


$source = "$currentLocation\$trimmedFileName"
$objShell = New-Object -ComObject "Shell.Application"
$objFolder = $objShell.NameSpace($dest)
$objFolder.CopyHere($source)
Write-Output "File [$coyFile] Copied Successfully"
}