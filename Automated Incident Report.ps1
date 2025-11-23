# Interactive PowerShell Report Generator with Browser Search, Clipboard, and Outlook Integration
# Automatically retrieve time and day to define what greeting shall be used
function Get-TimeOfDay {
    $CurrentTime = Get-Date
    $CuttoffTime = Get-Date -Hour 11 -Minute 59 -Second 59
    if ($CurrentTime -lt $CuttoffTime) {
        $Greeting = "Good morning"
    }
    else {
        $Greeting = "Good afternoon"
    }
    return $Greeting
}
# Prompt user for input
$DateTime = Get-Date -Format "MM/dd/yyyy HH:mm"
$Greeting = Get-TimeOfDay
$Agency = Read-Host "Enter the issuing agency"
$AssetName = Read-Host "Enter the asset name"
$Email = Read-Host "Enter the user's email address"
$SupervisorEmail = Read-Host "Enter the supervisor's (CC) email address"
$Subject = Read-Host "Enter the subject line"
$Issue = Read-Host "Enter the issue name (e.g., mysql.exe, network error, etc.)"
# Automatically search for the description of the issue online
Write-Host "`Opening browser to search for information on '$Issue'..." -ForegroundColor Cyan
$searchQuery = [uri]::EscapeDataString("What is $Issue")
Start-Process "https://www.google.com/search?q=$searchQuery"
# Prompt user to input description after viewing the search results
Write-Host "Take a moment to review the search results, then describe the issue below." -ForegroundColor Cyan
$IssueDescription = Read-Host "Enter a description for the issue"
# Create the narrative report using string interpolation
$Report = @"
-------------------------------------------------
                INCIDENT REPORT
-------------------------------------------------
$Greeting,

On $DateTime, the issuing agency **$Agency** reported an issue involving asset **$AssetName**.

The issue identified was **$Issue**.

Description:
$IssueDescription

The user associated with this asset can be contacted at **$Email**.

-------------------------------------------------
End of Report
-------------------------------------------------
"@
# Output the report to the terminal
Write-Host "Generated Report:" -ForegroundColor Green
Write-Host $Report
# Copy the generated report to clipboard automatically
$Report | Set-Clipboard
Write-Host "(The report has been copied to your clipboard!)" -ForegroundColor Green
# Try to open a new Outlook email draft with the report content
try {
    Write-Host "Attempting to open Outlook draft..." -ForegroundColor Yellow
    $Outlook = New-Object -ComObject Outlook.Application
    $Mail = $Outlook.CreateItem(0) # 0 = Mail item
    $Mail.To = $Email
    $Mail.CC = $SupervisorEmail
    $Mail.Subject = $Subject
    $Mail.Body = $Report
    $Mail.Display() # Opens the draft (does NOT send automatically)
    Write-Host "Outlook email draft created successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Could not open Outlook. Make sure it is installed and configured." -ForegroundColor Red
    Write-Host "Your report has been copied to clipboard and displayed above, so you can paste it manually." -ForegroundColor Green
}
