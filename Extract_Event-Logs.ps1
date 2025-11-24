Get-WinEvent -LogName Security |
  Where-Object {$_.Id -in 4624,4625,4672} |
  Export-Csv "auth_events.csv"
