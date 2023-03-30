# This function displays a list of local sites and prompts the user to choose one to open in the default browser.

function localhost {

	# Define a hashtable of local site links.
	$weblinks = @{
		1 = @{Name = "home_assistant"; Url = "http://192.168.29.34:8123/"}
		2 = @{Name = "study"; Url = "file:///D:/unsync/study/"}
	}
	
	# Display the list of local site links in a formatted table.
	$weblinks.GetEnumerator() | Sort-Object | Format-Table @{label="Serial"; expression={$_.Key}},
															@{label="LocalSite Name"; expression={$_.Value.Name}}, 
															@{label="URL"; expression={$_.Value.Url}} -AutoSize
		
	# Prompt the user to choose a local site to open.
	$site_num = Read-Host "Choose Localhost site to open (1-$($weblinks.Count)) :"

	# Validate the user input and open the selected site in the default browser.
	switch($site_num)
	{
		{$_ -ge 1 -and $_ -le $weblinks.Count} { 
			$site_link = $($weblinks[$site_num]["Url"])
			Write-Output "Site Link : $site_link"
			Start-Process brave $site_link 
			return $site_link
		}

		Default { 
			Write-Output "Invalid option: $site_num. Please enter a number between 1 and $($weblinks.Count)."
			return $null
		}
	}
}
