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
```bash
echo -e "remove control = Control_L\n\
remove mod4 = Super_L Super_R\n\
keysym Control_L = Super_L\n\
keysym Super_L = Control_L\n\
keysym Super_R = Control_L\n\
add control = Control_L Control_R\n\
add mod4 = Super_L Super_R" > ~/.Xmodmap

xmodmap ~/.Xmodmap
```

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