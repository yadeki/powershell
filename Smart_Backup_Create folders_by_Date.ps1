# Backup script to back up my USB drives to my NAS

#Variables

 $date = Get-Date -Format d.MMMM.yyyy
 New-PSDrive -Name "Backup" -PSProvider Filesyst "\\192.168.2.203\Data\Backups"
 $source = "E:\"
 $destination = "backup:\$date"
 $path = test-Path $destination
 
# Backup procedure

 if ($path -eq $true) {
    write-Host "Directory Already exists"
    Remove-PSDrive "Backup"  
    } elseif ($path -eq $false) {
            cd backup:\
            mkdir $date
            copy-Item  -Recurse $source -Destination $destination
            $backup_log = Dir -Recurse $destination | out-File "$destination\backup_log.txt"
            $attachment = "$destination\backup_log.txt"
            write-host "Backup procedure done"
            cd c:\
 
 Remove-PSDrive "Backup"  
 }