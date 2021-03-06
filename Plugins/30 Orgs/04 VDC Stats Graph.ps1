# Start of Settings 
# End of Settings

Foreach ($org in $OrgVDC) {
    $memdata = @{"MemoryUsedGB"=($org.MemoryUsedGB);"MemoryAllocationGB"=($org.MemoryAllocationGB)}
    $Chart = New-Chart -data $memdata -ChartType Bar -Title "$($org.Name) Memory Usage GB" -height 200 -width 500
    $Chart

    $stordata = @{"StorageUsedGB"=($org.StorageUsedGB);"StorageLimitGB"=($org.StorageLimitGB)}
    $Chart = New-Chart -data $stordata -ChartType Bar -Title "$($org.Name) Storage Usage GB" -height 200 -width 500
    $Chart

    $TotalCPUUsedGhz = ($VMCPUUsage | Where { $_.OrgVDC -eq ($org.Name) } | Measure-Object -Property CPUUsageMHzAvg -Sum).Sum * 0.001    
    $CPUdata = @{"CpuUsedGhz"=$TotalCPUUsedGhz;"CpuAllocationGhz"=($org.CpuAllocationGhz)}
    $Chart = New-Chart -data $CPUData -ChartType Bar -Title "$($org.Name) CPU Usage GHZ" -height 200 -width 500
    $Chart
}

$Title = "VDC Usage Charts"
$Header =  "VDC Usage Charts"
$Comments = ""
$Display = "Chart"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCAAudit"
