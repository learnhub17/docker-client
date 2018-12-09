$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "C:\Users\anand\Desktop\test.ps1 >>C:\Users\anand\Desktop\log.txt"
$trigger =  New-ScheduledTaskTrigger -Daily -At 02:26:20am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "AppLog" -Description "Daily dump of Applog"
