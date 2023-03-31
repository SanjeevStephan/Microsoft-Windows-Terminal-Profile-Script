function Figlet($msg){
    #$exec_py_json = Get-Python("figlet")
    $figlet_file_path = "$Home\Documents\PowerShell\mypython\figlet.py"
      
    # Execute python by supplying the --parameter and $argumnet 
    & python $figlet_file_path --message $msg 


 
 }