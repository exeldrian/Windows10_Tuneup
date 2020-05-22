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
        $Process,
        $Credential
    )
    switch ($Process) {
        "yes" {
            if ($null -ne $credential) {
                $scriptblock = {
                    $args[0] = $TaskToRemove
                    #$TaskToRemove | Unregister-ScheduledTask -confirm:$false
                    Write-Output "Did stuff"
                }
                Start-Job -ScriptBlock $scriptblock -ArgumentList ($TaskToRemove) -Credential $Credential
            }
            else {
                $TaskToRemove | Unregister-ScheduledTask -confirm:$false -WhatIf
            }

        }
        "no" {
            return
        }
        Default { Write-Output "Invalid selection" }
    }

}