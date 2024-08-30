#howto/run 
```
rundll32.exe sysdm.cpl,EditEnvironmentVariables
```

The command **“rundll32.exe sysdm.cpl,EditEnvironmentVariables”** is used to **edit environment variables** in **Windows**. Let’s break it down:

1. **`rundll32.exe`**: This is a Windows utility that allows you to run functions from dynamic link libraries (DLLs) as if they were regular programs. In this case, it’s invoking a function related to system settings.
    
2. **`sysdm.cpl`**: This refers to the **System Properties** control panel applet. It provides access to various system-related settings, including environment variables.
    
3. **`EditEnvironmentVariables`**: This is the specific function within the `sysdm.cpl` applet that allows you to **edit environment variables**. When you run this command, it opens the **Environment Variables** window, where you can modify existing variables or create new ones.
    

To use this command:

1. Press **Win + R** to open the **Run dialog**.
2. Type or paste `rundll32.exe sysdm.cpl,EditEnvironmentVariables` into the dialog.
3. Press **Enter**.

The **Environment Variables** window will appear, allowing you to manage both **user-specific** and **system-wide** environment variables. [You can edit existing variables or create new ones as needed](https://appuals.com/how-to-edit-environment-variables-in-windows-10/)

## Sources
- https://learn.microsoft.com/en-us/answers/questions/312287/environment-variables-system-variables-are-not-acc
- https://superuser.com/questions/651039/how-to-get-to-environment-variables-from-run
- [How to edit environment variables in Windows 10 (appuals.com)](https://appuals.com/how-to-edit-environment-variables-in-windows-10/)
- https://appuals.com/how-to-edit-environment-variables-in-windows-10/