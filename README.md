## CVE-2025-8088 — Startup Items Dropped and Executed by WinRAR/UnRAR

### 🔎 Query 1: Identify Suspicious Startup Folder Drops

```kql
let SuspiciousDrops =
DeviceFileEvents
| where Timestamp > ago(14d)
| where ActionType in ("FileCreated","FileRenamed")
| where FolderPath has @"\Start Menu\Programs\Startup"
| where tolower(InitiatingProcessFileName) in ("winrar.exe","unrar.exe","rar.exe","unrar.dll")
| project DeviceId, DeviceName, DropTime=Timestamp, FileName, FullPath=FolderPath, 
          Dropper=InitiatingProcessFileName, DropperCmd=InitiatingProcessCommandLine;
```
### 🚨 Query 2: Identify Execution of Those Dropped Startup Items
```kql
DeviceProcessEvents
| where Timestamp > ago(14d)
| where FolderPath has @"\Start Menu\Programs\Startup"
| project DeviceId, DeviceName, ProcTime=Timestamp, FileName, ProcessCommandLine, InitiatingProcessFileName
| join kind=innerunique SuspiciousDrops on DeviceId, DeviceName, FileName
| where ProcTime between (DropTime .. DropTime + 3d)
| project ProcTime, DropTime, DeviceName, FileName, ProcessCommandLine, InitiatingProcessFileName, Dropper, DropperCmd
| order by ProcTime desc
