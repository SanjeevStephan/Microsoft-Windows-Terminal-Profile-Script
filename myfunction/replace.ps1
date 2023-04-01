function replace($txt_to_replace,$txt_to_be_replace_with) {
    # Replace all occurance of $txt_to_replace with $txt_to_be_replace_with in the file names
    # of all files in the current working directory
   $current_working_directory = Get-Location
   
   $choice = Read-Host "Do you want to replace $text_to_replace with $txt_to_be_replace_with (y/n) : "
        if($choice -eq "y") {
   
               Get-ChildItem -Path $current_working_directory | 
               ForEach-Object {
                   $newName = $_.Name.Replace("$txt_to_replace", "$txt_to_be_replace_with")
                   Write-Output "Renamed : $newName"
                   Rename-Item -Path $_.FullName -NewName $newName }
   
        } else { Write-Output "No Files have been touched. Goodbye" }
   
   }
   