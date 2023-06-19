# DC - Uptime Monitor

# Retrieve DCs to Array:
$DC = (Get-ADDomainController -Filter * | Sort Name).Name

# Uptime Monitor:
GWMI -Class Win32_OperatingSystem -CN $DC | FT -Property CSName,@{n='Last Bootup Time';e={[Management.ManagementDateTimeConverter]::ToDateTime($_.LastBootUpTime)}} -Auto
