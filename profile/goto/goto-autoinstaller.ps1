function goto-autoinstaller() {
    Set-Location "$($env:GitHub)\autoinstaller"
    Invoke-Expression "cat setup.instructions"
    ls
}
