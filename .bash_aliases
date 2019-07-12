#general
alias caja='caja . &'
alias htop='htop -d 3'
alias code='code . -n'
alias gpustat='gpustat -i 0.5'
alias _clear='clear && clear && clear'
alias __starce='strace -e trace=open,stat,read,write '
alias __restart_net_menager='sudo service network-manager restart'
alias __remove_white_space_from_images='find ./ -name "*.png" -exec convert {} -trim ./{} \;'

# dotfiles
alias dot='cd ~/.dotfiles/'
alias __bashrc='(vim ~/.dotfiles/.bashrc) && . ~/.bashrc'
alias __alias='(vim ~/.dotfiles/.bash_aliases) && . ~/.bashrc'
alias __calias='(vim ~/.dotfiles/.bash_custom) && . ~/.bashrc'
alias __scrpits='cd ~/.dotfiles/scripts/'
alias __tmux='(vim ~/.dotfiles/.tmux.conf && tmux source-file ~/.tmux.conf)'
alias __bind_ports='~/.dotfiles/scripts/bind_ports.sh '

#directories
alias ..='cd ..'
alias l='ls -A'
alias h='cd ~/'
alias t='cd /tmp/'
alias v='cd ~/Videos/'
alias d='cd ~/Downloads'
alias cd='source ~/.dotfiles/scripts/cd.sh'
alias _mkdir='source ~/.dotfiles/scripts/_mkdir.sh'

#Python
alias __virtualenv_py3='cd ~/virtualenvs && python3 -m venv '
alias __virtualenv_py2='cd ~/virtualenvs && virtualenv --python=python2.7 '

#Docker
alias __change_file_permissions='find . -type f -print0 | xargs -0 sudo chmod +666 && find . -type d -print0 | xargs -0 sudo chmod +775 && sudo chown -R $USER:$USER .'
alias __docker_var='echo CONTAINER_NAME: $CONTAINER_NAME; echo DOCKER_IMG: $DOCKER_IMG'
alias __docker_check_nvidia='nvidia-docker run --rm -it nvidia/cuda:10.0-cudnn7-runtime nvidia-smi'
alias __docker_run='nvidia-docker run -d -it \
                    --name $CONTAINER_NAME \
                    -p 8100-8110:8100-8110 \
                    --shm-size 8G \
                    -v /mnt:/mnt \
                    -v $PROJECTS/data:/data \
                    -v $PROJECTS/imcom:/imcom \
                    -v $PROJECTS/models:/models \
                    -v $PROJECTS/results:/results \
                    -v ~/.bash_history:/root/.bash_history \
                    $DOCKER_IMG'
alias __docker_exec='docker exec -it $CONTAINER_NAME /bin/bash'
alias __docker_kill='docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME'
alias __docker_build='docker build -t $DOCKER_IMG -f Dockerfile .'
alias __docker_rebuild='docker image rm $DOCKER_IMG && __docker_build && __docker_run && __docker_exec'

#Jupyter
alias __jupyter_start='nohup jupyter lab --ip=0.0.0.0  --port=8110 --no-browser --allow-root &'
alias __jupyter_list='jupyter notebook list'

#Mlflow
alias __mlflow='nohup mlflow server --host 0.0.0.0 --port 8101 --gunicorn-opts "--timeout=120" &'
alias __mlflow_kill='kill -9 `pgrep -f mlflow`'

#Tensorboard
alias tensorboard_daemon='~/.dotfiles/scripts/tensorboard_daemon.sh'
alias tensorboard_port='~/.dotfiles/scripts/tensorboard_daemon.sh --logdir=. --samples_per_plugin images=100 --port '

#clipboard
alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'
