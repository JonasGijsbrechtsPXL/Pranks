$scriptPath = "C:\Project2 (SALYUT)\Remember,NoRussian.ps1"
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $scriptPath"
$trigger = New-ScheduledTaskTrigger -AtStartup -RepetitionInterval ([TimeSpan]::FromHours(1))
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "PRANK" -User $null -Password $null -RunLevel Highest -Force