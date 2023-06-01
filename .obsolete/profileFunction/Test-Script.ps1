
function Test-Json($type,$file_or_directory) {

    if($type)
    {
        switch($type)
        {
            "script" 
            {
                $test_script = GET-SCRIPT($file_or_directory)
                #Write-Output "SHOWING SCRIPT PATH $($test_script.Path) for the Script $($test_script.Name)"
                Write-Output "Script Name :  $($test_script.Name) "
                Write-Output "Script File :  $($test_script.File)"
                Write-Output "Script Argument : $($test_script.Argument)"
                Write-Output "Script Parameter : $($test_script.Parameter)"
                Write-Output "Script Desc : $($test_script.Desc)"
                Write-Output "Script Path :  $($test_script.Path)"
            }
            "path"
            {
                $test_path = GET-PATH($file_or_directory)
                Write-Output "Name : $($test_path.Name) "
                Write-Output "Directory: $($test_path.Directory)"
                Write-Output "Path :  $($test_script.Path)"
                Write-Output "Description : $($test_script.Desc)"

            }
            Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
    
        }

    }
    return $true
}
