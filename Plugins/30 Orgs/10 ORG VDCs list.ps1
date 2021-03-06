# Start of Settings 
# End of Settings

$AllOrgs = @()
Foreach ($Org in $OrgVDC) {
    $TotalCPUUsedGhz = ($VMCPUUsage | Where { $_.OrgVDC -eq ($org.Name) } | Measure-Object -Property CPUUsageMHzAvg -Sum).Sum * 0.001
    $AllOrgs += $Org | Select Name, AllocationModel, Enabled, @{Name="CPUUsedGHZ";Expression={"$TotalCPUUsedGhz"}}, CPULimitGhz, MemoryUsedGB, MemoryLimitGB, StorageUsedGB, StorageLimitGB
}

$AllOrgs

$Title = "List of all VDCs"
$Header =  "List of all VDCs"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCAAudit"
