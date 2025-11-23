### Cheat-Sheet
### 💡 Useful PowerShell Commands ###
Finding a file in an unknown location on the C:\ drive
```
GCI -Path C:\ -Recurse -Filter "nameoffile.txt" -ErrorAction SilentlyContinue
```
Add wild card for unknown file type
```
gci -Path C:\ -Recurse -Filter "nameoffile*" -ErrorAction SilentlyContinue
```
### ⚡PowerShell Automation ###
Incident Report.ps1
### 📍 Common Windows Locations ###
Registry Event-Log files
```
C:\Windows\System32\config\SAM
C:\Windows\System32\config\security
C:\Windows\System32\config\software
C:\Windows\System32\config\system
C:\Windows\Users\%UserProfile%\NTUSER.dat
```
Browser History
C:\Windows\Users\%UserProfile%\AppData\
