function figlet($textMsg)
{
    $figlet_FILEPATH = ReadJsonPath($Python_JSON.python.script[0].path)
    python $figlet_FILEPATH --message $textMsg
    
}