# Display a saveFile Dialog
Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.SaveFileDialog
$dialog.Filter = "All files (*.*)|*.*"
$dialog.ShowDialog()

# Send text to the save dialog's input box
$text = "hello-world.txt"


# Display a saveFile Dialog
Add-Type -AssemblyName System.Windows.Forms

$dialog = New-Object System.Windows.Forms.SaveFileDialog
$dialog.FileName = $text
$dialog.Filter = "All files (*.*)|*.*"

# Set the text for the save dialog's input box


#[System.Windows.Forms.SendKeys]::SendWait($text)
$dialog.ShowDialog()

