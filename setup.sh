#!/bin/bash

# install instructions from https://linuxnewbieguide.org/how-to-install-linux-on-a-macintosh-computer/

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
# goto Software & updates > Additional Drivers > select latest wifi and graphics(kept nouveau for now) and apply changes


#uninstall nvidia driver
sudo apt-get remove --purge nvidia-driver-415
sudo apt autoremove
sudo apt-get remove --purge *nvidia*
#check with
dpkg -l | grep nvidia
# may not be necessary. caution: remove if needs to be blacklisted 
echo 'nouveau' | sudo tee -a /etc/modules

# setup git
ssh-keygen
sudo apt install xclip
xclip -sel clip ~/.ssh/id_rsa.pub
# paste this key to github acc. under new ssh key

sudo apt install git
git config --global user.name "Akshit Jain"
git config --global user.email "jaina488@gmail.com"
git config --global color.ui true

# install vscode https://code.visualstudio.com/docs/setup/linux
sudo apt install curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code


