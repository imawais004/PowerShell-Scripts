# Create a new scheduled task trigger
$trigger = New-ScheduledTaskTrigger -Daily -At "10:00"

# Register the script as a scheduled task
Register-ScheduledTask -TaskName "Move Files Task" -Trigger $trigger -User "NT AUTHORITY\SYSTEM" -ScriptBlock {
    # Script to move files
    foreach($fileType in $fileTypes){
        Get-ChildItem -Path D:\Folder -Filter "$fileType*.txt" -Recurse | Sort-Object LastWriteTime | Select-Object -Skip 10 | Move-Item -Destination <Path>
    }
}
