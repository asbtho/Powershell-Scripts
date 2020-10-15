asnp Citrix*

# Get initial delivery group
$desktopGroup = Get-BrokerDesktopGroup -Name "Delivery Group Name"
$DesktopGroupUid = $desktopGroup.Uid

# Get all applications from delivery group
$allApplications = Get-BrokerApplication -AssociatedDesktopGroupUid $DesktopGroupUid -MaxRecordCount 10000

# For each application in delivery group check if it has multiple unique delivery groups
ForEach ($app in $allApplications)
{
    $appDesktopGroupUids = $app.AssociatedDesktopGroupUids
    #Write-Host "Found Delivery Groups: $appDesktopGroupUids"

    $appAppGroupUids = $app.AssociatedApplicationGroupUids
    #Write-Host "Found App Groups: $appAppGroupUids"

    $allDesktopGroupUids = $app.AllAssociatedDesktopGroupUids
    #Write-Host "All Associated Delivery Groups: $allDesktopGroupUids"

    if ($appAppGroupUids.Count -gt 0) {
        #Write-Host "Application Name:" $app.Name
        #Write-Host "Found Delivery Group: $appDesktopGroupUids"
        #Write-Host "Found App Group: $appAppGroupUids"
        #Write-Host "All Delivery Group Uids: $allDesktopGroupUids"

        # Check if application has more than one unique delivery group, if so do loops to list all
        if (($allDesktopGroupUids|select -Unique).count -ne 1){
            Write-Host "'"$app.ApplicationName"' contains multiple delivery groups: "

            $deliveryGroupsList = @()
            $appGroupDeliveryGroupList = @()
            [string]$a = $null
            [string]$b = $null

            # List all delivery groups tied to application group for the application
            ForEach ($appGroupUid in $appAppGroupUids){
                $appGroupName = (Get-BrokerApplicationGroup -Uid $appGroupUid).Name
                $appGroupDesktopGroupUids = (Get-BrokerApplicationGroup -Uid $appGroupUid).AssociatedDesktopGroupUids
                ForEach ($appGroupDesktopGroup in $appGroupDesktopGroupUids){
                    $desktopGroupName = (Get-BrokerDesktopGroup -Uid $appGroupDesktopGroup).Name
                    #Write-Host "Application Group Delivery Group:"$desktopGroupName
                    $formatString = $appGroupName + ": " + $desktopGroupName
                    $appGroupDeliveryGroupList += $formatString
                }
            }

            # List all delivery groups tied to application
            ForEach ($appDesktopUid in $appDesktopGroupUids){
                $name = (Get-BrokerDesktopGroup -Uid $appDesktopUid).Name
                #Write-Host "Delivery Group:"$name
                $deliveryGroupsList += $name
            }

            
            $a = $deliveryGroupsList -join "+"
            #Write-Host $a

            $b = $appGroupDeliveryGroupList -join "+"
            #Write-Host $b

            # Print Output in CSV friendly format
            $scriptOutput = $app.ApplicationName+","+$a+","+$b
            Add-Content -Path "C:\temp\log.txt" -Value $scriptOutput

        }
    }
}

Write-Host "Job Done, CSV output to C:\temp\log.txt"