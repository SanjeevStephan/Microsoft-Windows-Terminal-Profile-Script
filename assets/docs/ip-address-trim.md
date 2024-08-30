#howto/network 

```Powershell
$ip_address = ipconfig | Select-String "IPv4 Address" | Select-Object -First 1 | ForEach-Object {$_.ToString().Split(":")[1].Trim() }
```


![ipconfig](https://www.bing.com/th?id=OSK.HEROBd96K07ppapDNzt9h335_XpdrnuJnjoPDPv7vRmBtcY&pid=cdx&w=320&h=189&c=7)

Explore

Certainly! Let’s break down the PowerShell command step by step:

1. **`ipconfig`**: This command retrieves network configuration information for your computer. It includes details like IP addresses, subnet masks, and more.
    
2. **`Select-String "IPv4 Address"`**: The `Select-String` cmdlet searches for the phrase “IPv4 Address” in the output of the `ipconfig` command. It looks for lines containing this phrase.
    
3. **`Select-Object -First 1`**: After finding the relevant line with the IPv4 address, we use `Select-Object` to pick the first occurrence. This ensures we get only one result.
    
4. **`ForEach-Object {$_.ToString().Split(":")[1].Trim()}`**: This part is a bit more complex. Let’s break it down further:
    
    - `$_.ToString()`: Converts the selected line (which contains the IPv4 address) into a string.
    - `.Split(":")[1]`: Splits the string using the colon (“:”) as a delimiter and selects the second part (index 1). This part contains the actual IP address.
    - `.Trim()`: Removes any extra spaces around the IP address.

So, in simple terms, the entire command assigns the first IPv4 address found by `ipconfig` to the variable `$ip_address`. It extracts the IP address from the output and removes any unnecessary spaces. 🌐💻