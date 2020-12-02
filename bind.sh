#!/bin/bash
#bind dotfiles from ~/dotfiles/.* with ~/.*
files_to_bind=".bash_aliases .bash_custom .bashrc .vimrc .git-prompt.sh .gitconfig .tmux.conf .zshrc"

echo "You are going to overide following files in home directory"
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


#bind ~/dotfiles/.vimrc with ~/.config/nvim/init.vim.*
read -p "Link ~/.config/nvim/init.vim? [Yy|Nn]: " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -d ~/.config/nvim ]; then
        if ! [ -f ~/.dotfiles/.vimrc ]; then
            echo "Warning ~/.dotfiles/.vimrc is missing, creating empty file"
            touch ~/.dotfiles/.vimrc
        fi
        if [ -f ~/.config/nvim/init.vim ]; then
            echo "removing old ~/.config/nvim/init.vim"
            rm ~/.config/nvim/init.vim
        fi
        ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
        echo "linked ~/.config/nvim/init.vim to ~/.dotfiles/.vimrc"
    else
        echo "No such directory: ~/.config/nvim"
    fi
else
    echo "Aborded"
fi
