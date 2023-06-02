function figlet($textMsg)
{
    #$Python_PATH = ReadJsonPath($Python_JSON.info.path)
    $figlet_FILEPATH = ReadJsonPath($Python_JSON.python.script[0].path)
    #echo $figlet_FILEPATH
    #echo "TExt Received $textMsg"
    python $figlet_FILEPATH --message $textMsg
    
}