#documentation

[superuser/data/backup/new_terminal/settings.json at window11-v2.0 · SanjeevStephan/superuser (github.com)](https://github.com/SanjeevStephan/superuser/blob/window11-v2.0/data/backup/new_terminal/settings.json)

# Terminal Keyboard Shortcuts


| What does this command Do ?      | input                                                | keys (keyboard-shortcut) |
| -------------------------------- | ---------------------------------------------------- | ------------------------ |
| Refresh Terminal                 | "refresh ..\r"                                       | "ctrl+r"                 |
| List Files & Directories         | "ls \r"                                              | "ctrl+l"                 |
| Move One-Level in the Directory  | "cd ..\r"                                            | "ctrl+up"                |
| Open Window in Current Directory | "Start-Process explorer $pwd \r"                     | "ctrl+w"                 |
| SSH to Kali Linux                | "ssh kali \r"                                        | "ctrl+k"                 |
| Create New Item                  | "New-Item "                                          | "ctrl+n"                 |
|                                  |                                                      |                          |
| Open Environment Variable        | "rundll32.exe sysdm.cpl,EditEnvironmentVariables \r" | "ctrl+shift+e"           |
| Split Panel into Two             |                                                      | "alt+shift+d"            |
| Check File & Directory Path      | "Check-Path \r"                                      | "alt+shift+p"            |

> Launch PowerShell Scripts

| What does it do ?              | Input                        | keys (keyboard-shortcut) |
| ------------------------------ | ---------------------------- | ------------------------ |
| Change to PowerShell Directory | "cd $env:PowerShell \r"      | "ctrl+shift+p"           |
| Change to OneDrive Directory   | "cd $env:OneDrive \r"        | "ctrl+shift+o"           |
| Launch 'secret-script.ps1'     | "goto-secret \r"             | "ctrl+shift+s"           |
| Launch "SuperUser Help-Guide"  | "how-to-be-a-superuser ..\r" | "ctrl+shift+h"           |

### Refresh
This Command will clears the screen and loads the terminal.
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "refresh ..\r"
            },
            "keys": "ctrl+r"
        },
```


### List Files & Directories
```
     {
            "command": 
            {
                "action": "sendInput",
                "input": "ls \r"
            },
            "keys": "ctrl+l"
        },
```

### Change Directory
```
      {
            "command": 
            {
                "action": "sendInput",
                "input": "cd ..\r"
            },
            "keys": "ctrl+up"
        },
```
### Copy 
```
{
            "command": 
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
```
### Paste
```
        {
            "command": "paste",
            "keys": "ctrl+v"
        },
```
### Open Window in $pwd
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "Start-Process explorer $pwd \r"
            },
            "keys": "ctrl+w"
        },
```
### SSH to Kali Linux
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "ssh kali \r"
            },
            "keys": "ctrl+k"
        },
```
### Create New Item
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "New-Item "
            },
            "keys": "ctrl+n"
        },
```
### Open Environmental Variable
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "rundll32.exe sysdm.cpl,EditEnvironmentVariables \r"
            },
            "keys": "ctrl+shift+e"
        },
```
### Go-To GitHub Directory
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "cd $env:Github \r"
            },
            "keys": "ctrl+shift+g"
        },
    
```
### Go-To OneDrive Directory
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "cd $env:OneDrive \r"
            },
            "keys": "ctrl+shift+o"
        },
```
### Copy Keys to Clipboard
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "clip-keys \r"
            },
            "keys": "ctrl+shift+k"
        },
```

### Launch How to be Superuser (script.ps1)
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "how-to-be-a-superuser ..\r"
            },
            "keys": "ctrl+shift+h"
        },
```
### Check Path
```
        {
            "command": 
            {
                "action": "sendInput",
                "input": "Check-Path \r"
            },
            "keys": "alt+shift+p"
        }
```
# Terminal Settings
> Copy Text Automatically when selected.
```
"copyOnSelect": true,
```
> Starts the Window Terminal on System Start-Ups
```
 "startOnUserLogin": true,
```
