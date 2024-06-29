function Format-Dictionary-Data()
{
    $dict_data = @{
        0 = @{Title="Name";     Description="Sanjeev Stephan"}
        1 = @{Title="Gender";   Description="Male"}
        2 = @{Title="Country";  Description="India"}
    }

    $dict_data.GetEnumerator() | Sort-Object | Format-Table @{label="S.No"; expression={$_.Key}}, 
                                                            @{label="Title"; Expression={$_.Value.Title}},
                                                            @{label="Description"; Expression={$_.Value.Description}} -AutoSize
                                                             
}

Format-Dictionary-Data