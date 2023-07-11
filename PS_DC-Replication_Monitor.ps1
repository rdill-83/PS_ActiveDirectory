# Powershell RepAdmin - ReplicationPartner Monitor

Get-ADReplicationPartnerMetadata -Target * -Partition Domain | Sort Server | Select Server, @{n="Partner";e={(Resolve-DNSName $_.PartnerAddress).NameHost}}, LastReplicationAttempt,LastReplicationSuccess,LastReplicationResult,PartnerType,IntersiteTransportType,ScheduledSync | Out-GridView -Title "PS Replication Monitor - $(Get-Date -Format yyyy-MM-dd-hh-mm)"	
