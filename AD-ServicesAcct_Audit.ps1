# AD-ServicesAcct_Audit.ps1
# Author RD

# Audit Windows Servers for Accts associated w/ Windows Services

# List of Server Nodes to Variable (filtering to all Servers in domain):
$Servers = (Get-ADComputer -Filter * -Properties * | Where {$_.OperatingSystem -like '*server*'} | Sort Name).Name

foreach ($Server in $Servers)
{
$ServerName = $Server

if (Test-Connection -ComputerName $ServerName -Count 1 -Quiet)
{   
    $Services = GWMI Win32_Service -ComputerName $ServerName -ErrorAction SilentlyContinue
    $ServicesInfo = $Services | where {$_.StartName -notlike 'localSystem' -and $_.Startname -notlike 'NT Authority*' -and $_.StartName -notlike $null} | Select-Object PSComputerName,Name,Caption,StartName,StartMode
    $ServicesInfo | Export-CSV -Path "C:\_IT-Temp\$(Get-Date -f yyyy-MM-dd)_Server_ServiceAcct_Audit.csv" -Append
}
else
{
    Write-Host "Server $ServerName is Not Online"
}
