#!/bin/bash
#bind dotfiles from ~/dotfiles/.* with ~/.*
files_to_bind=".bash_aliases .bash_custom .bashrc .vimrc .git-prompt.sh .gitconfig .tmux.conf"

echo "You are going to overide following files"
for f in ${files_to_bind}; do echo ${f}; done;

read -p "Are you sure? [Yy|Nn]: " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    for f in ${files_to_bind}; do
        if ! [ -f ~/.dotfiles/${f} ]; then
            echo "Warning ~/.dotfiles/${f} is missing, creating empty file"
            touch ~/.dotfiles/${f}
        fi
        if [ -f ~/${f} ]; then
		    echo removing ~/${f}
		    rm  ~/${f}
	    fi
	    echo linking ~/.dotfiles/${f} into ~/${f}
        ln -s ~/.dotfiles/${f} ~/${f}
    done;
else
    echo "Aborded"
fi
