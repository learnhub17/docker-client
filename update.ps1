$data=[environment]::GetEnvironmentVariable('clientpath', 'user')
$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')

$logout = "$HOME\appdata\docker-client\logs\update.json"
powershell.exe $HOME\appdata\docker-client\env.ps1 $args[0] $args[1]
echo "new version $newversion"
echo "data path is $data" 

docker ps | findstr daemon-client
$clientservice=$LASTEXITCODE

if ($clientservice -eq 0) 
 { 

    echo "daemon-client container is running, going to stop remove and pull new version $version !!!!"

    $a = '"'+ $newversion +'"'
    echo "{" >$logout
    docker inspect daemon-client | Select-string "original4sure/daemon-client" >>$logout
    echo '"newversion":'"$a," >>$logout
    echo '"status":"Started"' >>$logout
    echo "}" >>$logout

    docker pull original4sure/daemon-client:$newversion
    docker ps
    echo "stopping daemon-client"
    docker stop daemon-client
    echo "removing daemon-client"
    docker rm daemon-client
    docker run -idt --name daemon-client -v ${data}:/data --link mongo:mongo --restart=unless-stopped -p 7000:7000 original4sure/daemon-client:$newversion 
    echo "deleting original4sure/daemon-client:$oldversion"
    docker rmi -f original4sure/daemon-client:$oldversion
    docker ps

    $a = '"'+ $newversion +'"'
    echo "{" >$logout
    docker inspect daemon-client | Select-string "original4sure/daemon-client" >>$logout
    echo '"newversion":'"$a," >>$logout
    echo '"status":"Done"' >>$logout
    echo "}" >>$logout
  } 
else { echo " daemon-client is not runing !!!!" 
 docker ps
 docker rm daemon-client
 docker run -idt --name daemon-client -v ${data}:/data --link mongo:mongo --restart=unless-stopped -p 7000:7000 original4sure/daemon-client:$newversion
 docker ps
}
