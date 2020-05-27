#Import Modules
Import-module (Join-Path $PSScriptRoot "/modules/win10TuneUp.psd1") -force
if(-not (Test-RunningCredentials)){
    msg console "RUN AS ADMIN"
    exit
}


$Form1_Load = {
    #List of available tasks
    $tasks = Get-ScheduledTask | Where { $_.TaskPath -notlike "\Microsoft\*" }| foreach-object { $checkedlistbox1.Items.add($_.TaskName) } | out-null

    #gather task object
    $taskToRemove = $tasks.Where( { $_.taskname -eq $ans })
}


#Check if task was removed
#$tasks = Get-ScheduledTask | Where { $_.TaskName -eq $ans }
if ($tasks.count -eq 0) {
    Write-Output "Task was removed"
}
else {
    $tasks
}


$button2_Click = {

    $tasks = $checkedlistbox1.checkedItems
    foreach ($task in $tasks) {
        Unregister-ScheduledTask -TaskName $task -confirm:$false

    }

    $countItems = $checkedListBox1.Items.count
    for ($i = 0; $i -lt $countItems; $i++) {
        $checkedlistbox1.Items.RemoveAt(0)
    }

    $tasks = Get-ScheduledTask | Where { $_.TaskPath -notlike "\Microsoft\*" }
    $tasks.Taskname | foreach-object { $checkedlistbox1.Items.add($_) }

}

. (Join-Path $PSScriptRoot 'Form1.designer.ps1')

$Form1.ShowDialog()