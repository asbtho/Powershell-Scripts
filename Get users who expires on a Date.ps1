# Set how many days ahead from todays date you want to check
$ExpireMin = (Get-Date).AddDays(7);
$ExpireMax = (Get-Date).AddDays(9);

get-aduser -SearchBase "Ou DistinguishedName here" -filter 'enabled -eq $true' -properties AccountExpirationDate, LastLogonDate | Where-Object{$_.AccountExpirationDate -lt $ExpireMax -and $_.AccountExpirationDate -gt $ExpireMin} | Export-Csv c:\temp\usersWhoExpires.csv -encoding "unicode"