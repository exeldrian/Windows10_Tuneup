<#
# Get the ID and security principal of the current user account
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal = new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator

# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole)) {
    # We are running "as Administrator" - so change the title and background color to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
}
else {
    # We are not running "as Administrator" - so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
}

#>

if(-not (Test-RunningCredentials)){
    msg console "RUN AS ADMIN"
    exit
}

    #Import Modules
    Import-module (Join-Path $PSScriptRoot "/modules/win10TuneUp.psd1") -force

    #List of available tasks
    $tasks = Get-ScheduledTask | Where { $_.TaskPath -notlike "\Microsoft\*" }


    #gather task object
    $taskToRemove = $tasks.Where( { $_.taskname -eq $ans })

    #creds = Get-Credential
    Remove-DesiredTasks -TaskToRemove $taskToRemove -Process "yes" # Perform task removal

    #Check if task was removed
    $tasks = Get-ScheduledTask | Where { $_.TaskName -eq $ans }
    if ($tasks.count -eq 0) {
        Write-Output "Task was removed"
    }
    else {
        $tasks
    }

    Pause  #Don't want other window to close.