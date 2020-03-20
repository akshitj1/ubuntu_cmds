# My ubuntu cheatsheet
## Shortcuts
Function | Shortcut
---|---
delete word| `ctrl+w`  
window resize|`super+left/right/up/down`  
clear terminal| `ctrl+l`

## Change key binding for macbook pro
1. Make sure keyboard layout is correctly set 
`dpkg-reconfigure keyboard-configuration` and then restart.
2. swap `super` and `ctrl` keys
[ref](https://ineed.coffee/881/configure-the-keyboard-for-your-macbook-and-ubuntu-12-04/)
create file `~/.Xmodmap` with contents 
```bash
remove control = Control_L
remove mod4 = Super_L Super_R
keysym Control_L = Super_L
keysym Super_L = Control_L
keysym Super_R = Control_L
add control = Control_L Control_R
add mod4 = Super_L Super_R
```
and then run `xmodmap ~/.Xmodmap`

## Brightness bug fix
add this to `touch /etc/rc.local && chmod +x /etc/rc.local` (init script)
```sh
#!/bin/sh -e
# brightness bug fix
setpci -v -H1 -s 00:01.00 BRIDGE_CONTROL=0

exit 0
```

To manually start without restart:  
`systemctl start/status rc-local.service`

## Ubuntu Overheating fix (didn't worked)
disable intel_pstate [ref](https://brezular.com/2019/02/05/ubuntu-18-04-overheating/)

check no longer intel_pstate after restart  
`cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver`

## blue light filter(flux like)

install redshift `apt-get install redshift`. add config `~/.config/redshift.conf` from [doc](http://jonls.dk/redshift/)
with values 
```
temp-day=4500
temp-night=2500
lat=20.6
lon=79
```