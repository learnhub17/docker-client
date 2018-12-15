$dir=$args[0]
[Environment]::SetEnvironmentVariable("clientpath", "$dir", "user")
$data=[environment]::GetEnvironmentVariable('clientpath', 'user')

