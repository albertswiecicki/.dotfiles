#general
alias caja='caja . &'
alias htop='htop -d 3'
alias gpustat='gpustat -i 0.2'
alias _clear='clear && clear && clear'
alias __restart_net_menager='sudo service network-manager restart'

# dotfiles
alias dot='cd ~/.dotfiles/'
alias __bashrc='(vim ~/.dotfiles/.bashrc) && . ~/.bashrc'
alias __alias='(vim ~/.dotfiles/.bash_aliases) && . ~/.bashrc'
alias __calias='(vim ~/.dotfiles/.bash_custom) && . ~/.bashrc'
alias __scrpits='cd ~/.dotfiles/scripts/'
alias __tmux='(vim ~/.dotfiles/.tmux.conf && tmux source-file ~/.tmux.conf)'

#directories
alias ..='cd ..'
alias l='ls -A'
alias d='cd ~/Downloads'
alias cd='source ~/.dotfiles/scripts/cd.sh'
alias _mkdir='source ~/.dotfiles/scripts/_mkdir.sh'

#Python
alias __virtualenv_py3='cd ~/virtualenvs && python3 -m venv '
alias __virtualenv_py2='cd ~/virtualenvs && virtualenv --python=python2.7 '

#Docker
alias __check_docker='nvidia-docker run --rm -it nvidia/cuda:10.0-cudnn7-runtime nvidia-smi'

#Jupyter
alias __jupyter_start='nohup jupyter lab --ip=0.0.0.0  --port=8110 --no-browser --allow-root &'
alias __jupyter_list='jupyter notebook list'

#clipboard
alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'
