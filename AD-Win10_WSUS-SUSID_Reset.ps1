# AD-Win10_WSUS-SUSID_Reset.ps1

# Clear the SUSID - Necessary when in environment w/ imaged computers, otherwise all workstations will have non-unique SUSID & will report into WSUS w/ updates as Not Applicable

Stop-Service -Name BITS, wuauserv -Force

Remove-ItemProperty -Name AccountDomainSid, PingID, SusClientId, SusClientIDValidation -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\ -ErrorAction SilentlyContinue

Start-Service -Name BITS, wuauserv

# Check into WSUS Server - win10 Version of deprecated 'wuauclt /detectnow /resetauthorization'
(New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()
