$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "C:\Users\anand\Desktop\docker-client\dockerrun.ps1 >>C:\Users\anand\Desktop\docker-client\logs\log.txt"
$trigger =  New-ScheduledTaskTrigger -Daily -At 02:26:20am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "dockerrun" -Description "start docker machine for mongo and daemon-client"
