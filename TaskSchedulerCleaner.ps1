function Test-DesiredTasks {
    param (
        $TasksToKeep
    )
    $keepTasks = $TasksToKeep

    $tasks = Get-ScheduledTask -TaskPath "\" | ForEach-Object {
        if ($keepTasks -contains $_.TaskName) {
            return
        }
        else {
            $_
        }
    }
    return $tasks
}

function Remove-DesiredTasks {
    param (
        [Parameter(Mandatory = $True)]
        $TaskToRemove,
        [Parameter(Mandatory = $True)]
        [ValidateSet("yes", "no")]
        $Process
    )
    switch ($Process) {
        "yes" {
            $TaskToRemove | Unregister-ScheduledTask -confirm:$false
        }
        "no" {
            return
        }
        Default { Write-Output "Invalid selection" }
    }

}

$keepTasks = "Backup" # edit this to determine which tasks to keep
$tasks = Test-DesiredTasks -TasksToKeep $keepTasks # Determine tasks

Write-Output $tasks.TaskName # Make selections
do { $ans = Read-Host "Would you like to unregister all of these?  (Yes/No)" }
until($ans -eq "yes" -or $ans -eq "no" -or $ans -eq "y" -or $ans -eq "n")

switch ($ans) {
    "y" {
        $ans = "yes"
    }
    "n" {
        $ans = "no"
    }
}

Remove-DesiredTasks -TaskToRemove $tasks -Process $ans # Perform task removal
