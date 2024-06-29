![PowerShell](https://www.bing.com/th?id=OSK.HEROBKbgBizc3c6RryDkwQNXIeWdxHXnbw4xrLfm9a_JVdQ&pid=cdx&w=320&h=189&c=7)

Explore

To execute a script from within another PowerShell script, you have a few options:

1. **Using the Call Operator (&)**: The simplest method is to use the call operator `&`. This allows you to run the target script as if it were a command or function, and you can pass arguments if necessary. For example:
    
    ```powershell
    & .\myScript1.ps1
    ```
    
    Replace `.\\myScript1.ps1` with the actual path to your script.
    
2. **Using the Automatic Variable `$PSScriptRoot` (PowerShell 3.0 and later)**: If both scripts are in the same directory, you can use the automatic variable `$PSScriptRoot` to reference the current script’s location. For instance:
    
    ```powershell
    $PSScriptRoot\myScript1.ps1
    ```
    
3. **Using the `Split-Path` Property (PowerShell 1.0 and 2.0)**: In older versions of PowerShell, you can use the following syntax:
    
    ```powershell
    & "$(Split-Path $MyInvocation.MyCommand.Path)/myScript1.ps1"
    ```
    

Remember to adjust the paths and filenames according to your actual script locations. These methods allow you to execute one script from within another, whether they are in the same directory or not. Happy scripting! 🚀🔍

[](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise)[1](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise): [](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise)[2](https://locall.host/how-to-call-a-powershell-script-from-powershell/): [](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise)[3](https://stackoverflow.com/questions/2035193/how-to-run-a-powershell-script): [](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise)[4](https://jeffbrown.tech/powershell-scripting/): [](https://stackoverflow.com/questions/6816450/call-powershell-script-ps1-from-another-ps1-script-inside-powershell-ise)[5](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scripts?view=powershell-7.4):