function Show-Table($type) {
    # Update the value of the 'show_all_paths' property
    $TABLE.show_all_paths = "enable"
    
        if($type)
        {
            switch($type)
            {
                "dependencies" { List-Profile}
                "function"     { List-Function("param") }
                "script"       { List-Script("basic") }
                "json"         { List-Json }
                "path"         { List-Path("all") } 
                Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
            }
        } else 
        {
            List-Profile
            List-Function("all")
            List-Script("all")
            List-Json
            List-Path("all")
        }
        return $true
    }