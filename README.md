# Windows10_Tuneup
Some scripts from a newbie to tune up a Windows 10 box

## CreateBackupTask - WIP
Allows you specify multiple source directories, a destination, and a time,
then generates an automated task to copy sources into .\<destination>\<source>
at the specified time daily

## FolderSize - WIP
Gets the size of a directory. Eventually it will be able to accept multiple
folder paths so the user can compare their sizes. Will be very useful comparing
original size to the size of a copy (i.e. a mirrored or delta backup).

## QuickProfileCopy
Used to copy all user folders on a drive to another drive. Can also take
a specific user folder backup and restore it to an existing user profile.
This is exceptionally useful when replacing or upgrading PCs.

## TaskSchedulerCleaner
Allows you to automate cleaning up Windows 10 Task Scheduler
By default, it will ignore tasks named 'Backup'
