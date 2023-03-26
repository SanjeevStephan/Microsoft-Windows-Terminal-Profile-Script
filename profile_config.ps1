$config_file = "profile_config.ps1"
<#
    functionality -> enable | disable
#>
$Functionality = @{
        "figlet" = "disable"
        "ascii"  = "enable"
        "dependencies" = "enable"
        "display_script_info" = "enable"
        "display_include_confirmation" = "disable"

}
<#
    ExecutableScript => 'allow' | 'refuse'
#>
$ExecutableScript = @{
    "test" = "allow"
    "test2" = "refuse"
}