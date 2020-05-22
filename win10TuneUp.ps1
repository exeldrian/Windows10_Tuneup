#Import Modules
Import-module (Join-Path $PSScriptRoot "/modules/win10TuneUp.psd1") -verbose -force

#List of available tasks
$tasks = Get-ScheduledTask | Where {$_.TaskPath -notlike "\Microsoft\*"}
$tasks.TaskName
$ans = Read-Host "Enter the name you would like to remove"

#gather task object
$taskToRemove = $tasks.Where({$_.taskname -eq $ans})

$creds = Get-Credential 
Remove-DesiredTasks -TaskToRemove $taskToRemove -Process "yes" -Credential $creds # Perform task removal
