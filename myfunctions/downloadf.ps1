function Download()
{
    $resource = Get-Clipboard
    if($resource) { Download-File($resource)} else { Write-Output "Clipboard is Empty"}
}
