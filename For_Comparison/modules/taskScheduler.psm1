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