# Windows10_Tuneup
Some scripts from a newbie to tune up a Windows 10 box

## TaskSchedulerCleaner
Allows you to automate cleaning up Windows 10 Task Scheduler
By default, it will ignore tasks named 'Backup'

## CreateBackupTask - WIP
Allows you specify multiple source directories, a destination, and a time,
then generates an automated task to copy sources into .\<destination>\<source>
at the specified time daily