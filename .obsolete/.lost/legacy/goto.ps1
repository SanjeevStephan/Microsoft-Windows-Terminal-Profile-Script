$dir_name = $args[0]

function goto($dir_name)

{

            switch ($dir_name) 
            {
               
                "codes"      { Goto-Directory("codes")}
                "profile"    { Goto-Directory("powershell") }
                "py"         { Goto-Directory("mypython")}
                "terminal"   { Goto-Directory("terminal") }
                "matrix"     { Goto-Directory("matrix") }
                "mrrobot"    { Goto-Directory("mrrobot") }
                "myfunctions"{ Goto-Directory("myfunctions") }
                "mypython"   { Goto-Directory("mypython") }
                "oracle"     { Goto-Directory("oracle") }
                "pico"       { Goto-Directory("pico") }
                "payload"    { Goto-Directory("payload") }
                "study"      { Goto-Directory("study") }
                "myscripts"    { Goto-Directory("myscripts") }


                Default 
                {
                    
                    Write-Host "[Invalid] You entered the directory[$dir_name] that is not on the profile dictionary" -ForegroundColor Red
                    #figlet 'goto'
                    Write-Host "[Try] 'goto <directory-name> | with 'directory name from below' list" -ForegroundColor Red
                    #$goto_path.GetEnumerator() | Sort-Object | Format-Table @{label="Directory Name"; expression={$_.Key}}, @{label="Path"; expression={$_.Value}} -AutoSize
                    
                }
            }
   

}