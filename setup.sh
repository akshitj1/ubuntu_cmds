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

# mount external harddisk
sudo apt-get install vim
sudo apt install terminator
sudo apt-get install exfat-fuse exfat-utils
# mount from file explorer

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
# Install extensions https://code.visualstudio.com/docs/editor/extension-gallery
code --install-extension ms-vscode.cpptools
code --install-extension ms-iot.vscode-ros



# setup redshift
sudo apt-get install redshift
redshift -O 2200


# install ros http://wiki.ros.org/melodic/Installation/Ubuntu
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo apt-get install python-rosdep
sudo rosdep init
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && source ~/.bashrc
sudo apt-get install python-pip
sudo pip install catkin-tools

# begin setting up workspace
CATKIN_HOME=~/ext/workspace/catkin_ws
cd $CATKIN_HOME
catkin build
echo "source $CATKIN_HOME/devel/setup.bash" >> ~/.bashrc && source ~/.bashrc