##########################
#  ARRAYS VS HASHTABLES  #
##########################
#https://kevinmarquette.github.io/2016-11-06-powershell-hashtable-everything-you-wanted-to-know-about/

#define an array: @()
$array  = @("item1","item2","item3")

#add an item to an array:
$array += "item4"

#see all items in array:
$array

#loop through each item in an array:
foreach ($item in $array)
{  
    write-host $item -ForegroundColor yellow 
}

#HASHTABLES: @{}
$hashtable = @{"Item1" = "Value1"; "Item2" = "Value2"}

#address a hash item by name:
Write-host "$($hastable.item1)" -foregroundcolor yellow 
Write-host "$($hastable['item1'])" -foregroundcolor yellow 

#add an item to a hashtable:
$hashtable.add("item3" = "value3")
$hashtable.item4 = "Value4"

#update an existing value
$hashtable.item1 = "VALUE1.0"

#remove a key/value
$hashtable.remove("Item2")

###########################################################
#hashtables sometimes act like an object, but not always  #
#cast it to object behavior on purpose if needed          #
###########################################################
$hashtable #regular
[pscustomobject]$hashtable #should be displayed as an object

#save a hashtable to CSV
$hashtable | foreach {[PSCustomObject]$_ } | export-csv -path "hashedcsv.csv"

#save a mutlilevel hashtable as JSON file
$hashtable | convertto-json | out-file "hashtablejson.json"

#read json into an object (NOTE NOT AN ACTUAL HASHTABLE UPON IMPORT)(this is usually ok)
$object = get-content -path "hashtablejson.json" -raw  | convertfrom-json
$object

#######################################
# PRACTICAL APPLICATION OF HASHTABLES #
#######################################
# store settings for later use
$settings = @{}
$settings.server = read-host -prompt "Enter Servername"
$settings.owner  = read-host -prompt "Enter business owner"
$settings.IP     = read-host -prompt "Enter IP address"
# write to disk 
$settings | convertto-json | out-file "Settings.json"

$settings = $null
#read settings in a script later
$settings = get-content -path "settings.json" -raw | ConvertFrom-Json

write-host "here are the settings we'll use:"
write-host "Server is $($settings.server)"
write-host "Owner is $($settings.Owner)"
write-host "IP is $($settings.IP)"
  