# DC Service Monitor

# Domain Controllers to Array:
$DCs = (Get-ADDomainController -Filter * | Sort Name).Name

# Domain Controller Service Status Query:
Get-Service -ComputerName $DCs -Name ADWS,DNS,KDC,Netlogon | FT MachineName,Name,DisplayName,Status,StartType

# DC Service Status Query w/ DHCP Server
Get-Service -ComputerName $DCs -Name ADWS,DHCPServer,DNS,KDC,Netlogon | FT MachineName,Name,DisplayName,Status,StartType
