# Start of Settings 
# End of Settings

$Report = @()
Foreach ($vApp in $CIVApp) {
	($vApp.ExtensionData.Section | Where {$_.GetType().Name -eq "NetworkConfigSection" }).NetworkConfig | Foreach {
		$Details = "" | Select Name, Network
		$Details.Name = $vApp.Name
		$Details.Network = $_.NetworkName
		$Report += $Details
	}
}
$Report


$Title = "All vApp Networks"
$Header =  "List of all vApp Networks"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCAAudit"
