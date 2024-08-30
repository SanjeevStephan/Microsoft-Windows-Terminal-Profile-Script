function embed(){


##    switch($action)
  #    {
          #Get Content from clipboard and pass it into the file provided
   #       'in' { Get-Clipboard | Set-Content $filename } 
          #Get Content from File and pass it into the Clipboard provided
    #      'out'{ Get-Content $filename | Set-Clipboard }
     #     Default { Write-Host "Invalid Input | Try {Clip in <filename> | clip out <filename>}" }
    #  }

#

        $val = 0 

        while($val -ne 5)
        {
            $val++


            Write-Host "[$val] Working with File ($val)"

            $filepath = Read-Host "Enter the File-Path : "
            $filepath = $filepath.Trim('"')

            $clip = Get-Clipboard


            Write-Host "[Clipboard]Original : $clip"

            $thecommand = "explorer.exe `"$clip`" "

            Write-Host "[Clipboard]Modified :  $thecommand"
            Set-Clipboard $thecommand

            Get-Clipboard | Set-Content $filepath 
            Cat $filepath
            Write "Text Successfully Embeded in the Bat-File"

           # Set-Clipboard ""

        }
    
  }
  
  