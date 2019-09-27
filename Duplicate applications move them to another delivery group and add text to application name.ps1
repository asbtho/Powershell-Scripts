###
#
# HOW TO USE: FIRST DUPLICATE ALL APPLICATIONS IN DELIVERY GROUP, THEN SELECT DUPLICATED APPLICATIONS AND MOVE THEM TO APPLICATION FOLDER(AdminFolderName)
#
# RUN SCRIPT AND IT WILL REMOVE SOURCE DELIVERY GROUP FROM THOSE APPLICATION FOLDER APPLICATIONS, ADD THE DESTINATION DELIVERY GROUP AND RENAME THEM TO NAME + $newNameExtra while removing the _1 duplicate name part
#
##########################################################


asnp citrix*


##########################################################
#INITIAL CONFIGURATION VARIABLES


$sourceDeliveryGroup = "Source Delivery Group"
$destinationDeliveryGroup = "Destination Delivery Group"

# THIS WILL BE DUPLICATED APP - "_1" + $newNameExtra
$newNameExtra = " TEST 2016" 

# APPLICATION FOLDER NAME WHICH DUPLICATED APPLICATIONS ARE IN
$adminFolderName = "Windows Server 2016\"


#INITIAL CONFIGURATION VARIABLES
##########################################################

$desktopgroup = Get-BrokerDesktopGroup -Name $sourceDeliveryGroup
$DesktopGroupUid = $DesktopGroup.Uid
$apps = Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid -AdminFolderName $adminFolderName -Enabled $true | select ApplicationName
	 
$apps

foreach ($app in $apps){
    $in = Get-BrokerApplication -ApplicationName $app.ApplicationName
    Write-Host “Duplicating app to new deliverygroup: ” $in.ApplicationName
    #$in | Add-BrokerApplication -DesktopGroup $destinationDeliveryGroup
    #$in | Remove-BrokerApplication -DesktopGroup $sourceDeliveryGroup
}

$desktopgroup2 = Get-BrokerDesktopGroup -Name $destinationDeliveryGroup
$DesktopGroupUid2 = $desktopgroup2.Uid
$apps2 = Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid2 -AdminFolderName $adminFolderName -Enabled $true | select ApplicationName

$apps2

foreach ($app2 in $apps2){
    $in2 = Get-BrokerApplication -ApplicationName $app2.ApplicationName
    $newname = $in2.ApplicationName
    $newname = $newname.Substring(0,$newname.Length-2)
    $newname = $newname + $newNameExtra
    Write-Host “Renaming app from: " $in2.ApplicationName " to " $newname
    #$in2 | Set-BrokerApplication -PublishedName $newname
    #$in2 | Rename-BrokerApplication -NewName $newname
}