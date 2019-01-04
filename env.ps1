$dir=$args[0]
[Environment]::SetEnvironmentVariable("clientpath", "$dir", "user")
$data=[environment]::GetEnvironmentVariable('clientpath', 'user')

$dir=$args[1]
[Environment]::SetEnvironmentVariable("clientversion", "$dir", "user")
$newversion=[environment]::GetEnvironmentVariable('clientversion', 'user')

if ($args.Count -eq 3) 
{ echo "argument 1 is:"$args[0]
  echo "argument 2 is:"$args[1]
  echo "argument 3 is:"$args[2]

$dir=$args[2]
[Environment]::SetEnvironmentVariable("oldclientversion", "$dir", "user")
$oldversion=[environment]::GetEnvironmentVariable('oldclientversion', 'user') 
echo $oldversion
}
else
{echo "number of arg received is:"$args.Count}
