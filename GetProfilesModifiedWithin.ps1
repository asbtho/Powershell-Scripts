#Gets name of top folders which have been modified within last amount of days (set with $days variable)

$days = 50
$path = "\\server\profileParentFolder\"
$output = "C:\temp\profilesLog.txt"

New-Item -Path $output -ItemType File -Force
Clear-Content $output

$parentDirs = Get-ChildItem -Path $path -Directory -Force -ErrorAction SilentlyContinue

foreach ($dir in $parentDirs){
    $lastWriteTime = Get-ChildItem -Path $path$dir -Recurse | Select LastWriteTime
    foreach ($writeTime in $lastWriteTime){
        Write-Output $writeTime.LastWriteTime
        Write-Output $dir.Name
        if ($writeTime.LastWriteTime -gt (Get-Date).AddDays(-$days)){
            $writeTimeString = $writeTime.LastWriteTime
            $outputString = "$dir `t`t| Last Write Time: $writeTimeString"
            Out-File -append -filepath $output -InputObject $outputString
            break
        }
    }
}
