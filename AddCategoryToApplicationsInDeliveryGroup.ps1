asnp Citrix*
$desktopgroup = Get-BrokerDesktopGroup -Name "TEST - Teknisk 2016"
$DesktopGroupUid = $DesktopGroup.Uid

foreach ($Application in (Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid -MaxRecordCount 9999)) {
    Set-BrokerApplication -InputObject $Application -ClientFolder "Windows Server 2016 TEST"
}