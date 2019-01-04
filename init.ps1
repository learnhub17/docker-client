powershell.exe $HOME\appdata\docker-client\env.ps1 $args[0] $args[1]
powershell.exe $HOME\appdata\docker-client\taskschedule.ps1

$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')
$oldversion=[environment]::GetEnvironmentVariable('oldclientversion', 'user')

echo $newversion
docker pull mongo:4.0.4
docker pull original4sure/daemon-client:$newversion
powershell.exe $HOME\appdata\docker-client\dockerrun.ps1
