![[Pasted image 20240407180849.png]]

```PowerShell
$ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object {$_.ToString().Split(":")[1].Trim() }

function prompt($display_msg) {
    $location = Get-Location

    $computer_name = $env:COMPUTERNAME

    Write-Host '┌──(' -NoNewline -ForegroundColor Green

    Write-Host $computer_name -NoNewline -ForegroundColor Yellow

    Write-Host '㉿' -NoNewline -ForegroundColor Red

    Write-Host "$ip_address" -NoNewline -ForegroundColor Blue

    Write-Host ")-[$location]" -ForegroundColor Green

    Write-Host '└─$ ' -NoNewline -ForegroundColor Green
}
```

Certainly! Let’s break down the PowerShell script step by step:

1. **`$ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object {$_.ToString().Split(":")[1].Trim() }`**:
    
    - This line of code retrieves the **IPv4 address** of your computer using the `ipconfig` command.
    - Here’s how it works:
        - `ipconfig`: Executes the `ipconfig` command, which displays information about your network configuration.
        - `Select-String "IPv4 Address"`: Filters the output to find lines containing the phrase “IPv4 Address.”
        - `Select-Object -First 1`: Selects the first occurrence (usually the primary network adapter) from the filtered results.
        - `ForEach-Object {$_.ToString().Split(":")[1].Trim() }`: Converts the selected line to a string, splits it at the colon (“:”) character, and trims any leading or trailing spaces. The result is assigned to the `$ip_address` variable.
2. **`function prompt($display_msg) { ... }`**:
    
    - This defines a custom function named `prompt`.
    - The purpose of this function is to create a custom command prompt display with additional information.
    - Let’s break down the components:
        - `$location = Get-Location`: Retrieves the current directory location.
        - `$computer_name = $env:COMPUTERNAME`: Gets the computer name from the environment variables.
        - The custom prompt format:
            - Begins with a green arrow (`┌──(`).
            - Displays the computer name in yellow.
            - Includes a red lightning bolt (`㉿`).
            - Shows the IPv4 address in blue.
            - Indicates the current location (directory) in green.
            - Ends with a green dollar sign (`└─$`).
3. **Usage**:
    
    - When you run this script, it will set the `$ip_address` variable to your computer’s IPv4 address.
    - The custom prompt function will display the formatted prompt with the relevant information.

Remember to execute this script in a PowerShell environment to see the custom prompt in action! 🚀