$profiles = gci -path '\\server\share\'
foreach ($userprof in $profiles){
    $lastwrite = get-item ($userprof.FullName + '\UPM_Profile\ntuser.dat') -Force
    if ((((get-date) - ($lastwrite).LastWriteTime).days) -ge 90){
            # Uncomment for read only logging
        #Write-Host $userprof.FullName 
            # Uncomment for deletion
        #remove-item $userprof.FullName -Recurse -Force
    }
}