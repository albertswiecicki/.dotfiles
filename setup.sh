#!/bin/sh

sudo apt install vim git htop python3-pip less tmux zsh
pip3 install gpustat
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.dotfiles/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

#allow docker containers use x11
xhost +"local:docker@"

# script responsible for seting up basic configuration

# set swappiness level
if grep -q vm.swappiness /etc/sysctl.conf
then
    echo swappiness is already set
    grep vm.swappiness /etc/sysctl.conf
else
    echo "vm.swappiness = 10" | sudo tee -a /etc/sysctl.conf
    echo swappiness has been set to 10
fi
chsh -s /usr/bin/zsh root
