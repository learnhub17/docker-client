#### job for mongo check, run every 5 minutes
$jobname = "dockerrun"
$description = "check docker containers daily every 5 minutes"
$script = "$HOME\appdata\docker-client\dockerrun.ps1"
$logout = "$HOME\appdata\docker-client\logs\log.txt"
$repeat = (New-TimeSpan -Minutes 5)
$duration = ([timespan]::FromDays(1000))
$principal = New-ScheduledTaskPrincipal -userID "$env:USERDOMAIN\$env:USERNAME" -LogonType S4U

$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "$script >>$logout"
$trigger = New-ScheduledTaskTrigger -once -at (get-date).Date -RepetitionInterval $repeat  -RepetitionDuration $duration
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "$jobname" -Description "$description" -Principal $principal

### job for startup docker daemon
$jobname1 = "dockerstart"
$description1 = "check docker start only on startup"
$script1 = "$HOME\appdata\docker-client\dockerstart.ps1"
$principal = New-ScheduledTaskPrincipal -userID "$env:USERDOMAIN\$env:USERNAME" -LogonType S4U

$action1 = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "$script1
$trigger1 = New-ScheduledTaskTrigger -AtStartup 
Register-ScheduledTask -Action $action1 -Trigger $trigger1 -TaskName "$jobname1" -Description "$description1" -Principal $principal
