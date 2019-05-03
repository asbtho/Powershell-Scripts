asnp Citrix*
$desktopgroup = Get-BrokerDesktopGroup -Name "Teknisk"
$DesktopGroupUid = $DesktopGroup.Uid
Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid | Export-CSV c:\temp\application101.csv