REM netsh advfirewall firewall set rule name="WinRM-HTTP" new action=allow <-- original replaced by line(s) below

cmd.exe /c sc config winrm start= auto
cmd.exe /c net start winrm