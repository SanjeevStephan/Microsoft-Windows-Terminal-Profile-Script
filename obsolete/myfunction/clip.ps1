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
  
  