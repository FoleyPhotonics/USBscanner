#Written by Ben Foley, 20/10/2020
#Requires -version 2.0

#scan all drives
write-host (get-date -format s) " Scanning Existing USB drives..."
start-process "C:\USBscanner\scanUSB.bat " "A:"
start-process "C:\USBscanner\scanUSB.bat " "B:"
# start-process "C:\USBscanner\scanUSB.bat " "C:"
start-process "C:\USBscanner\scanUSB.bat " "D:"
start-process "C:\USBscanner\scanUSB.bat " "E:"
start-process "C:\USBscanner\scanUSB.bat " "F:"
start-process "C:\USBscanner\scanUSB.bat " "G:"
start-process "C:\USBscanner\scanUSB.bat " "H:"
start-process "C:\USBscanner\scanUSB.bat " "I:"
start-process "C:\USBscanner\scanUSB.bat " "J:"
start-process "C:\USBscanner\scanUSB.bat " "K:"
start-process "C:\USBscanner\scanUSB.bat " "L:"
start-process "C:\USBscanner\scanUSB.bat " "M:"
start-process "C:\USBscanner\scanUSB.bat " "N:"
start-process "C:\USBscanner\scanUSB.bat " "O:"
start-process "C:\USBscanner\scanUSB.bat " "P:"
# start-process "C:\USBscanner\scanUSB.bat " "Q:"
# start-process "C:\USBscanner\scanUSB.bat " "R:"
# start-process "C:\USBscanner\scanUSB.bat " "S:"
start-process "C:\USBscanner\scanUSB.bat " "T:"
# start-process "C:\USBscanner\scanUSB.bat " "U:"
start-process "C:\USBscanner\scanUSB.bat " "V:"
start-process "C:\USBscanner\scanUSB.bat " "W:"
start-process "C:\USBscanner\scanUSB.bat " "X:"
start-process "C:\USBscanner\scanUSB.bat " "Y:"
start-process "C:\USBscanner\scanUSB.bat " "Z:"
Register-WmiEvent -Class win32_VolumeChangeEvent -SourceIdentifier volumeChange
write-host (get-date -format s) " Beginning watch script..."
do{
$newEvent = Wait-Event -SourceIdentifier volumeChange
$eventType = $newEvent.SourceEventArgs.NewEvent.EventType
$eventTypeName = switch($eventType)
{
1 {"Configuration changed"}
2 {"Device arrival"}
3 {"Device removal"}
4 {"docking"}
}
write-host (get-date -format s) " Event detected = " $eventTypeName
if ($eventType -eq 2)
{
$driveLetter = $newEvent.SourceEventArgs.NewEvent.DriveName
$driveLabel = ([wmi]"Win32_LogicalDisk='$driveLetter'").VolumeName
write-host (get-date -format s) " Drive name = " $driveLetter
write-host (get-date -format s) " Drive label = " $driveLabel

start-process "C:\USBscanner\scanUSB.bat "$driveLetter
}
Remove-Event -SourceIdentifier volumeChange
} while (1-eq1) #Loop until next event
Unregister-Event -SourceIdentifier volumeChange