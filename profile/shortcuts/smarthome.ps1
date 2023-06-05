function smarthome() {
    # $file = "ctSmarthome.PowerShell_console.ps1"
    $filepath = $env:ctsmarthome_console
    $file = Split-Path -Leaf $filepath
    $path = $filepath.Split($file)[0]
    cd $path
    & $filepath
}