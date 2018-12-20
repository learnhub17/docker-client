powershell.exe $HOME\appdata\docker-client\env.ps1 $args[0]
powershell.exe $HOME\appdata\docker-client\taskschedule.ps1

docker pull mongo:4.0.4
docker pull sumitanand17/test:v1
powershell.exe $HOME\appdata\docker-client\dockerrun.ps1
