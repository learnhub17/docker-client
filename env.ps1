$dir=$args[0]
[Environment]::SetEnvironmentVariable("clientpath", "$dir", "user")
$data=[environment]::GetEnvironmentVariable('clientpath', 'user')

$dir=$args[1]
[Environment]::SetEnvironmentVariable("clientversion", "$dir", "user")
$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')

$dir=$args[2]
[Environment]::SetEnvironmentVariable("clientversion", "$dir", "user")
$oldversion=[environment]::GetEnvironmentVariable('clientversion', 'user')
