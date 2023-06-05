
<#
PowerShell script to check if the remote file is available online and download it.
use the Invoke-WebRequest cmdlet with the -Method Head parameter to check if the remote file URL returns a valid response, 
and then use the same cmdlet with the -OutFile parameter to download it if it does.
#>

$confirm = $Settings_JSON.session.connect
if($confirm -eq "YES")
{
    Write-Host "|    |          |        |    |     ├──[ ACCESS ] Grantd" -ForegroundColor Cyan
    # Source URL
    $url =  "$($Settings_JSON.session.url)/$($Settings_JSON.session.file)"
    echo : "URL : $url"

    # Destination file
    $dest = "$($Settings_JSON.session.save)\$($Settings_JSON.session.file)"
    echo "DEST : $dest"
    # Download the file

    # Check if the remote file is available online
    if ((Invoke-WebRequest -Uri $url -Method Head).StatusCode -eq 200) 
    {
        Write-Host "|    |          |        |    |     ├──[ Update ] Available"
        Invoke-WebRequest -Uri $url -OutFile $dest
    } else {  Write-Host "|    |          |        |    |     ├──[ Update ] Not-Available " }

    # Execute the file
    if(Test-Path $dest) { Write-Host "|    |          |        |    |     ├──[ SESION ] Started" ; Start-Process -FilePath $dest ;} else { Write-Host "|    |          |        |    |     ├──[ SESION ] Not Started"}
} else {  Write-Host "|    |          |        |    |     ├──[ ACCESS ] Denied" -ForegroundColor Red}

