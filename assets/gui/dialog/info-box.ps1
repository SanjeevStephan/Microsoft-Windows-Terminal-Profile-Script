# Import the Presentation Framework assembly
Add-Type -AssemblyName PresentationFramework

# Display an information dialog box
$Message = "This is an information dialog box"
$Title = "Information"
$Icon = [System.Windows.MessageBoxImage]::Information
[System.Windows.MessageBox]::Show($Message,$Title,$null,$Icon)

# Create a Wscript.Shell COM object
$Shell = New-Object -ComObject Wscript.Shell

# Display an information dialog box
$Message = "This is an information dialog box"
$Title = "Information"
$Timeout = 0 # 0 means wait indefinitely
$Icon = 64 # 64 means information icon
$Shell.Popup($Message,$Timeout,$Title,$Icon)