# USBscanner
scripts to enable automatic scanning of USB drives using Windows and Windows Defender

How to enable automatic USB scanning
1. copy files to "C:\USBscanner"
2. Create a new task scheduler task
 - Run when user is logged on
 - Trigger at log on of any user
 - Action, start a program
 - program/script: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
 - Arguments: -windowstyle hidden -ExecutionPolicy Unrestricted -File "C:\USBscanner\triggerOnUSB.ps1"
3. Modify "triggerOnUSB.ps1" so that all (non-USB) used drive letters are commented out from the startup scan
4. reboot or start task.
