Het idee:

Vollume altijd 100%
Vollume omlaag = omhoog
Vollume kan niet afgezet worden

powershell

Volume Up:
(new-object -com wscript.shell).SendKeys([char]174)
Volume Down:
(new-object -com wscript.shell).SendKeys([char]175)
Toggle Mute:(
(new-object -com wscript.shell).SendKeys([char]173)

terminal
amixer:
-D: Device
-q: Quiet
amixer -q sset Master ...%(+)

To dissable a key
xmodmap -e 'keycode <Value>='










