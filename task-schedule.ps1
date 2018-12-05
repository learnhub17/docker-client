$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '“C:\Users\anand\Desktop\test.ps1"'
$trigger =  New-ScheduledTaskTrigger -Daily -At 02:26:20am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "AppLog" -Description "Daily dump of Applog"
#Register-ScheduledJob –Name ”Monitor Group Management” -Task "abc"
