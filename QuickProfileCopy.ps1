<#

QuickProfileCopy
Exeldrian 5/27/20

Grabs important folders from all users on a specific computer and backs
them up to a user-specified folder, or grabs user data that has already
been backed-up and copies it down to a specified user profile on the PC.

You may need to Set-ExecutionPolicy -ExecutionPolicy Unrestricted from
and admin PoSH window if you get complaints from Windows about running
scripts it doesn't recognize.

All Hail the Great Spaghetti-O

#>

# Get a direction to copy
do { $direction = Read-Host("Are you <b>acking up or <r>estoring? b/r") }
until($direction -eq "b" -or $direction -eq "r")

# Act according to direction
switch ($direction) {
    "b" { # backup
        $dest = Read-Host("Specify a destination path. If a drive letter, include ':'. If a path, do not include '\'  ") # Set destination path

        $sources = Get-ChildItem -Path C:\Users  # Generate an array containing user profiles currently on the PC

        foreach ($source in $sources) { # Do the thing

            $userDir = "C:\Users\" + $source
            robocopy.exe /xo /v /e/ /w:1 /r:1 $userDir\Desktop $dest\$source\Desktop
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Documents $dest\$source\Documents
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Favorites $dest\$source\Favorites
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Contacts $dest\$source\Contacts
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\AppData\Local\Microsoft\Outlook $dest\$source\AppData\Local\Microsoft\Outlook
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Downloads $dest\$source\Downloads
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Pictures $dest\$source\Pictures
            robocopy.exe /xo /v /e /w:1 /r:1 $userDir\Videos $dest\$source\Videos
        }

        Write-Host "All done! $userDir copied to $dest\$source!"
    }
    "r" { # Restore

        $oldUserPath = Read-Host("Enter a path to the user backup. I.E. D:\Backup\Bob ")

        $newUser = Read-Host("Enter the target user profile. I.E. Timmy ")
        $copyTo = "C:\Users\$newUser"
    
        robocopy.exe /e /v /xo /w:1 /r:1 $oldUserPath $copyTo
        
        Write-Host "All done! $oldUserPath copied to $copyTo!"
    }

}
