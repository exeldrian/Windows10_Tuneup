<#

QuickProfileCopy
Exeldrian 5/27/20

Grabs important folders from all users on a specific computer and backs
them up to a user-specified folder, or grabs user data that has already
been backed-up and copies it down to a specified user profile on the PC.

Run this from C:> or it gets weird!

You may need to Set-ExecutionPolicy -ExecutionPolicy Unrestricted from
an admin PoSH window if you get complaints from Windows about running
scripts it doesn't recognize.

All Hail the Great Spaghetti-O

#>

# Get a direction to copy
do { $direction = Read-Host("Are you <b>acking up or <r>estoring? b/r") }
until($direction -eq "b" -or $direction -eq "r")

# Act according to direction
switch ($direction) {
    "b" { # backup
        $dest = Read-Host("Specify a destination path. If a drive letter, include ':'. If a path, do not end with '\'  ") # Set destination path

        $sources = Get-ChildItem -Path C:\Users -Directory | Where-Object { $_ -notlike "C:\Users\Public"} # Generate an array containing user profiles currently on the PC

        $size = Get-ChildItem "$sources" -Recurse | Where-Object {$_ -notlike "AppData"} | Measure-Object -Property Length -Sum
        $sizeGB = "{0:N1}" -f ($size.sum/1GB)

        Clear-Host
        Write-Host("You are about to copy $sizeGB from : ")
        $sources.name

        do { $go = Read-Host("Proceed? y/n") }
        until($go -eq "y" -or $go -eq "n")

        switch ($go) {

            "y" {
                foreach ($source in $sources) { # Do the thing

                    $userName = Split-Path "$source" -Leaf # grabs just the last folder in the path

                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Desktop $dest\$userName\Desktop
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Documents $dest\$userName\Documents
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Favorites $dest\$userName\Favorites
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Contacts $dest\$userName\Contacts
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\AppData\Local\Microsoft\Outlook $dest\$userName\AppData\Local\Microsoft\Outlook
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Downloads $dest\$userName\Downloads
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Pictures $dest\$userName\Pictures
                    robocopy.exe /xo /v /e /w:1 /r:1 $source\Videos $dest\$userName\Videos
                    }
            
                Clear-Host
                Write-Host "All done! $source copied to $dest\$source!"

                }
            
            "n" {

                Clear-Host
                Write-Host "Operation cancelled by User."
                
            }
        }
    }
    "r" { # Restore

        $oldUserPath = Read-Host("Enter a path to the user backup. I.E. D:\Backup\Bob ") # where am I grabbing the backup from

        $newUser = Read-Host("Enter the target user profile. I.E. Timmy ") # where am I putting it on the new PC
        $copyTo = "C:\Users\$newUser" # set up a string for the target directory
    
        robocopy.exe /e /v /xo /w:1 /r:1 $oldUserPath $copyTo # do the thing
        
        Write-Host "All done! $oldUserPath copied to $copyTo!" # all done
    }

}
