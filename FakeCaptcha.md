# 🛑 Fake CAPTCHA Social-Engineering Attack

A breakdown of the attack chain, MITRE ATT&CK mapping, why it’s common, and how to prevent it.

# Overview

The Fake CAPTCHA attack is a social-engineering technique where users are tricked into executing malicious code under the guise of completing a CAPTCHA verification. Instead of exploiting software vulnerabilities, the attacker exploits trust and user behavior.

A victim clicks a malicious link or compromised site. Instead of real content, they encounter a fraudulent CAPTCHA page. The page instructs the user to copy a block of text—presented as a “verification code”—and paste it into the Windows Run dialog. When executed, the command retrieves a payload from a remote server and runs it, enabling follow-on malicious activity.

This technique bypasses many traditional security controls because the user is tricked into performing each harmful step.

# 🧩 Attack Chain
Stage	Description	MITRE ATT&CK Technique
Initial lure	User is led to a malicious link or compromised webpage	T1566 – Phishing / T1189 – Drive-by Compromise
Deceptive CAPTCHA page	Page imitates a real CAPTCHA to lower user suspicion	(Supports social engineering techniques)
User copies malicious text	Victim is convinced to copy a script disguised as a “verification code”	T1204.001 – User Execution: Malicious Link / Content
Execution via Run dialog	User pastes text into the Run prompt, executing attacker-controlled commands	T1059 – Command/Scripting Interpreter
Payload retrieval	Script downloads malware from an attacker’s C2 server	T1071 – Application Layer Protocol
Ingress tool transfer	Additional payloads or tools are delivered	T1105 – Ingress Tool Transfer
Post-infection actions	Credential theft, persistence mechanisms, lateral movement, etc.	Varies (e.g., T1003 – Credential Dumping)
# 📈 Why This Attack Is Becoming So Common
1. Social engineering is cheaper and more reliable than exploits

There’s no need for attackers to find zero-days or bypass modern browser protections. Convincing a user to run code is easier and cheaper.

2. Users trust familiar UI elements

CAPTCHAs are ubiquitous and benign. Attackers exploit this trust by mimicking common CAPTCHA designs.

3. It bypasses many security tools

Because the user manually runs the malicious command:

•	No exploit is required

•	No unwanted file initially touches disk

•	Script execution appears user-initiated

This allows the attack to evade early detection.

4. Browsers have hardened against traditional malware delivery

With drive-by downloads and plugin exploits largely mitigated, attackers have shifted toward user-driven execution techniques, which browsers cannot directly block.

5. Scales extremely well

Fake CAPTCHA pages can be mass-produced and distributed via:

•	Malvertising

•	Compromised legitimate sites

•	Redirect chains

This makes widespread deployment trivial.

6. Users often act quickly under cognitive load

People multitask, click through prompts, and follow instructions without deep scrutiny—especially when a CAPTCHA appears during content access.

7. Instructions appear “technical,” lending fake legitimacy

The page often poses as a cloud protection service or verification workflow, giving the instructions an air of authority.

# 🛡️ Prevention & Mitigation
•	User Awareness

•	Legitimate CAPTCHA systems never require copying text into Run, PowerShell, CMD, or a console.

•	Train users to close suspicious verification pages immediately.

•	Browser & Endpoint Controls

•	Enable safe browsing, anti-malvertising protections, and popup warnings.

•	Use EDR solutions that inspect suspicious script execution or outbound traffic patterns.

•	Restrict Script Execution

•	Apply PowerShell Constrained Language Mode, AppLocker, or Windows Defender Application Control (WDAC).

•	Block unauthorized or unsigned scripts from executing.

•	Network Controls

•	Use DNS/web filtering to block malicious domains.

•	Restrict outbound connections to unknown or newly registered hosts.

•	OS & Account Hardening

•	Limit user privileges where possible (non-admin accounts).

•	Keep browsers, OS, and plugins up to date.

•	Monitoring & Detection

•	Alert on unusual Run dialog execution patterns.

•	Watch for unexpected script interpreter activity or network requests following user interaction.

# 📘 Summary

Fake CAPTCHA attacks are rising because they exploit human trust, require minimal attacker skill, and effectively bypass many security protections. By understanding the attack chain, recognizing social-engineering cues, and implementing layered security controls, organizations can significantly reduce the risk of this increasingly common threat.
