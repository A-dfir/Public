# Cheat-Sheet
### 🛡️ MDE Live Response ###
Copy a file
```
getfile c:\path\to\file\nameoffile.txt
```
Quarantine a file
```
remediate file C:\Path\To\Your\File.exe
```
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
Browser History File Locations
```
C:\Windows\Users\%UserProfile%\AppData\Microsoft\Edge\User Data\Default\History
C:\Windows\Users\%UserProfile%\AppData\Google\Chrome\User Data\Default\History
```
Evidence of execution
```
C:\Windows\Prefetch
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{GUID}\Count
(If {GUID} = CEBFF5CD | Executable File Execution) OR (If {GUID} = F457C4B | Shortcut File Execution)
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidMRU
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
```
### 📍 Common Mac Locations ### 
User Home Directory Artifacts
Most user activity on macOS is under the user’s home folder:
```
~/Library/
```
Logs
```
~/Library/Logs/
Application-specific logs, crash reports.
```

Preferences (Plist files)
```
~/Library/Preferences/*.plist
Tracks app configurations, recently accessed items, user choices.
```

Application Support
```
~/Library/Application Support/
Contains app-specific data, caches, histories.
```
Safari Browser Artifacts
```
History: ~/Library/Safari/History.db
Downloads: ~/Library/Safari/Downloads.plist
Cookies: /Library/Cookies/Cookies.binarycookies
Chrome / Brave / Edge Browser Artifacts
~/Library/Application Support/Google/Chrome/Default/
History, cookies, logins, cache.
```
Mail.app
```
~/Library/Mail/V#
Emails, envelopes, logs.
```
Keychains
```
~/Library/Keychains/
Local password storage (encrypted).
```
