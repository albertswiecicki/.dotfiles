#!/bin/sh
if ! [ $(id -u) = 0 ]; then
  sudo apt install autotools-dev automake pkg-config libevent-dev libncurses5-dev bison -y
else
  apt install autotools-dev automake pkg-config libevent-dev libncurses5-dev bison -y
fi

cd /tmp/
git clone https://github.com/tmux/tmux.git
cd tmux
./autogen.sh
./configure && make
