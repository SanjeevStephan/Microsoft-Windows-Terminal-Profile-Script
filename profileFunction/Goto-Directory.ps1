
function Goto-Directory($directory_name) {
    
    if(Test-Path $(Get-Directory($directory_name)))
    {
        #Get-Member -InputObject $MyInvocation
        $directory_path =  Get-Directory($directory_name)
        DEBUG("Goto Directory : $directory_path")
        cd $directory_path
        dir
    } else { Write-Warning "Invalid | Directory Not in the List"}
    List-Path
}