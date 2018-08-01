$hash_lastLogonTimestamp = @{Name="LastLogonTimeStamp";Expression={([datetime]::FromFileTime($_.LastLogonTimeStamp))}}
$hash_pwdLastSet = @{Name="pwdLastSet";Expression={([datetime]::FromFileTime($_.pwdLastSet))}}
 
get-aduser username -properties lastlogontimestamp,pwdLastSet | select samaccountname, $hash_lastLogonTimestamp,$hash_pwdLastSet