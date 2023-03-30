function Show-List($type) {
    # Update the value of the 'show_all_paths' property
    $TABLE.show_all_paths = "enable"
    
        if($type)
        {
            switch($type)
            {
                "dependencies" { $python_array_data }
                "function"     { $function_array_data }
                "script"       { $script_array_data }
                "json"         { $jsons_array_data }
                "path"         { $paths_array_data } 
                "python"       { $python_array_data }
                Default { Write-Error "Invalid Argument Passed | Require -> test_json type file_or_dir"}
            }
        } else 
        {
            $python_array_data
            $function_array_data
            $script_array_data
            $jsons_array_data
            $paths_array_data
        }
        return $true
    }    