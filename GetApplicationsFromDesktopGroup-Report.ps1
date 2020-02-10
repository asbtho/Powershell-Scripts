asnp Citrix*
$desktopgroup = Get-BrokerDesktopGroup -Name "Teknisk"
$DesktopGroupUid = $DesktopGroup.Uid
Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid | Export-CSV c:\temp\application101.csv -Encoding UTF8
# For object properties use Select-Object. Example:
# Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid | Select-Object PublishedName,{$_.AssociatedUserNames} | Export-CSV c:\temp\application101.csv -Encoding UTF8
