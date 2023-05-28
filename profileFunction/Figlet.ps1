. "$Home\superuser.ps1"

function Figlet($msg){
    #$exec_py_json = Get-Python("figlet")
    $figlet_file_path = $PYSCRIPT.figlet
      
    # Execute python by supplying the --parameter and $argumnet 
    & python $figlet_file_path --message $msg 

 }