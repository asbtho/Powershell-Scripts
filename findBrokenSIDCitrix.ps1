Write-Host "Importing the Citrix Modules..."
asnp Citrix*
 
$PublishedApps = Get-BrokerApplication | Where {$_.AssociatedUserNames -like "S-1-5-21*"}
Foreach($app in $PublishedApps)
{
Write-Host ” –” $app.Name "is broken"
}