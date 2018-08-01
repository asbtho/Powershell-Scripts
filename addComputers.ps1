#Get computers list from csv
$complist = Import-Csv -Path "c:\temp1\PCList.csv" | ForEach-Object {$_.NetBIOSName}


$users = Get-ADUser -filter * -SearchBase "OU distinguishedName here"

#loop users in OU
foreach($user in $users){
    
    #get existing computers from user
    $comparray = (Get-AdUser $user -Properties LogonWorkstations).LogonWorkstations

    #add computers from imported csv
    foreach($comp in $complist){
        $comparray += "," + $comp
    }

    #add computers to user
    Set-ADUser $user -LogonWorkstations $comparray
}