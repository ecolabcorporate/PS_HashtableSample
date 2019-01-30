$hashtable = @{"Item1" = "Value1"; "Item2" = "Value2"}

write-host "Example 1: use getEnumerator" -foregroundcolor green
foreach ($entry in $hashtable.getEnumerator())
{
    write-host "key: $($entry.key), Value: $($entry.value)" -foregroundcolor green
}

#another way
write-host "Example 2: use the .keys property" -foregroundcolor yellow
foreach ($key in $hashtable.keys)
{
    write-host "key: $key, Value: $($hashtable[$key])" -foregroundcolor yellow
}

#and another way:
write-host "Example 3: use the enumerator in a pipeline" -ForegroundColor magenta
$hashtable.getEnumerator() | foreach {
    write-host "key: $($_.key), Value: $($_.value)" -ForegroundColor magenta
} 

