# Initialize some variables
$sources = @()
$backup = @()

# Ask user for source directory
While (1) {
$sources += Read-Host('What directory do you want to back up? (Ex. E:)')
$more = Read-Host('Add another? y/n')
    if ($more -ne 'y') {
        break  
    }
}
# Ask user for destination directory
$dest = Read-Host('Where do you want to back up to? (Ex. F:)')

# Ask user for when
$when = Read-Host('What time do you want the automated backup to run? (Daily in 24hr time)')

# Ask for credentials
$user = Read-Host('Enter the administrative username')
$pass = Read-Host('Enter the administrative password')

# Make the task
foreach ($source in $sources) {
        $backup += "ROBOCOPY /XO /E /V /W:1 /R:1 " + "$source $dest" + "\:" + $source
}

<# Here is the do-the-thing part... How do we pass $backup and $when to it?

Register-ScheduledTask
    -Password $pass
    -User $user
    -TaskName 'Backup'
    -Action <CimInstance[]>
    -Description 'Automated backup task'
    -Settings <CimInstance>
    -Trigger <CimInstance[]>
    -AsJob

#>