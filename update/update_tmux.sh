#!/bin/sh
if ! [ $(id -u) = 0 ]; then
 echo "y\n" | sudo apt install autotools-dev automake pkg-config libevent-dev libncurses5-dev
else
  echo "y\n" | apt install autotools-dev automake pkg-config libevent-dev libncurses5-dev
fi

cd /tmp/
git clone https://github.com/tmux/tmux.git
cd tmux
./autogen.sh
./configure && make
