#Remember, No Russian
#Define the language, keyboard layout, and speech language
$language = "ru-RU"
$keyboardLayout = "00000419"
$speechLanguage = "ru-RU"

Set-WinUserLanguageList -LanguageList $language -Force
Set-WinDefaultInputMethodOverride -InputMethodId $keyboardLayout -LanguageTag $language -Force
Set-WinSystemLocale -SystemLocale $language -Force
Set-WinUILanguageOverride -Language $language -Force
Set-WinSpeechLanguage -LanguageTag $speechLanguage -Force

Get-WinUserLanguageList
Get-WinDefaultInputMethodOverride
Get-WinSystemLocale
Get-WinUILanguageOverride
Get-WinSpeechLanguage

#Plan task + reset
Register-ScheduledTask -TaskName "Greets Jonas" -Trigger (New-ScheduledTaskTrigger -AtLogon) -Action (New-ScheduledTaskAction -Execute "${Env:WinDir}\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-WindowStyle Hidden -Command `"& 'C:\Remember,NoRussian.ps1'`"") -RunLevel Highest -Force;
Restart-Computer -Force