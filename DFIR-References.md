# DFIR Quick Reference | Cheat-Sheet
### 🛡️ MDE Live Response ###
Copy a file
```
getfile c:\path\to\file\nameoffile.txt
```
Collect MFT
```
getfile "$MFT"
```
Find a file
```
findfile "file.txt"
```
Find metadata of file
```
fileinfo "file.exe"
```
See all processes
```
processes
```
Restore a remdiated item
```
undo
```
Quarantine a file
```
remediate file C:\Path\To\File.exe
```
### 🛡️ Elastic/Kibana ###
Logon Remote Events Query
```kql
event.code: 4624 AND winlog.logon.type: 10
```
Observing downloaded files
```kql
FROM logs-*
| WHERE event.category == "file" AND event.action IN ("creation","open")
| WHERE process.name IN ("chrome.exe","firefox.exe","msedge.exe","safari.exe","iexplore.exe","opera.exe","curl.exe","wget.exe")
| WHERE file.extension IN ("exe","msi","dll","dmg","pkg","zip","rar","7z","tar.gz","iso","bat","sh","ps1")
| KEEP @timestamp, user.name, process.name, file.name, file.path, url.original, host.name 
| SORT @timestamp DESC
```
### 💡 Useful PowerShell Commands ###
Finding a file in an unknown location on the C:\ drive
```ps1
GCI -Path C:\ -Recurse -Filter "nameoffile.txt" -ErrorAction SilentlyContinue
```
Add wild card for unknown file type
```ps1
gci -Path C:\ -Recurse -Filter "nameoffile*" -ErrorAction SilentlyContinue
```
Obtain a list of running processes on a machine
```ps1
Get-Process -ComputerName HOSTNAME | Select-Object -Property ID,Handles,ProcessName | Format-Table -autosize
```
Obtain a list of applications on the device 
```ps1
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Out-GridView
```
```ps1
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | sort -Property DisplayName | Export-CSV C:\anypath\applications.csv
```
Obtain a list of currently connected devices on a machine
```ps1
Get-PnpDevice -PresentOnly | Where-Object InstanceId -Like USB* | sort Class | Format-Table -AutoSize
```
Same command but for remote machines
```ps1
 Get-PnpDevice -CimSession hostname.domain -PresentOnly | Where-Object InstanceId -Like USB* | sort Class | Format-Table -AutoSize
```
### ⚡PowerShell Automation ###
Automated Incident Report.ps1
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
C:\Windows\Users\%UserProfile%\AppData\Local\Microsoft\Edge\User Data\Default\History
C:\Windows\Users\%UserProfile%\AppData\Local\Google\Chrome\User Data\Default\History
```
Evidence of execution
```
C:\Windows\Prefetch
```
```
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{GUID}\Count
# (If {GUID} = CEBFF5CD | Executable File Execution) OR (If {GUID} = F457C4B | Shortcut File Execution)
```
```
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidMRU
```
```
NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
```
Recently opened files from Windows Explorer
```
C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items
```
PowerShell event logs
```
C:\Windows\System32\winevt\logs\Microsoft-Windows-PowerShell%40Operational.evtx
```
```
C:\Windows\System32\winevt\Logs\Windows PowerShell.evtx
```
### #️⃣ Hashing ###
```
certutil -hashfile C:\pathtofile\file.exe md5
```
```ps1
Get-FileHash C:\pathtofile\file.csv -Algorithm SHA384 | Format-List
```
### 🤖 Robocopy ###
Copy everything
```
robocopy /E C:\pathtotarget\ C:\pathtodestination
robocopy /E \\hostnameorIP\c$\pathtotarget C:\pathtodestination
```
Single file
```
robocopy C:\pathtotarget "%CD%" $MFT
robocopy \\hostnameorIP\c$\pathtotarget c:\pathtodestination $MFT
```
### 📎 RawCopy ###
```
#Put rawcopy onto affected device
copy C:\localpathto\rawcopy.exe \\hostnameorip\c$\pathtodestination\
wmic /node:hostnameorIP process call create 'cmd.exe /c \\uhostnameorIP\c$\pathtorawcopy'
```
### 📃 Dir commands ###
Organize by date
```
dir /OD \\hostnameorIP\c$\path
dir /OD c:\path
dir /OD C:\Windows\Prefetch
```
Findstr / grep functions 
```
dir "nameoffile.exe" /s
dir C:\path\filename*
dir c:\path\to\parentdirectory | findstr / i nameoffile
```
Hidden files
```
dir /ah C:\$recycle.bin
```
Recently opened attachment's as preview or opened file
```
dir /S /OD \\iporhostname\C$\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\Content.Outlook\ 
```
### 🪫 Initiate remote shutdown of device ###
```
shutdown /r /f /m \\hostnameorIP
```
### ➖ Uninstalling / Removing items ###
Remove directory
```
rd /s /q C:\targetpath
```
Remove with MSIExec
```
msiexec /x <wmic ID> /qn
```
### 🤐 Zip files ###
To view contents without unzipping 
```
tar -tf C:\filepath\file.zip
```
### 💻 WMIC ###
Find USB's and map to port if device is on-hand
```
wmic diskdrive get  Model,Name,InterfaceType,SerialNumber
```
Get installed applications non-user tied
```
wmic /node:hostname product get name,description,identifyingnumber,installsource
```
Installed applications 
```
wmic /node:hostname product get name,version,vendor
```
Get Process list and info
```
wmic /node:hostname process get ProcessId,Description,ParentProcessId,ExecutablePath | sort | findstr /i nameoffile
```
Get MFT 
```
wmic /node:hostnameorip process call create 'cmd.exe /c \\hostnameorip\c$\pathtorawcopy\rawcopy64.exe /filenamepath "C:0" /outputpath:\hostnameorip\c$\pathtosavedevidence\onremotemachine'
```
### 📍 Common Mac Locations ### 
User Home Directory Artifacts
Most user activity on macOS is under the user’s home folder:
```bash
~/Library/
```
Logs
```bash
~/Library/Logs/
Application-specific logs, crash reports.
```

Preferences (Plist files)
```bash
~/Library/Preferences/*.plist
Tracks app configurations, recently accessed items, user choices.
```

Application Support
```bash
~/Library/Application Support/
Contains app-specific data, caches, histories.
```
Safari Browser Artifacts
```bash
History: ~/Library/Safari/History.db
Downloads: ~/Library/Safari/Downloads.plist
Cookies: /Library/Cookies/Cookies.binarycookies
Chrome / Brave / Edge Browser Artifacts
~/Library/Application Support/Google/Chrome/Default/
History, cookies, logins, cache.
```
Mail.app
```bash
~/Library/Mail/V#
Emails, envelopes, logs.
```
Keychains
```bash
~/Library/Keychains/
Local password storage (encrypted).
```
