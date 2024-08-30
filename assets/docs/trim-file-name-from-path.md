#howto/script 

Certainly! Let’s break down the given PowerShell code step by step:
```powershell
$fail_safe_su_path = "C:\Users\Samst\OneDrive\Documents\PowerShell\superuser.ps1"
$su_file = Split-Path -Leaf $su
$su_name = $su_file.Split(".ps1")[0]
```

1. **`$fail_safe_su_path = "C:\Users\Samst\OneDrive\Documents\PowerShell\superuser.ps1"`**
    - This line assigns a **file path** to the variable `$fail_safe_su_path`.
    - The path points to a **PowerShell script file** named **“superuser.ps1”**.
    - The full path is `C:\Users\Samst\OneDrive\Documents\PowerShell\superuser.ps1`
2. `` $su_file = Split-Path -Leaf $su`**:
    
    - The `Split-Path` cmdlet is used to extract the **leaf** (file name) from the given path.
    - The `-Leaf` parameter ensures that only the **file name** (without the directory path) is extracted.
    - In this case, it extracts the file name **“superuser.ps1”** from the variable `$fail_safe_su_path`.
    - The result is stored in the variable `$su_file`.
3. **`$su_name = $su_file.Split(".ps1")[0]`**:
    
    - This line further processes the extracted file name stored in `$su_file`.
    - It uses the `Split()` method to split the file name by the **“.ps1”** extension.
    - The `[0]` index retrieves the part of the split result before the extension.
    - The resulting value in `$su_name` represents the **name of the PowerShell script** (without the extension).

In summary:

- The code extracts the file name from the given path and removes the **“.ps1”** extension.
- The resulting value in `$su_name` represents the name of the PowerShell script (without the extension).

For example:

- If `$fail_safe_su_path` is `C:\Users\Samst\OneDrive\Documents\PowerShell\superuser.ps1`, then `$su_name` will be **“superuser”**.