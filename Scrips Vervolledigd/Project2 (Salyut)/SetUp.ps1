# Set language to Russian
$language = "ru-RU"
Set-WinSystemLocale -SystemLocale $language -Force
Set-WinUserLocale -Language $language -Force
Set-WinHomeLocation -GeoId 185 -Force
Set-WinCultureFromLanguageListOptOut -OptOut $false -Force

# Set keyboard layout to Russian
Set-WinUserLanguageList -LanguageList 'ru-RU' -Force
Set-WinInputMethodCultureList -InputMethodLanguageList 'ru-RU' -Force
Set-WinDefaultInputMethodOverride -InputMethod '0409:00000419' -Force

# Set text-to-speech (assuming you have Russian TTS installed)
$voice = Get-WmiObject -Namespace "Root\cimv2" -Class Win32_SpVoice
$voice.Voice.VoiceID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SPEECH\Voices\Tokens\TTS_MS_RU-RU_IRINA_11.0"

# Restart Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
Start-Process explorer

# Example of running another script
$scriptPath = ".\Remember,NoRussian"

# Check execution policy
$executionPolicy = Get-ExecutionPolicy
Write-Host "Current Execution Policy: $executionPolicy"

# Change execution policy if needed
if ($executionPolicy -eq "Restricted") {
    Set-ExecutionPolicy RemoteSigned
    Write-Host "Execution Policy changed to RemoteSigned"
}

# Run the script
& $scriptPath

