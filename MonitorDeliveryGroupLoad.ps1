Add-PSSnapin citrix.*

$ctx = Get-BrokerMachine | Where-Object {$_.DesktopGroupName -notlike "*test*"}
$ctx = $ctx | Select-Object -Property DesktopGroupName -Unique

$WarningThreshold=95
$warning=0
foreach ($group in $ctx){
    $DGN = $group.DesktopGroupName
    $AllDGN = Get-BrokerMachine -DesktopGroupName $DGN -Property loadindex
    foreach ($ts in $AllDGN){
        $DGNLoadSum+=$ts.LoadIndex
        $DGNServers++
    }
    $DGNAvgLoad=$DGNLoadSum/$DGNServers
    $DGNAvgLoad= $DGNAvgLoad/100 
    $DGNAvgLoad=[math]::Round($DGNAvgLoad)
    
    if($WarningThreshold -lt $DGNAvgLoad){
        $WarningMessage+="Desktop Group $DGN farm has an average load of $DGNAvgLoad percent. "
        $warning=1
    }else{
        $ok+="Desktop Group $DGN farm has an average load of $DGNAvgLoad percent. "
    }
    
    Clear-Variable -Name DGNLoadSum
    Clear-Variable -Name DGNServers
    Clear-Variable -Name DGNAvgLoad
}

if($warning -eq 1){
Write-EventLog –LogName Application –Source “Citrix” –EntryType Warning –EventID 2 –Message "$WarningMessage Check Server loads in Delivery Group farm on $env:computername."
}else{
Write-EventLog –LogName Application –Source “Citrix” –EntryType Information –EventID 1 –Message $ok$env:computername.
}
