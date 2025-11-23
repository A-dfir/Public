# Case Study: Windows Logon Anomaly Investigation

## 📌 Scenario
A workstation showed multiple failed logons followed by a successful login from an unexpected account during non-business hours.

## 🎯 Objective
- Determine if the activity represents credential stuffing or brute force  
- Identify artifacts of lateral movement  
- Build a timeline of attacker actions

## 🧪 Tools Used
- Windows Event Viewer  
- Sysmon logs  
- PowerShell (Get-WinEvent)  
- Timeline reconstruction (csv output)

## 🔍 Key Findings
- ~200 failed logon attempts from 10.0.5.23
- Successful login using `localadmin` at 03:14 AM
- Process execution consistent with command-line reconnaissance
- No evidence of data exfiltration

## 📊 Artifacts Analyzed
- Security.evtx (4624/4625/4672)
- Sysmon Event ID 1, 3, 7, 11
- Prefetch files
- Registry Run keys
- Timeline in `timeline.csv`

## 📝 Conclusion
The activity was malicious. Evidence supports a brute-force login followed by recon. Machine was isolated, credentials rotated, and logs archived.
