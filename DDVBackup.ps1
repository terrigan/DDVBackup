<# This can be easily adaped for OneDrive or other cloud storage services that have software that creates local folders for their filestorage
   Set the variable UsingOneDrive or UsingGoogleDrive with a Value of True depending on which service you wish to use. You can set this to run in a
   Scheduled Task for Windows to automate your backups. You need to install the Google Drive or OneDrive desktop app to make use of this script. This
   script creates a folder on your Cloud storage called DDVBackups and stores your backup with a date and time stamp.#>
   #Written by Dumont The Tailor for DDV Discord on 1/28/23.
$UsingOneDrive = "False"
$UsingGDrive = "True"
$DDVPath = "$env:USERPROFILE\AppData\LocalLow\Gameloft"
$OneDrivePath = "$env:USERPROFILE\OneDrive"
$GDrivePath = "$env:USERPROFILE\My Drive"

if ($UsingOneDrive -eq "True") {
   if (Test-Path -Path $OneDrivePath\DDVBackups) 
   {
   Compress-Archive -Path $DDVPath -Update -DestinationPath $OneDrivePath\DDVBackups\DDVBackup-$(Get-Date -UFormat "%Y-%m-%d_%H-%m-%S").zip
   }
   else
   {
   New-Item $OneDrivePath\DDVBackups -ItemType Directory   
   Compress-Archive -Path $DDVPath -Update -DestinationPath $OneDrivePath\DDVBackups\DDVBackup-$(Get-Date -UFormat "%Y-%m-%d_%H-%m-%S").zip
   }
}
else {
}
if ($UsingGDrive -eq "True") {
   if (Test-Path -Path $GDrivePath\DDVBackups) 
   {
   Compress-Archive -Path $DDVPath -Update -DestinationPath $GDrivePath\DDVBackups\DDVBackup-$(Get-Date -UFormat "%Y-%m-%d_%H-%m-%S").zip
   }
   else
   {
   New-Item $GDrivePath\DDVBackups -ItemType Directory
   Compress-Archive -Path $DDVPath -Update -DestinationPath $GDrivePath\DDVBackups\DDVBackup-$(Get-Date -UFormat "%Y-%m-%d_%H-%m-%S").zip
   }
}
else {
exit
}
