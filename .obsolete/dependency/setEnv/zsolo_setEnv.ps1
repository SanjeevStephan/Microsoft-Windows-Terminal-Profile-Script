
function setEnv($key, $value) {
    [Environment]::SetEnvironmentVariable($key, $value, "User")


}
function checkEnv()
{
    if (getEnv($key)) {
        Write-Host "[True] The $key environment variable already exist."       
   } else {
        Write-Host "[False] The $key environment variable does not exist."
       #setEnv($key, $value)
       #Write-Host "The $key environment variable has been set to $value."
   }
   
}


# setEnv("MyJson","C:\Users\Sanju\Documents\PowerShell\myjson\")
setx /m MyJson "C:\Users\Sanju\Documents\PowerShell\myjson"
<#

$key = "terminalf"
$value = "D:\terminal"


#>
