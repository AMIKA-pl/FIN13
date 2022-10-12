<#
STEP: CLEANUP
** Run PowerShell with Administrative Privileges **
#>

cmd /c del $env:TEMP\ExtractLogins.ps1;
cmd /c del $env:TEMP\logs1.txt;
cmd /c del $env:TEMP\DNSDump.ps1;
cmd /c del $env:TEMP\addcat.csv;
