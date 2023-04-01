
function Goto-Directory($directory_name) {
    


    #Get-Member -InputObject $MyInvocation
   $directory_path =  Get-Dir($directory_name)
   cd $directory_path
   dir
}