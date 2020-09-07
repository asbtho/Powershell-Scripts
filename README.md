# Powershell-Scripts
Collection of scripts for my own use

Use at your own risk

### General / AD
* [getUsersEmailFromUserNameInTextFile.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/getUsersEmailFromUserNameInTextFile.ps1) - Get Usernames from text file and output email, department and other properties to CSV file (text file with 1 username per newline).
* [addComputers.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/addComputers.ps1) - Add computers from CSV file to Logon Workstations for every user in an OU.
* [Get users who expires on a Date.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/Get%20users%20who%20expires%20on%20a%20Date.ps1) - Check which users expires on a certain date in the future.
* [Get-Uptime.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/Get-Uptime.ps1) - Get local computer uptime.
* [GetUserLastLogon.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetUserLastLogon.ps1) - Get users last logon time and last password change time.
* [GetProfilesModifiedWithin.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetProfilesModifiedWithin.ps1) - Get names of top folders where any subfiles/folders have been written to within last XX days.
* [resetUserFolderPermissions.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/resetUserFolderPermissions.ps1) - Recursively reset owner to user (based on folder name).
* [controlServicesOnMultipleMachines.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/controlServicesOnMultipleMachines.ps1) - Template for controlling multiple services on multiple servers. Needs editing based on what you want to do.
* [getRemoteServersMemory.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/getRemoteServersMemory.ps1) - Get memory usage and stats for multiple machines (WMI TCP 135+highports + 445 required)



### Useful for Citrix
* [MachinesWithoutLogonOver30Days.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/MachinesWithoutLogonOver30Days.ps1) - Find Desktop VDIs which have not been used over 30 days
* [MigrateMyDocumentsWithPermissions.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/MigrateMyDocumentsWithPermissions.ps1) - Move only one profile subfolder for multiple users from one share to another, keep permissions
* [controlServicesOnMultipleMachines.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/controlServicesOnMultipleMachines.ps1) - Edit services on multiple machines
* [findBrokenSIDCitrix.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/findBrokenSIDCitrix.ps1) - Find and list broken SID in Citrix Studio Applications
* [AddGroupToApplicationsInDeliveryGroup.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/AddGroupToApplicationsInDeliveryGroup.ps1) - Add AD user or group to all applications in delivery group
* [GetApplicationsFromDesktopGroup-Report.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/GetApplicationsFromDesktopGroup-Report.ps1) - Export a CSV with all applications from delivery group
* [AddCategoryToApplicationsInDeliveryGroup.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/AddCategoryToApplicationsInDeliveryGroup.ps1) - Add "Application category" to all applications in delivery group
* [MonitorDeliveryGroupLoad.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/MonitorDeliveryGroupLoad.ps1) - Log the average index load of all delivery groups which name does not contain "test". Send logs to event viewer.
* [Duplicate applications move them to another delivery group and add text to application name.ps1.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/Duplicate%20applications%20move%20them%20to%20another%20delivery%20group%20and%20add%20text%20to%20application%20name.ps1) - Duplicate applications, move them to another delivery group and append text to application name
* [removeUserProfileBackups.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/removeUserProfileBackups.ps1) - Remove all profile folders based on pattern ex. (username.old)
* [removeUserProfilesLastWrite90Days.ps1](https://github.com/asbtho/Powershell-Scripts/blob/master/removeUserProfilesLastWrite90Days.ps1) - Remove all profile folders older than amount of days
