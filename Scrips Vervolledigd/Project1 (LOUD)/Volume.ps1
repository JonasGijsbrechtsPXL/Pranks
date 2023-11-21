function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)};
$audioLevel = $audioLevel / 2;100..$audioLevel | % {$wshShell.SendKeys([char]175)}}

$url = "https://www.youtube.com/watch?v=BGUUjqL3Tgw&t=789s&ab_channel=nubileasmr"


$AppName = "Chrome.exe"

while ($true) {
    $appRunning = Get-Process | Where-Object { $_.ProcessName -eq $AppName }

    if ($appRunning) {
        while ($true) {
            set_AudioLevel -Volume 100
            start-sleep -Seconds 1
        } }
    else {
        while ($true) {
            Start-Process $url
        set_AudioLevel -Volume 100
            Start-Sleep -Seconds 2
        }
    }

}
