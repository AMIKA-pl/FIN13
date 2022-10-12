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
cmd /c dir .\\\\;

#T1083
attrib /D;

#T1033
net user;
net accounts;

#T1069.001
net localgroup;

#T1033, T1059.001
powershell -ExecutionPolicy Bypass -File $env:TEMP\ExtractLogins.ps1;

#T1564.013, T1018
powershell -ExecutionPolicy Bypass -File $env:TEMP\DNSDump.ps1;

