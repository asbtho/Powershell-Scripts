# Patching Citrix Master images script

$serverNames = @("server1","server2","server3","server4")
$services = @("Windows Update","Bes Client")

function Show-Menu
{
     param (
           [string]$Title = 'Menu'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "1: Turn ON 'Bes Client' and 'Windows Update' services."
     Write-Host "2: Turn OFF 'Bes Client' and 'Windows Update' services."
     Write-Host "3: Get Services Status on Master Image machines."
     Write-Host "Q: Quit."
}

function TurnOnServices([string[]]$serverNames, [string[]]$services){
    foreach ($computerName in $serverNames) {
        Write-Host "Starting services on" $computerName
        if (Test-WSMan -ComputerName $computerName -ErrorAction Ignore) {
            foreach ($service in $services) {
                Get-Service -Name $service -ComputerName $computerName | Set-Service -StartupType manual
                Get-Service -Name $service -ComputerName $computerName | Start-service
                Get-Service -Name $service -ComputerName $computerName | Format-List -Property Status, Name, DisplayName, Starttype
            }
        }
        else {
            Write-Warning -Message “Could not connect to $computerName”
        }
    }
}

function TurnOffServices([string[]]$serverNames, [string[]]$services){
    foreach ($computerName in $serverNames) {
        Write-Host "Stopping services on" $computerName
        if (Test-WSMan -ComputerName $computerName -ErrorAction Ignore) {
            foreach ($service in $services) {
                Get-Service -Name $service -ComputerName $computerName | Set-Service -StartupType disabled
                Get-Service -Name $service -ComputerName $computerName | Stop-service
                Get-Service -Name $service -ComputerName $computerName | Format-List -Property Status, Name, DisplayName, Starttype
            }
        }
        else {
            Write-Warning -Message “Could not connect to $computerName”
        }
    }
}

function GetServicesStatus([string[]]$serverNames, [string[]]$services){
    foreach ($computerName in $serverNames) {
        Write-Host "Services status on" $computerName
        if (Test-WSMan -ComputerName $computerName -ErrorAction Ignore) {
            foreach ($service in $services) {
                Get-Service -Name $service -ComputerName $computerName | Format-List -Property Status, Name, DisplayName, Starttype
            }
        }
        else {
            Write-Warning -Message “Could not connect to $computerName”
        }
    }
}


do
{
     Show-Menu
     $input = Read-Host "Write selection number and press Enter"
     switch ($input)
     {
           '1' {
                cls
                TurnOnServices -serverNames $serverNames -services $services

           } '2' {
                cls
                TurnOffServices -serverNames $serverNames -services $services

           } '3' {
                cls
                GetServicesStatus -serverNames $serverNames -services $services

           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')