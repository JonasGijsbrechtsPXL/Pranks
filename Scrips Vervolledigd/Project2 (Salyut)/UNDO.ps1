# Check if running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run the script as an administrator."
    exit
}

# Remove scheduled task
Unregister-ScheduledTask -TaskName "ChangeToRussian" -Confirm:$false

# Reset language settings to default (English)
Set-WinSystemLocale -SystemLocale en-US -Force
Set-WinUserLocale -Language en-US -Force
Set-WinHomeLocation -GeoId 244 -Force
Set-WinCultureFromLanguageListOptOut -OptOut $true -Force

# Reset keyboard layout to default (US)
Set-WinUserLanguageList -LanguageList 'en-US' -Force
Set-WinInputMethodCultureList -InputMethodLanguageList 'en-US' -Force
Set-WinDefaultInputMethodOverride -InputMethod '0409:00000409' -Force

# Restart Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
Start-Process explorer

Write-Host "Settings reverted to default. Task removed. Please restart your computer for the changes to take full effect."