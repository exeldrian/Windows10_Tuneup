# Function to check task names against specified keep tasks
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

# Function to actually remove the tasks
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
            # Ask for credentials and run with them
            $creds = Get-Credential
            Start-Job -Credential $creds -ScriptBlock {$args[0] | Unregister-ScheduledTask -confirm:$false} -ArgumentList $TaskToRemove
        }
        "no" {
            return
        }
        Default { Write-Output "Invalid selection" }
    }

}

$keepTasks = "Backup" # Edit this to determine which tasks to keep
$tasks = Test-DesiredTasks -TasksToKeep $keepTasks # Compare keepTasks to Task Scheduler root

Write-Output $tasks.TaskName # Print task names that will be deleted

# Hey, you sure you wanna do this?
do { $ans = Read-Host "Would you like to unregister all of these?  (Yes/No)" }
until($ans -eq "yes" -or $ans -eq "no" -or $ans -eq "y" -or $ans -eq "n")

# Convert single character answers to the full word
switch ($ans) {
    "y" {
        $ans = "yes"
    }
    "n" {
        $ans = "no"
    }
}

# Do the thing
Remove-DesiredTasks -TaskToRemove $tasks -Process $ans # Perform task removal
