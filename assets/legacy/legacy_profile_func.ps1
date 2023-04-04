<#
 ____             __ _ _        _____                             _
|  _ \ _ __ ___  / _(_) | ___  |  ___|   _ _ __   ___   _ __  ___/ |
| |_) | '__/ _ \| |_| | |/ _ \ | |_ | | | | '_ \ / __| | '_ \/ __| |
|  __/| | | (_) |  _| | |  __/ |  _|| |_| | | | | (__ _| |_) \__ \ |
|_|   |_|  \___/|_| |_|_|\___| |_|   \__,_|_| |_|\___(_) .__/|___/_|
                                                       |_|
#>
#-------------------- Include <this-file> in the Below File ----------------
#. "$HOME\Documents\PowerShell\profile_include.ps1"
#. $HOME\Documents\PowerShell\profile_path.ps1
# . $HOME\Documents\PowerShell\profile_include.ps1
<#--------------------------------------{ Function Index }------------------------------------------------
        Function-Name                                 What-does-it-do?
        alias()
        addtest($filename)                            Add the prefix "test_" to a given string argument 
        alphabet()
        alphabet_reverse()
        backup()()
        clip($action,$filename) 
        copypath()
        createlink()
        checkinternet()
        edit($filename)
        extract($zipfile)
        figlet($text_to_display)
        filterfile($extension,$substring)
        google()
        greet($name,$age)
        getfilename($script_extension)
        goto($dir_name)
        helptab($task_name)
        iamonline()                                  check-internet
        lst()
        launch($app_name)
        listhash()
        nano($filename)
        openinbrave()
        openprocess()
        openfilter()
        psindex()
        paste-temp($script_extension,$filename)
        pinggoogle()                                  check-internet
        pico($action)
        refresh()
        run($script_name_n_url)
        removetest($filename)                         Remove the prefix "test_" from a given string argument
        randommath() 
        replace2dash
        snippets($script_extension)
        showip()
        stillconnected()
        safelyremove()
        payload($action,$filename)
        TODO($action)
        timeperques()
        window()





#>

$func_name = @{
    "alias"                    = "made up short-nickname used in-place of the actual command"
    "addtest <filename>"       = ""
    "backup"                   = "backup directory $HOME/Documents/PowerShell"
    "clip <filename|fileurl>"  = "paste the clipboard into the file"
    "edit <filename>"          = "edit files in powershell_ise"
    "figlet <text_to_display>" = "display cool figlet ascii text " 
    "goto <directory_name>"    = "navigate to directory {py|terminal}"
    "google"                   = "Send Query to the Google using brave browser"
    "helptab"                  = "Display helpful command table | try->{pls,terminal}"
 #  "location"                 = "location of the scripts and directory in profile dictionary"
    "nano <filename>"          = "open files in nano-terminal-editor"
    "pls"                      = "[pls-cli] default terminal todo script app"
    "run <script_name>"        = "execute script like {pygame|pymath}"
    "refresh"                  = "reload the Microsoft.PowerShell.Profile.ps1 script"
    "TODO"                     = "Open TODO List in Nano Editor"
    "window"                   = "open file explorer of the current working directory"
    "lst"                      = "list only the filesnames"
    "launch <app_name>"        = "launch utilities such as npad={notepad.exe} | snap={snippingtool.exe}"
    "getfilename <extension>"  = "convert 'string with spaces' -> 'string-with-space.{py,ps,txt}'"

}
#--------------------------------------{ Alphabet-A }--------------------------------------------------
function alias() {


    figlet "Get-Alias"
    Get-Alias
}

