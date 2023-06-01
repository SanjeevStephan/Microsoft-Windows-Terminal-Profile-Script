function listhash() {
    #Get-ChildItem | Select-Object LastWriteTime, Length, Name, @{Name="FileHash";Expression={(Get-FileHash -A SHA1 $_.FullName).Hash}}
    Get-ChildItem | Select-Object Name, @{Name="FileHash";Expression={(Get-FileHash $_.FullName).Hash}}
    }