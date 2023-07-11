function goto-secret() {
    Set-Location "$($env:GitHub)\.trash"
    Invoke-Expression "./private-keys.ps1"
}