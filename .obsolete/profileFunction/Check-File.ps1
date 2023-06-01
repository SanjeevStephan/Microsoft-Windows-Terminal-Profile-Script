function Check-File($type){

    if($type)
    {
        switch($type)
        {
            "profile"      { Check-Profile}
            "json"         { Check-Json }
            "path"         { Check-Path }
            "script"       { Check-Script } 
            "all" 
            {
                Check-Profile
                Check-Json
                Check-Path
                Check-Script
            }
            Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
        }
    }    
    return $true
}
