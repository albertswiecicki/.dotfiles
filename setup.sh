#!/bin/sh

sudo apt install vim neovim git htop python3-pip less tmux zsh wget curl lolcat font-manager timeshift

pip3 install gpustat

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

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

~/.dotfiles/bind.sh
~/.dotfiles/scripts/update_tmux.sh

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hermit.zip
unzip Hermit.zip -d Hermit
cp -r Hermit/ /usr/share/fonts/truetype/
rm -rf Hermit*
echo "Please set font in console profile settings <Hurmit medium>"
read -p "Press enter to continue"

echo "Please remember to setup timeshift"
read -p "Press enter to continue"

echo "Please re-login after changing the shell"
read -p "Press enter to continue"
chsh -s /bin/zsh
