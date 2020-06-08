<#

FolderSize.ps1
Exeldrian 6/8/20

Simple script to get a folder size. I will eventually add the ability to compare
multiple folders, or at least print their sizes.

When peeking into system directies (i.e. C:\Windows), run this as admininistrator.

#>


# Ask which folder        
Clear-Host
$sources = Read-Host('What folder do you want the size of? (full path): ')

# Crunch the numbers
Clear-Host
Write-Host("Working on it...") # People get impatient... Big folders will make this script look like it stalled,,,
$size = Get-ChildItem "$sources" -Recurse | Where-Object {$_ -notlike "AppData"} | Measure-Object -Property Length -Sum
$sizeGB = "{0:N1}" -f ($size.sum/1GB)

#Print the results to screen
Clear-Host # readability is important
Write-Host("The total size of the directory you specified is $sizeGB GB.")