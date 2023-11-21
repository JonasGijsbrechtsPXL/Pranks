#Volume Hoog houden
function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)};
$audioLevel = $audioLevel / 2;100..$audioLevel | % {$wshShell.SendKeys([char]175)}}

#Speech
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer


#Background
$imagePath = "C:\Project2 (Salyut)\USSR.png"

Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $SPIF_UPDATEINIFILE)

#USSR Anthem
$url = "https://www.youtube.com/watch?v=U06jlgpMtQs&ab_channel=rascrifice"

# Infinite loop

set_AudioLevel -Volume 100
$speak.Speak('Помните, никакого русского! 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 0. Добро пожаловать, моя камераад')
set_AudioLevel -Volume 100

while ($true) {
    set_AudioLevel -Volume 100
    Start-Process $url
    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $SPIF_UPDATEINIFILE)
    Start-Sleep -Seconds (10 * 60)
}