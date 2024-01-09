#Volume Hoog houden
function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)};
$audioLevel = $audioLevel / 2;100..$audioLevel | % {$wshShell.SendKeys([char]175)}}

#Speech
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer


#Background
# URL of the image you want to download
$imageUrl = "https://cdn.britannica.com/36/22536-050-E22B1D13/Flag-Union-of-Soviet-Socialist-Republics.jpg"

# Local path to save the downloaded image in the temp directory
$localImagePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "USSR.jpg")

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $localImagePath -UseBasicParsing

# Set the wallpaper
Add-Type -AssemblyName System.Windows.Forms

#USSR Anthem
$url = "https://www.youtube.com/watch?v=U06jlgpMtQs&ab_channel=rascrifice"

# Infinite loop

set_AudioLevel -Volume 100
$speak.Speak('Salut my friend, You will join the comunism. in minus 10 seconds. 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 0. Welcome!')
set_AudioLevel -Volume 100

[System.Windows.Forms.SystemInformation]::Wallpaper = $localImagePath

while ($true) {
    set_AudioLevel -Volume 100
    Start-Process $url
    Start-Sleep -Seconds (10 * 60)
}




