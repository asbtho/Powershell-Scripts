$users = ForEach ($user in $(Get-Content C:\temp\users.txt)) {
    Get-AdUser $user -Properties Department,Mail  
}
 
$users | Select-Object SamAccountName,Department,Mail | Export-CSV -Path C:\temp\output.csv -NoTypeInformation