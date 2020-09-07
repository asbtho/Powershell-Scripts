$pattern = ".old"
$profiles = gci -path 'c:\TestFolder\'
foreach ($userprof in $profiles){
    #Write-Host $userprof.FullName 
    if ($userprof.FullName -match $pattern){
            # Uncomment for read only logging
        Write-Host $userprof.FullName 
            # Uncomment for deletion
        remove-item $userprof.FullName -Recurse -Force
    }
}