```
 _   _            _                      _             _
| |_| |__   ___  | |_ ___ _ __ _ __ ___ (_)_ __   __ _| |
| __| '_ \ / _ \ | __/ _ \ '__| '_ ` _ \| | '_ \ / _` | | v1.0 | 26th March 2023
| |_| | | |  __/ | ||  __/ |  | | | | | | | | | | (_| | | by Sanjeev Stephan Murmu
 \__|_| |_|\___|  \__\___|_|  |_| |_| |_|_|_| |_|\__,_|_| https://github.com/SanjeevStephan/


<-------------------{ Loading Dependencies }-------------------------->
[ INCLUDE-ALL ] The {*.ps1} in the C:\Users\Sanju\Documents\PowerShell\dependency
[ OK ] Profile include => { profile_include.ps1 } Loaded Successfully
[ OK ] Dependency : 101TheCommands.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\101TheCommands.ps1
[ OK ] Dependency : 102Get-Dir.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\102Get-Dir.ps1
[ OK ] Dependency : 104ASCIIFiglet.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\104ASCIIFiglet.ps1
[ OK ] Dependency : 105IsPythonInstalled.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\105IsPythonInstalled.ps1
[....] Checking if the Python is Installed or not
[ OK ] Python is installed at C:\Users\Sanju\AppData\Local\Programs\Python\Python*\python.exe.
[ OK ] Dependency : 106AllImportantFunc.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\106AllImportantFunc.ps1
[ OK ] Dependency : getColorSchema.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getColorSchema.ps1

S.No Color   Schema     Description
---- -----   ------     -----------
   1 Blue    Dependency Important Dependency Files
   2 Green   Function   Represent Functions
   3 Magenta Debug      Debug Messages
   4 Red     Error      Means Missing | Error | Don't Ignore These Error
   5 White   Casual     General Log Messages
   6 Yellow  Important  Pay Attentiong to these Lines
   7 Cyan    Important  Auto Script to include all the files with (*.ps1) in specific directory

[ COLOR ] Schema { Debug }      : Magenta
[ COLOR ] Schema { Dependency } : Blue
[ COLOR ] Schema { Casual }     : White
[ COLOR ] Schema { Error }      : Red
[ COLOR ] Schema { Function }   : Green
[ COLOR ] Schema { Important }  : Yellow
[ COLOR ] Schema { Important }  : Cyan
[ OK ] Dependency : getCoreDebug.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getCoreDebug.ps1
[ OK ] Dependency : getDependencies.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getDependencies.ps1
[ INFO ] Script-Name   => { getDependencies.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getDependencies.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { dependencies.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\dependencies.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No Name             File                 Path
---- ----             ----                 ----
   1 getPath          getPath.ps1          C:\Users\Sanju\Documents\PowerShell\myscripts\getPath.ps1
   2 getScript        getScript.ps1        C:\Users\Sanju\Documents\PowerShell\myscripts\getScript.ps1
   3 getJson          getJson.ps1          C:\Users\Sanju\Documents\PowerShell\myscripts\getJson.ps1
   4 getDependencies  getDependencies.ps1  C:\Users\Sanju\Documents\PowerShell\myscripts\getDependencies.ps1
   5 getFunction      getFunction.ps1      C:\Users\Sanju\Documents\PowerShell\myscripts\getFunction.ps1
   6 getPython        getPython.ps1        C:\Users\Sanju\Documents\PowerShell\myscripts\getPython.ps1
   7 profile_function profile_function.ps1 C:\Users\Sanju\Documents\PowerShell\profile_function.ps1

[ OK ] Dependency : getFunction.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getFunction.ps1
[ INFO ] Script-Name   => { getFunction.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getFunction.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { profileFunctions.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\profileFunctions.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No Profile Function Argument Parameter                 Syntax Description
---- ---------------- -------- ---------                 ------ -----------
   1 Check-File       Yes      $type                            Execute Script from this JSON List
   2 EXEC             Yes      {$script_name, $argument}        Execute Script by passing Script Name from 'scripts.json
   3 Goto-Directory   Yes      $dir_name                        Read JSON File and Display It
   4 Home             No                                        Read JSON File and Display It
   5 Refresh          No                                        Read JSON File and Display It
   6 Show-List        Yes      $column_name                     Read JSON File and Display It
   7 Show-Table       Yes      $column_name                     Read JSON File and Display It

[ OK ] Dependency : getJson.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getJson.ps1
[ INFO ] Script-Name   => { getJson.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getJson.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { myJsonList.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\myJsonList.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No JSON Name        JSON File             Path
---- ---------        ---------             ----
   1 dependencies     dependencies.json     C:\Users\Sanju\Documents\PowerShell\myjson\dependencies.json
   2 directories      directories.json      C:\Users\Sanju\Documents\PowerShell\myjson\directories.json
   3 functions        functions.json        C:\Users\Sanju\Documents\PowerShell\myjson\profileFunctions.json
   4 myJsonList       myJsonList.json       C:\Users\Sanju\Documents\PowerShell\myjson\myJsonList.json
   5 myFunctions      myFunctions.json      C:\Users\Sanju\Documents\PowerShell\myjson\myFunctions.json
   6 myPythonScript   myPythonScript.json   C:\Users\Sanju\Documents\PowerShell\myjson\myPythonScript.json
   7 myScripts        myScripts.json        C:\Users\Sanju\Documents\PowerShell\myjson\myScripts.json
   8 profileFunctions profileFunctions.json C:\Users\Sanju\Documents\PowerShell\myjson\profileFunctions.json
   9 test             test.json             C:\Users\Sanju\Documents\PowerShell\mytest\test.json

[ OK ] Dependency : getPath.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getPath.ps1
[ INFO ] Script-Name   => { getPath.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getPath.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { directories.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\directories.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No Directory     Path                                             Description
---- ---------     ----                                             -----------
   1 home          C:\Users\Sanju\Documents\PowerShell              PowerShell Home Directory
   2 codes         D:\terminal\code-snippets                        The Code-Snippets Directory
   3 docs          C:\Users\Sanju\Documents                         User Documents Directory
   4 matrix        D:\terminal\matrix                               Terminal Matrix Directory
   5 myautoscripts C:\Users\Sanju\Documents\PowerShell\myautoscript PowerShell's Profile -> 'myautoscript' Directory
   6 myfunction    C:\Users\Sanju\Documents\PowerShell\myfunction   PowerShell's Profile -> 'myfunction' Directory
   7 mypython      C:\Users\Sanju\Documents\PowerShell\mypython     PowerShell's Profile -> 'mypython' Directory
   8 mrrobot       D:\mr_robot                                      Mr Robot Directory
   9 oracle        D:\terminal\matrix\oracle                        Matrix Oracle Directory
  10 pico          D:\mr_robot\pico_ducky                           Raspberry Pico Directory
  11 payload       D:\mr_robot\pico_ducky\payloads                  Raspberry Pico's BadUSB Rubber Ducky's Payload
  12 powershell    C:\Users\Sanju\Documents\PowerShell\             Microsoft PowerShell Profile Directory
  13 study         D:\study                                         Study Directory
  14 terminal      D:\terminal                                      The Terminal Directory

[ OK ] Dependency : getPython.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getPython.ps1
[ INFO ] Script-Name   => { getPython.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getPython.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { myPythonScript.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\myPythonScript.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No Script Name Script File Python Script Path
---- ----------- ----------- ------------------
     figlet      figlet.py   C:\Users\Sanju\Documents\PowerShell\mypython\figlet.py

[ OK ] Dependency : getScript.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\getScript.ps1
[ INFO ] Script-Name   => { getScript.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\getScript.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { myScripts.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\myScripts.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }

S.No Script File              Path                                                           Description
---- -----------              ----                                                           -----------
   1 test.ps1                 C:\Users\Sanju\Documents\PowerShell\mytest\test.ps1            Test Script
   2 test2.ps1                C:\Users\Sanju\Documents\PowerShell\mytest\test2.ps1           Test Script to display greetings
   3 profile_exec_script.ps1  C:\Users\Sanju\Documents\PowerShell\myscripts\execScript.ps1   Execute Script from this JSON List
   4 profile_getJson.ps1      C:\Users\Sanju\Documents\PowerShell\myscripts\getJson.ps1      Read JSON File and Display It
   5 profile_getJson.ps1      C:\Users\Sanju\Documents\PowerShell\myscripts\getJson.ps1      Read JSON File and Display It
   6 profile_getJson.ps1      C:\Users\Sanju\Documents\PowerShell\myscripts\getJson.ps1      Read JSON File and Display It
   7 profile_loadFunction.ps1 C:\Users\Sanju\Documents\PowerShell\myscripts\loadFunction.ps1 Read JSON File and Load the Functi…

[ OK ] Dependency : setAllProfileFunctions_auto.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\setAllProfileFunctions_auto.ps1
[ INCLUDE-ALL ] The {*.ps1} from the C:\Users\Sanju\Documents\PowerShell\profileFunction
[ OK ] Included : Profile-Function => { Add-My-Function.ps1 } Successfully
[ OK ] Included : Profile-Function => { Check-File.ps1 } Successfully
[ OK ] Included : Profile-Function => { Edit-JSON.ps1 } Successfully
[ OK ] Included : Profile-Function => { Exec.ps1 } Successfully
[ OK ] Included : Profile-Function => { Figlet.ps1 } Successfully
[ OK ] Included : Profile-Function => { Goto-Directory.ps1 } Successfully
[ OK ] Included : Profile-Function => { Home.ps1 } Successfully
[ OK ] Included : Profile-Function => { Refresh.ps1 } Successfully
[ OK ] Included : Profile-Function => { Show-List.ps1 } Successfully
[ OK ] Included : Profile-Function => { Show-Table.ps1 } Successfully
[ OK ] Included : Profile-Function => { Superuser-Prompt.ps1 } Successfully
[ OK ] Included : Profile-Function => { Test-Script.ps1 } Successfully
[ OK ] Included : Profile-Function => { The-Prompt.ps1 } Successfully
[ OK ] All Profile Functions => { setAllProfileFunctions.ps1 } Loaded Successfully
[ OK ] Dependency : setMyfunctions.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\setMyfunctions.ps1
[ INFO ] Script-Name   => { setMyfunctions.ps1  }
[ INFO ] Script-Path   => { C:\Users\Sanju\Documents\PowerShell\dependency\setMyfunctions.ps1 }
[ INFO ] Script-Status => { Available }
[ INFO ] JSON-Name     => { myFunctions.json }
[ INFO ] JSON-Path     => { C:\Users\Sanju\Documents\PowerShell\myjson\myFunctions.json }
[ INFO ] JSON-Status   => { Available }
[ INFO ] Executed-By   => { profile_include.ps1 }
[ OK ] Included : MyFunction => { clip }  Successfully
[ OK ] Included : MyFunction => { copypath }  Successfully
[ OK ] Included : MyFunction => { check-link }  Successfully
[ OK ] Included : MyFunction => { download }  Successfully
[ OK ] Included : MyFunction => { download-file }  Successfully
[ OK ] Included : MyFunction => { edit }  Successfully
[ OK ] Included : MyFunction => { goto }  Successfully
[ OK ] Included : MyFunction => { openinbrave }  Successfully
[ OK ] Included : MyFunction => { localhost }  Successfully
[ OK ] Included : MyFunction => { removetest }  Successfully
[ OK ] Included : MyFunction => { showip }  Successfully
[ OK ] Included : MyFunction => { stillconnected }  Successfully
[ OK ] Included : MyFunction => { sleep }  Successfully
[ OK ] Included : MyFunction => { goodbye }  Successfully
[ OK ] Included : MyFunction => { window }  Successfully
[ OK ] Dependency : zero2superuser.ps1 : Included C:\Users\Sanju\Documents\PowerShell\dependency\zero2superuser.ps1
 ____                        _   _
/ ___| _   _ _ __   ___ _ __| | | |___  ___ _ __
\___ \| | | | '_ \ / _ \ '__| | | / __|/ _ \ '__| v1.0 | 26th March 2023
 ___) | |_| | |_) |  __/ |  | |_| \__ \  __/ |    by Sanjeev Stephan Murmu
|____/ \__,_| .__/ \___|_|   \___/|___/\___|_|    https://github.com/SanjeevStephan/
            |_|

[ OK ] Profile Function => { profile_function.ps1 } Loaded Successfully
┌──(superuser㉿192.168.29.218)-[C:\Users\Sanju\Documents\PowerShell]
└─$ PS>
```
