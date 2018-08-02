asnp citrix*

$logonDate = (get-date).AddDays(-30)
 
Get-BrokerDesktop -maxrecordcount 1000 | Select-Object MachineName,{$_.AssociatedUserNames},LastConnectionTime | where-object {$_.LastConnectionTime -le $logonDate} | Export-Csv -Path "MachinesWithoutLogonOver30Days.csv"