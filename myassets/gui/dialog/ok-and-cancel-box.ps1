<#
.SYNOPSIS
    Display an OK and cancel dialog box with the specified message and title.

.DESCRIPTION
    This will display an OK and cancel dialog box with the specified message, title, timeout and buttons.
    Then it will store the button clicked in the $Result variable and display it using a switch statement.
#>

# Import the Presentation Framework assembly
Add-Type -AssemblyName PresentationFramework

# Create a Wscript.Shell COM object
$Shell = New-Object -ComObject Wscript.Shell

# Display an OK and cancel dialog box
$Message = "Do you want to continue?"
$Title = "Confirmation"
$Timeout = 0 # 0 means wait indefinitely
$Buttons = 1 # 1 means OKCancel buttons
$Result = $Shell.Popup($Message,$Timeout,$Title,$Buttons)

# Display the button clicked
Write-Output "You clicked $Result"

# Display the button clicked
Switch ($Result)
{
    1 {Write-Output "You clicked OK"}
    2 {Write-Output "You clicked Cancel"}
    Default {Write-Output "You did not click any button"}
}