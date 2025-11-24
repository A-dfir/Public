# Case Study: AWS Unauthorized Access Investigation

## 📌 Scenario
AWS GuardDuty alerted on unusual IAM API calls from an IP outside normal geo patterns.

## 🎯 Objective
- Identify root cause of the anomalous login
- Review IAM activity around the compromise window
- Determine whether privileges were escalated

## 🔍 Key Findings
- IAM user logged in from foreign IP not associated with the company
- `ListUsers`, `ListAccessKeys`, and `CreateAccessKey` API calls executed
- MFA was not enabled on the affected account (policy gap)
- No S3 access or EC2 modifications observed

## 🛠 Cloud Logs Reviewed
- CloudTrail  
- GuardDuty  
- IAM Access Analyzer  
- VPC Flow Logs  

## 📝 Conclusion
Compromise likely caused by credential exposure. Immediate action taken:
- Deactivated leaked access key
- Enabled enforced MFA policies
- Rotated all IAM credentials
