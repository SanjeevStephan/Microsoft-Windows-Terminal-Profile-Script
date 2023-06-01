function lowercase() {
$clipboardText = Get-Clipboard
$modifiedText = $clipboardText.ToLower() -replace " ", "-"

Write-Host "[ Copied ] from clipboard : $clipboardText"
Write-Host "[ Pasted ] to   clipboard : $modifiedText"
Set-Clipboard -Value $modifiedText

}