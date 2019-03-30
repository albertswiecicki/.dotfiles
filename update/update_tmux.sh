#!/bin/sh
sudo apt install autotools-dev automake pkg-config
cd /tmp/
git clone https://github.com/tmux/tmux.git
cd tmux
./autogen.sh
./configure && make
