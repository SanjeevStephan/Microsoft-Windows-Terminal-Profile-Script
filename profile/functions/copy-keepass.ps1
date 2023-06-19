function keepass(){
    $text = $env:key_keepass
    Set-Clipboard $text 
    $isCopied = Get-Clipboard
    if($isCopied -eq $text)
    {
        Write-Host "Successfully Copied [ KeePass ] Key to Clipboard "
    }
    else {   Write-Host "Failed to  Copy [ KeePass ] Key to Clipboard " }
}