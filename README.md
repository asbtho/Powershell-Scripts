# Powershell-Scripts
Collection of scripts

Use at own risk

### General / AD

* [addComputers.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/addComputers.ps1) - Add computers from CSV file to Logon Workstations for every user in an OU
* [Get users who expires on a Date.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/Get%20users%20who%20expires%20on%20a%20Date.ps1) - Check which users expires on a certain date in the future
* [Get-Uptime.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/Get-Uptime.ps1) - Get local computer uptime
* [GetUserLastLogon.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetUserLastLogon.ps1) - Get users last logon time and last password change time
* [GetProfilesModifiedWithin.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetProfilesModifiedWithin.ps1) - Get names of top folders where any subfiles/folders have been written to within last XX days
* [resetUserFolderPermissions.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/resetUserFolderPermissions.ps1) - Recursively reset owner to user (based on folder name)
* [controlServicesOnMultipleMachines.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/controlServicesOnMultipleMachines.ps1) - Template for controlling multiple services on multiple servers. Needs editing based on what you want to do.



### Useful for Citrix
* [MachinesWithoutLogonOver30Days.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/MachinesWithoutLogonOver30Days.ps1) - Find Desktop VDIs which have not been used over 30 days
* [MigrateMyDocumentsWithPermissions.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/MigrateMyDocumentsWithPermissions.ps1) - Move only one profile subfolder for multiple users from one share to another, keep permissions
* [controlServicesOnMultipleMachines.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/controlServicesOnMultipleMachines.ps1) - Edit services on multiple machines
* [findBrokenSIDCitrix.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/findBrokenSIDCitrix.ps1) - Find and list broken SID in Citrix Studio Applications
* [AddGroupToApplicationsInDeliveryGroup.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/AddGroupToApplicationsInDeliveryGroup.ps1) - Add AD user or group to all applications in delivery group
* [GetApplicationsFromDesktopGroup-Report.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetApplicationsFromDesktopGroup-Report.ps1) - Export a CSV with all applications from delivery group

