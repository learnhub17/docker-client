$jobname = "dockerrun"
$description = "check docker containers daily every 5 minutes"
#$script = "C:\Users\anand\Desktop\test.ps1"
#$logout = "C:\Users\anand\Desktop\log.txt"
$script = "$HOME\appdata\dockerrun.ps1"
$logout = "$HOME\appdata\logs\log.txt"

$repeat = (New-TimeSpan -Minutes 5)
$duration = ([timespan]::FromDays(1000))

$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "$script >>$logout"
$trigger = New-ScheduledTaskTrigger -once -at (get-date).Date -RepetitionInterval $repeat  -RepetitionDuration $duration
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "$jobname" -Description "$description"
