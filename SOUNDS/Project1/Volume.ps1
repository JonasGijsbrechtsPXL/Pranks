function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)};
$audioLevel = $audioLevel / 2;100..$audioLevel | % {$wshShell.SendKeys([char]175)}}

$url = "https://listenonrepeat.com/watch?v=UVSvTOWnuGk#Funny_Turtle_Vine%2C_Panting"

while ($true) {
    set_AudioLevel -Volume 100
    Start-Process $url
    Start-Sleep -Seconds 2
}

