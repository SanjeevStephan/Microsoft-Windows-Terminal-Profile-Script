Get-Content -Path 'console.paths' | ForEach-Object -Begin { $index = 0 } -Process { [PSCustomObject]@{ Index = $index; Line = $_ }; $index++ } | Format-Table -AutoSize
