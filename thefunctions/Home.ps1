function Home() {
    $pshellSource = GET-PATH("powershell")
    cd $pshellSource.Path
}