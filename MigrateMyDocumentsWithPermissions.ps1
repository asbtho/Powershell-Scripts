#Declarations, CSV file with format header "username" followed by each users username on each new line:
#This can be retrieved from top folder with 'Get-ChildItem -Path "path" -Directory -Force -ErrorAction SilentlyContinue | Select-Object Name'

$csv = 'C:\scripts\usernames.csv'
$log = 'C:\scripts\robocopyLog.log'
$sourcePath= "\\server\oldProfileShare"
$destinationPath = "\\server\newProfileShare"


#First, do a copy of each users My Documents subfolder, skip if My Documents doesn't exist

Import-Csv $csv | % { $_.username } | % {
  $src = "$sourcePath\$_\My Documents"
  $dst = "$destinationPath\$_\My Documents"
  if (Test-Path -Path $src){
    robocopy $src $dst /e /copyall /r:1 /w:5 /log+:"$log"
  } else {
    write-host "COPY: Path $src does not exist"
  }
}


#Second, copy top level folder ACL permissions as they are not copied with robocopy

Import-Csv $csv | % { $_.username } | % {
  $src = "$sourcePath\$_"
  $dst = "$destinationPath\$_"
  if (Test-Path -Path $dst){
    Get-acl $src | Set-acl -path $dst
  } else {
    write-host "SET ACL: Path $dst does not exist"
  }
}
