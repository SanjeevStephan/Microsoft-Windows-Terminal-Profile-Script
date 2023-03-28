
function goto($dir_name) { 
    #------------- Pass argument to the below functions 
    # by calling the function name such as 'goto <argument>' 
    # example:- goto py 
            switch ($dir_name) 
            {
                "codes"
                {
                    figlet("{code} Snippet")
                    cd $goto_path["codes"]
                    dir
                }
                "profile"
                {
                    figlet("PowerShell")
                    cd $path["powershell"]
                    dir
                }
                "py" 
                {
                    figlet("PyScript")
                    cd $path["pyscript"]
                    dir
                  
                }
                "terminal" 
                {
                    figlet("Terminal")
                    cd $path[$dir_name]
                    dir
                }
                "matrix"
                {
                    figlet "The Matrix"
                    cd $path["mr_robot"]
                    
                }
                "mrrobot" 
                {
                    figlet("Mr Robot")
                    cd $goto_path["mr_robot"]
                    dir
                  
                }
                "oracle"
                {
                    figlet "The Oracle"
                    cd $path["oracle"]
                    dir
                    
                }
                "pymath" 
                {
                     figlet("pymath")
                     cd $path[$dir_name]
                     dir *.bat             # Display only bat files
                }
                "project"
                {
                    figlet("Project")
                    cd $path["project"]
                    dir
                }
                "study"
                {
                    figlet("Study")
                    cd $goto_path["study"]
                    dir
                }
                "pico" 
                {
                    figlet("Raspberry Pico")
                    cd $goto_path["pico"]
                    dir
                  
                }
                "payload" 
                {
                    figlet("Pico Payload")
                    cd $goto_path["payload"]
                    dir
                  
                }
                Default 
                {
                    
                    Write-Host "[Invalid] You entered the directory[$dir_name] that is not on the profile dictionary"
                    figlet 'goto'
                    Write-Host "[Try] 'goto <directory-name> | with 'directory name from below' list"
                    $goto_path.GetEnumerator() | Sort-Object | Format-Table @{label="Directory Name"; expression={$_.Key}}, @{label="Path"; expression={$_.Value}} -AutoSize
    
                }
            }
    
    }
    