# https://youtu.be/cWUcnpzG-N0

# Set-ExecutionPolicy -ExecutionPolicy AllSigned
# Set-ExecutionPolicy -Scope -ExecutionPolicy ByPass
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy ByPass
#Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy ByPass
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
# Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Undefined 
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted
#Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Restricted
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned
Get-ExecutionPolicy -List

<#
$TimeStamp5erver = "http://timestamp.digicert.com"
$PS1 = "C:\Users\Sanju\Documents\PowerShell\hello-world.ps1"

#Query the code-sining certificate from your certificate-store.

$codeCertificate = Get-ChildItem Cert:\CurrentUser\My | Where-Object {$_.Subject —eq "CN=Sanjeev Stephan" }

# Sign the PowerShell script

Set-AuthenticodeSignature -FilePath $PS1 -Certificate $codeCertificate -TimeStampServer $TimeStamp5erver
#>