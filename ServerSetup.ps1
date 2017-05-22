# Server setup

s# Network settings
New-NetIpAddress  -IpAddress 10.0.0.5 -DefaultGateway 10.0.0.2 -PrefixLength 8 -InterfaceIndex 4
Set-DnsClientServerAddress -ServerAddresses 10.0.0.3 -InterfaceIndex 4

# Domain settings
$pass = ConvertTo-SecureString Yadeki753! -AsPlainText -Force
$cred = new-object System.Management.Automation.PSCredential -ArgumentList sixteen\administrator,$pass
Add-computer -DomainName sixten.lan -Credential $cred -NewName FS-2016

# Default settings
# Powershell as default shell
$path = ‘HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\winlogon’
Set-ItemProperty -Path $path -Name Shell -Value ‘Powershell.exe -noexit’

