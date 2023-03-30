
function goto($dir_name) { 
    #------------- Pass argument to the below functions 
    # by calling the function name such as 'goto <argument>' 
    # example:- goto py 
            switch ($dir_name) 
            {
                "codes"    { Goto-Directory("codes")}
                "profile"  { Goto-Directory("powershell") }
                "py"       { Goto-Directory("mypython")}
                "terminal" { Goto-Directory("terminal") }
                "matrix"   { Goto-Directory("matrix") }
                "mrrobot"  { Goto-Directory("mrrobot") }
                "oracle"   { Goto-Directory("oracle") }
#               "pymath"   { Goto-Directory("terminal") }
#               "project"  { Goto-Directory("terminal") }
                "pico"     { Goto-Directory("pico") }
                "payload"  { Goto-Directory("payload") }
                "study"    { Goto-Directory("study") }
                "scripts"  { Goto-Directory("myscripts") }
                Default 
                {
                    
                    Write-Host "[Invalid] You entered the directory[$dir_name] that is not on the profile dictionary"
                    #figlet 'goto'
                    Write-Host "[Try] 'goto <directory-name> | with 'directory name from below' list"
                    #$goto_path.GetEnumerator() | Sort-Object | Format-Table @{label="Directory Name"; expression={$_.Key}}, @{label="Path"; expression={$_.Value}} -AutoSize
                    List-Path
                }
            }
    
    }
    