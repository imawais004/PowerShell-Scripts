# Create a new scheduled task trigger
$trigger = New-JobTrigger -At 10:00 -Daily

# Register the script as a scheduled task
Register-ScheduledJob -Name 'Move Files Daily' -Trigger $trigger -ScriptBlock {
    # Script to move files, skips top10 files
            Get-ChildItem -Path D:\Folder -Filter "$fileType*.txt" -Recurse | Sort-Object LastWriteTime | Select-Object -Skip 10 | Move-Item -Destination <Path>
    }
