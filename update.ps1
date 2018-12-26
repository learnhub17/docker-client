powershell.exe $HOME\appdata\docker-client\env.ps1 $args[0] $args[1] $args[2]
$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')
$oldversion=[environment]::GetEnvironmentVariable('clientversion', 'user')

docker ps | findstr daemon-client
$clientservice=$LASTEXITCODE


if ($clientservice -eq 0) 
{ echo "daemon-client container is running, going to stop remove and pull new version $version !!!!"
 docker stop daemon-client
 docker rm daemon-client
 docker pull original4sure/daemon-client:$newversion 
 docker rmi -f $oldversion
}
else { echo "daemon-client conatiner is not exist, going to stop and remove"
 docker rm daemon-client
 docker pull original4sure/daemon-client:$newversion 
 docker rmi -f original4sure/daemon-client:$oldversion
 }
