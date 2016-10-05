REM netsh advfirewall firewall set rule name="WinRM-HTTP" new action=block <-- original commented out and replace with line below

sc config winrm start=demand

C:/windows/system32/sysprep/sysprep.exe /generalize /oobe /unattend:C:/Windows/Panther/Unattend/unattend.xml /quiet /shutdown
