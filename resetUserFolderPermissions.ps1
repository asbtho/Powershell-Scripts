<#
Source: https://help.redinsight.com/en/knowledgebase/article/resetting-permissions-on-folderredirections-folder
Added /A to takeown command to take ownership as administrators group instead of current admin user

Script to reset user folder permissions.
Uses: icacls.exe and takeown.exe

For all folders in base folder:
1. Recursively resets owner to Administrators
2. Reset folder to inherit permissions and apply to subfolders/files, clearing any existing perms
3. Add user (based on folder name) with full control and apply to subfolders/files
4. Recursivley reset owner to user (based on folder name)
#>

$mainDir = "C:\temp\test"
write-output $mainDir
$dirs = gci "$mainDir" |? {$_.psiscontainer}
foreach ($dir in $dirs){
    $user = $dir.basename
    #$user = $user.Trim(".fqdn") # Use this if folders contain extra letters after username
    #$user = "domain\" + $user # Use this to prepend domain name if user is in other domain
    write-output $dir.fullname
    write-output $user
    takeown.exe /F $($dir.fullname) /A /R /D Y |out-null
    icacls.exe $($dir.fullname) /reset /T /C /L /Q
    icacls.exe $($dir.fullname) /grant ($($user) + ':(OI)(CI)F') /C /L /Q
    icacls.exe $($dir.fullname) /setowner $($user) /T /C /L /Q
}
