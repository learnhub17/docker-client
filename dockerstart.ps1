start-sleep -s 90
$processes = Get-Process "*docker for windows*"

if ($processes.Count -gt 0)
{
    $processes[0].Kill()
    $processes[0].WaitForExit()
}
Start-Process "C:\Program Files\Docker\Docker\Docker for Windows.exe"
