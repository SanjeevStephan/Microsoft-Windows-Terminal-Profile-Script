function edit($powershell_file)
{
    $location = Get-Location # current working directory of the powershellfile.
    powershell_ise.exe "$location\$powershell_file"
}