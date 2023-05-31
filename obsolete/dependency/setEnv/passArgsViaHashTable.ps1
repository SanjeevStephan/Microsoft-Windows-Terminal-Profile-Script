<# 
You can loop through the keys of the hashtable using a foreach loop and display each key, which represents the file name, using the Write-Host cmdlet. Here's an example:
#>

$files = @{
    "myjson"      = "C:\Users\Sanju\Documents\PowerShell\myjson"
    "myjson2"      = "C:\Users\Sanju\Documents\PowerShell\myjson2"
}

foreach ($key in $files.Keys) {
	$value = $files[$key]
	# & "1_add_variable_to_environment.ps1" -Key $key -Value $value
	.\argsAddVariableToEnv.ps1 $key $value
	Write-Host "Added Key : $key and Value : $value to the env"
	Start-Sleep -Seconds 1
}