function addtest($filename){

#Add the prefix "test_" to a given string argument:
#$file_to_be_renamed = "test_" + "$filename"

$filename = "$filename"
$file_to_be_renamed = $filename.Replace(".\","test_")
Rename-Item $filename $file_to_be_renamed
#check_file_exists = $pwd + "$filename"
#bool = Test-Path check_file_exists
Write-Host "$filename successfully renamed to $file_to_be_renamed"

}

function alphabet() {

cd $path["study"]
.$Script["alphabet_position"]

}
function alphabet_reverse() {
cd $path["study"]
.$Script["alphabet_reverse_position"]

}

#--------------------------------------{ Alphabet-B }--------------------------------------------------
function backup() {
figlet "backup-ing profile-configs"
Write-Host "Please Wait"
# Copy all files & directories from the $HOME/document/powershell directory to the destination directory
cd $profile_source
Copy-Item -Path * -Destination $profile_backup_path -Recurse -Force -Verbose
Write-Host "All Files Copied $profile_backup_path"
cd $profile_backup_path
dir 
}
#--------------------------------------{ Alphabet-C }--------------------------------------------------

function clip($action,$filename){
  switch($action)
    {
        #Get Content from clipboard and pass it into the file provided
        'in' { Get-Clipboard | Set-Content $filename } 
        #Get Content from File and pass it into the Clipboard provided
        'out'{ Get-Content $filename | Set-Clipboard }
        Default { Write-Host "Invalid Input | Try {Clip in <filename> | clip out <filename>}" }
    }
  
}
function copypath() {
<#
.SYNOPSIS
    send the working directory path to the clipboad
.SYNTAX
    copypath
.PARAMETER
    no-parameter included

#>


    $current_directory = Get-Location
    $current_directory | Set-Clipboard
    Write-Output "[Copied] Directory Path: $($current_directory.Path)"
}

function checkinternet() { test-connection 8.8.8.8 } # Check the connection to the google-dns-server 



#--------------------------------------{ Alphabet-D }--------------------------------------------------


function display_random_title {
    $randomIndex = Get-Random -Minimum 0 -Maximum $initial_title_array.Length
    $display_this_random_title = $initial_title_array[$randomIndex]
    # debug("Random Title number [$randomIndex] : $display_this_random_title")
    # figlet($initial_title)
    figlet($display_this_random_title)
    return 
}

#--------------------------------------{ Alphabet-E }--------------------------------------------------
function edit($filename){
figlet "PowerShell ISE"

    switch($filename) 
    {
        "func"    {Start-Process powershell_ise.exe $profile_source/profile_func.ps1}
        "profile" {Start-Process powershell_ise.exe $profile_source/Microsoft.PowerShell_profile.ps1}
        "path"    {Start-Process powershell_ise.exe $profile_source/profile_path.ps1}
        "include" {Start-Process powershell_ise.exe $profile_source/profile_include.ps1 }
        "quotes"  { cd $env:snippet}
        Default {Start-Process powershell_ise.exe $filename}
    }

}

function editall($filename) { 
figlet "Edit Profile-files"

cd $path["profile"]

foreach ($file in $profile_dependencies.Values) {
    Write-Host "[] Opening File in PowerShell_ISE : $file "
    powershell_ise.exe $file
    Start-Sleep -Seconds 1
}

Write-Output "All Setup_*.ps1 files opened in Powershell Successfully"

}

function extract($zipfile){ .$script["extract_zip"] $zipfile}
#--------------------------------------{ Alphabet-F }--------------------------------------------------
function figlet($text_to_display){
    . $HOME\Documents\PowerShell\profile_script_hashtable.ps1
    & python $script["figlet"] --message $text_to_display
   # cd $path["timetable"]
}

function filterit($extension,$filter) {
Write "No Filter Script | filterit function is empty"
}
#--------------------------------------{ Alphabet-G }--------------------------------------------------
function google() {
   figlet "Google"
  $google_search = $script["google_query"] # retrive the value from the script dictionary
  .$google_search #execute the script
}


#--------------------------------------{ Alphabet-H }--------------------------------------------------

function helptab($task_name){

    switch($task_name) {
        "pls" {.$HOME\Documents\PowerShell\.help\help-pls-cli.ps1}
        "terminal" {$func_name.GetEnumerator() | Sort-Object | Format-Table @{label="Command"; expression={$_.Key}}, @{label="Syntax"; expression={$_.Value}} -AutoSize}
        Default { Write-Host "Wrong Input | Try -> helptab <task_name>"}

    }
}
#--------------------------------------{ Alphabet-I }--------------------------------------------------


# Sample dictionry format-table
#  $path.GetEnumerator() | Format-Table @{label="Directory Name"; expression={$_.Key}}, @{label="Path"; expression={$_.Value}} -AutoSize




#--------------------------------------{ Alphabet-J }--------------------------------------------------


#--------------------------------------{ Alphabet-K }--------------------------------------------------


#--------------------------------------{ Alphabet-L }--------------------------------------------------
function lst() {
# Display only the files names
figlet "List File-names"
Get-ChildItem | Select-Object Name
}

function launch($app_name){

    switch($app_name) {
            "npad" { Start-Process "notepad.exe"}
            "snap"    { Start-Process "SnippingTool.exe"}
            Default   { Start-Process $app_name}

       }
}

function list() {
$func_name.GetEnumerator() | Sort-Object | Format-Table @{label="Function Name"; expression={$_.Key}}, @{label="What it does?"; expression={$_.Value}} -AutoSize
$path.GetEnumerator() | Sort-Object | Format-Table @{label="Directory Title"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize
$profile_dependencies.GetEnumerator() | Sort-Object | Format-Table @{label="Profile Dependencies"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize
$manual_url.GetEnumerator() | Sort-Object | Format-Table @{label="Manual Title"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize
$goto_path.GetEnumerator() | Sort-Object | Format-Table @{label="Goto Directory Title"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize
$window_shortcut.GetEnumerator() | Sort-Object | Format-Table @{label="Window Shorcut Key"; expression={$_.Key}}, @{label="Description"; expression={$_.Value}} -AutoSize
$terminal_shortcut.GetEnumerator() | Sort-Object | Format-Table @{label="Terminal Shortcut Key"; expression={$_.Key}}, @{label="Description"; expression={$_.Value}} -AutoSize
$json.GetEnumerator() | Sort-Object | Format-Table @{label="Json Filename"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize
$script.GetEnumerator() | Sort-Object | Format-Table @{label="Script Title"; expression={$_.Key}}, @{label="Location"; expression={$_.Value}} -AutoSize

}
#--------------------------------------{ Alphabet-M }--------------------------------------------------


#--------------------------------------{ Alphabet-N }--------------------------------------------------
 <#
 function nano($filename){
#Edit file with format (file_name) in terminal itself (require no-space)
#Cannot Edit files with format 'sample text.txt' format (it has space)
Start-Process $profile_source\nano.exe "$filename"
}

#>
#--------------------------------------{ Alphabet-O }--------------------------------------------------





function psindex() { brave "https://ss64.com/ps/"  }


#--------------------------------------{ Alphabet-P }--------------------------------------------------

function paste-temp($script_extension,$filename) {

    #paste the template from template4.{py|ps1} to the $filename passed as a argument
    switch($script_extension)
    {
        "py"     {Get-Content "$profile_source\.template\template4py" | Out-File $filename}
        "ps1"   {Get-Content "$profile_source\.template\template4ps1" | Out-File $filename}
        "cmdlet" {Get-Content "$profile_source\.template\tempalte4cmdlet" | Out-File $filename}
        "gpt4py" {Get-Content "$profile_source\.template\gpt-template4py" | Out-File $filename}
        "gpt4ps" {Get-Content "$profile_source\.template\gpt-template4ps1" | Out-File $filename}
        "pshelp" {Get-Content "$profile_source\.template\help4ps1" | Out-File $filename} 
         Default {cat $manual_url["func-paste-temp"] }

    }

}


function pico($action) { & $script["pico_ducky"] $action }
function payload($action,$payload_file) { & $script["payload"] $action $payload_file}
#--------------------------------------{ Alphabet-Q }--------------------------------------------------


#--------------------------------------{ Alphabet-R }--------------------------------------------------


function run($script_name_n_url) {
    
    Switch($script_name_n_url)
    {

        "pymath"
        {
            Write-Host "PyMath executed Successfully"
            cd $path["pymath"]
            & python  $script[$script_name_n_url]
        }
        "pygame"
        {
           Write-Host "PyMath executed Successfully"
           & python  $script[$script_name_n_url]
        }
        "timetable"
        {
            figlet "Time-Table"
            #cd $path["timetable"]
           #.$script["timetable"]
           Write-Host "Select Below Option to view timetables"
           #& python  $script[$script_name_n_url]
           Write-Output "1. Time table for Monday-Wednesday-Friday(MWF)"
           Write-Output "2. Time table for Tuesday-Thrusday-Saturday(TTS)"
           $choice = Read-Host "[ENTER] Select Time-Table for (1 OR 2):"


           Switch($choice)
           {
                "1"{ .$script["timetable_mwf"] } # MWF
                "2"{ .$script["timetable_tts"] } # TTS
                Default {Write-Output "invalid option entered"}
           }

        }
        "vocabulary"
        {
            
            .$script["vocabulary"] # dot executions bat|cmd scripts
            Write-Host "vocabulary executed Successfully"
        }
        Default
        {
            Write-Host "[Invalid] Script Name Not Mentioned in the Dictionary "
            figlet "run"
            Write-Host "[Try] run <script_name> | 'script_name' from below list"
            $script.GetEnumerator() | Format-Table @{label="Script Name"; expression={$_.Key}}, @{label="Path"; expression={$_.Value}} -AutoSize

        }
    }
}



function randommath() {
figlet "PyMath"

cd $path["random_math"]
.$script["random_math"]

}



#--------------------------------------{ Alphabet-S }--------------------------------------------------

function snippets($script_extension) {

figlet "Codes-Snippets"


    switch($script_extension)
    {
        "py"     {figlet "for Python"}
        "ps"     {figlet "for PowerShell"}
        "bat"    {figlet "for Batchfile"}
        "vscode" {Write-Output "Opening $profile_source in VSCode"}
         Default {Write-Output ""}

    }

    #get code-snippets for the specific scripting language
    switch($script_extension)
    {
        "py"     {cat "$profile_source\.codesnippets\python.ps1"}
        "ps"     {cat "$profile_source\.codesnippets\powershell.ps1"}
        "bat"    {cat "$profile_source\.codesnippets\batchfile.ps1"}
        "vscode" {code "$profile_source"}
        "window" {Start-Process explorer.exe "$profile_source\.codesnippets\" }
         Default {cat $manual_url["code-snippets"] }

    }

}

function secret($action,$fileOrDirectory) {
# show | hide | unhide files in the current working directory
figlet "Secrets"
$get_current_location = Get-Location

    switch($action) {
        "hide" { attrib +s +h "$get_current_location\$fileOrDirectory" }
        "unhide" { attrib -s -h "$get_current_location\$fileOrDirectory" }
        "show" { dir $get_current_location -Force }
        Default { Write-Output "Use syntax -> secreet {hide|unhide|show} <file | dir>" }
    }


}


function safelyremove() { & $script["safely_remove"] }
#--------------------------------------{ Alphabet-T }--------------------------------------------------
function TODO($action){
 # Display the TODO-List"
   cat $profile_source\TODO

    switch($action)
    {
        #open a text editor in nano-terminal-editor and save the todo-list
        "edit" { Start-Process $profile_source\nano.exe $profile_source\TODO}
        # Display the TODO-List"
        "list" {cat $profile_source\TODO}
        "exit" { exit }
        Default {Write-Host "Want to Edit | Try -> TODO <edit | list | exit>" }
    }

}

function timeperques(){
figlet "Time Per Questions"
.$script["time_per_ques"]
}

#--------------------------------------{ Alphabet-U }--------------------------------------------------




#--------------------------------------{ Alphabet-V }--------------------------------------------------



#--------------------------------------{ Alphabet-W }--------------------------------------------------



#--------------------------------------{ Alphabet-X }--------------------------------------------------


#--------------------------------------{ Alphabet-Y }--------------------------------------------------


#--------------------------------------{ Alphabet-Z }--------------------------------------------------




