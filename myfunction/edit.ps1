function edit($filename)
{
   $location = Get-Location
   powershell_ise.exe "$location\$filename"
}