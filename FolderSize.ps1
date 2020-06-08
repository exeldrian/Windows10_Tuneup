<#

FolderSize.ps1
Exeldrian 6/8/20

Simple script to get a folder size. I will eventually add the ability to compare
multiple folders, or at least print their sizes.

When peeking into system directies (i.e. C:\Windows), run this as administrator.

#>


# Ask which folder        
Clear-Host
$sources = Read-Host('What folder do you want the size of? (full path)')

# Crunch the numbers
Clear-Host
Write-Host("Working on it...") # People get impatient... Big folders will make this script look like it stalled...

# Main scriptblock for the loop when I add in multiple path capability
$size = Get-ChildItem "$sources" -Recurse | Measure-Object -Property Length -Sum
$sizeGB = "{0:N1}" -f ($size.sum/1GB)

#Print the results to screen
Clear-Host # readability is important
Write-Host("I looked at:`r`n    $sources`r`n`r`nI saw a total of:`r`n    $sizeGB GB.`r`n`r`nPlease note that if you saw any errors while I was working
then there are folders I don't have permission to see into.`r`n`r`n`r`n")

Read-Host("Press enter to quit...             ")