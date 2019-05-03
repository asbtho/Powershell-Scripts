asnp Citrix*
$desktopgroup = Get-BrokerDesktopGroup -Name "Teknisk"
$DesktopGroupUid = $DesktopGroup.Uid

foreach ($Application in (Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid -MaxRecordCount 9999)) {
    Add-BrokerUser "teknisk\TG-Citrix TEST 2016" -Application $Application.Name
}