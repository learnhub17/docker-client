$dir=$args[0]
[Environment]::SetEnvironmentVariable("clientpath", "$dir", "user")
$data=[environment]::GetEnvironmentVariable('clientpath', 'user')

$dir=$args[1]
[Environment]::SetEnvironmentVariable("clientversion", "$dir", "user")
$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')

#if ($args.Count -eq 1) 
#{ echo "argument 1 is:"$args[0]

#$dir=$args[0]
#[Environment]::SetEnvironmentVariable("clientpath", "$dir", "user")
#$newversion=[environment]::GetEnvironmentVariable('clientpath', 'user')
#echo $newversion
#}
#else
#{echo "number of arg received is:"$args.Count}
