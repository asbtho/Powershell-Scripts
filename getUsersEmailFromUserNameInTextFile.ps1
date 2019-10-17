####################################################################################
#
# BASIC
#
####################################################################################
$users = ForEach ($user in $(Get-Content C:\temp\users.txt)) {
    Get-AdUser $user -Properties Department,Mail  
}
 
$users | Select-Object SamAccountName,Department,Mail | Export-CSV -Path C:\temp\output.csv -NoTypeInformation





####################################################################################
#
# IF DATA IS NOT STRAIGHT FORMATTED FROM AD
# NEEDS TO BE ADJUSTED BASED ON OWN INPUT PREFERENCES
#
####################################################################################
#$users = ForEach ($user in $(Get-Content C:\temp\inputusers.txt)) {
#    $separator = "."
#    $nameArray = $user.split($separator)
#    $firstname = $nameArray[0]
#    $lastName = $nameArray[$nameArray.Count-1]
#
#    #Write-Host $firstname $lastName
#
#    Get-ADUser -Filter "Name -like '*$lastName*'" -Properties * | Where {($_.Surname -eq $lastName) -and (($_.GivenName -eq $firstName) -or ($_.DisplayName -like "*$firstname*"))} | Select DisplayName,samAccountName,Mail
#}
# 
#$users | Select-Object DisplayName,samAccountName,Mail | Export-CSV -Path C:\temp\output.csv -Encoding UTF8 -NoTypeInformation
