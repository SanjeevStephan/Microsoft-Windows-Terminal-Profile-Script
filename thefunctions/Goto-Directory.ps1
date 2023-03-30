function Goto-Directory($directory_name) {

    #Get-Member -InputObject $MyInvocation
   $directory_path =  Get-Path($directory_name)
   cd $directory_path
   dir
}