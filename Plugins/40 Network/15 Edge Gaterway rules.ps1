# Start of Settings 
# End of Settings

Function Get-EdgeNATRule ($EdgeGateway)  {  
    $Edgeview = $EdgeGateway | Get-CIView
	if (!$Edgeview) {
		Write-Warning "Edge Gateway with name $Edgeview not found"
		Exit
	}
    $webclient = New-Object system.net.webclient
    $webclient.Headers.Add("x-vcloud-authorization",$Edgeview.Client.SessionKey)
    $webclient.Headers.Add("accept",$EdgeView.Type + ";version=5.1")
    [xml]$EGWConfXML = $webclient.DownloadString($EdgeView.href)
    $NATRules = $EGWConfXML.EdgeGateway.Configuration.EdgegatewayServiceConfiguration.NatService.Natrule
    $Rules = @()
    if ($NATRules){
		$NATRules | ForEach-Object {
	        $NewRule = new-object PSObject -Property @{
	        Name = $Edgeview.name;
            InterfaceName = $_.GatewayNatRule.Interface.Name;
	        Type = $_.RuleType;
	        OriginalIP = $_.GatewayNatRule.OriginalIP;
	        OriginalPort = $_.GatewayNatRule.OriginalPort;
	        TranslatedIP = $_.GatewayNatRule.TranslatedIP;
	        TranslatedPort = $_.GatewayNatRule.TranslatedPort;
	        Enabled = $_.IsEnabled;
	        Protocol = $_.GatewayNatRule.Protocol
	    }
	        $Rules += $NewRule
	    }
	}
    $Rules
}

Foreach ($eg in $CIEGW) {  Get-EdgeNATRule $eg }


$Title = "List of Edge Gateway Rules"
$Header =  "List of Edge Gateway Rules"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCAAudit"

