files_to_bind=".bash_aliases .bash_custom .bashrc .vimrc .git-prompt.sh"
echo "You are going to overide following files"
for f in ${files_to_bind}; do echo ${f}; done;
read -p "Are you sure? [Y|y]: " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "She sad yes XD"
    for f in ${files_to_bind}; do
    if [ -f ~/.dotfiles/${f} ]; then
		if [ -f ~/${f} ]; then
			echo removing ~/${f}
			rm  ~/${f}
		fi
		echo linking ~/.dotfiles/${f} into ~/${f}
    	ln -s ~/.dotfiles/${f} ~/${f}
	else
		echo "Warning ~/.dotfiles/${f} is missing"
    fi
    done;
else
    echo "Aborded"
fi

