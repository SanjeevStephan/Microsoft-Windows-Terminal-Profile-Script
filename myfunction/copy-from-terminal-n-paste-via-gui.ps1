function copythis($copyFile){
$currentLocation = Get-Location
$dest = "D:\"
$trimmedFileName = $copyFile.Replace(".\","").Replace("\","")
Write-Output "File : $trimmedFileName"

# Copy a file from terminal
$source = "$currentLocation\$trimmedFileName"
Set-Clipboard $source

    [System.Windows.Forms.SendKeys]::SendWait($trimmedFileName)

    # Display a saveFile Dialog to paste via GUI
    Add-Type -AssemblyName System.Windows.Forms
    $dialog = New-Object System.Windows.Forms.SaveFileDialog
    $dialog.Filter = "All files (*.*)|*.*"

    $dialog.ShowDialog()
    [System.Windows.Forms.SendKeys]::SendWait($text)
    if ($dialog.ShowDialog() -eq "OK")
    {
        Copy-Item -Path $source -Destination $dialog.FileName
        Write-Host "File : $copyFile Successfully Copied to Path : $($dialog.FileName)"
    }
}
