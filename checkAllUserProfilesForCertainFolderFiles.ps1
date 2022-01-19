#Script to find if certain folder in user profile share contains files or is empty.

$path = "H:\Users\"

$parentDirs = Get-ChildItem -Path $path -Directory -Force -ErrorAction SilentlyContinue

foreach ($dir in $parentDirs){
    $filename = '*.*'
    $searchinfolder = $path + $dir + "\Chrome\UserData\Default\blob_storage*"
    if (Test-Path -Path $searchinfolder) {
        Get-ChildItem -Path $searchinfolder -Filter $filename -Recurse | %{$_.FullName}
    } else {
        #Path doesn't exist.
    }
}