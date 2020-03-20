# Shortcuts
delete word
ctrl+w
window resize:
super+left/right/up/down
clear terminal:
ctrl+l

# changing key binding for mac
1. First make sure keyboard layout is correctly set
dpkg-reconfigure keyboard-configuration
Restart
2. swap command and ctrl keys
https://ineed.coffee/881/configure-the-keyboard-for-your-macbook-and-ubuntu-12-04/
echo -e "remove control = Control_L\n\
remove mod4 = Super_L Super_R\n\
keysym Control_L = Super_L\n\
keysym Super_L = Control_L\n\
keysym Super_R = Control_L\n\
add control = Control_L Control_R\n\
add mod4 = Super_L Super_R" > ~/.Xmodmap
xmodmap ~/.Xmodmap