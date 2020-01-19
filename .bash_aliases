#Export env var
if [ -z "$DOT" ]
then
    export DOT=~/.dotfiles
else
    echo "warn: dotfile dir is already set to $DOT"
fi

#general
alias l='ls -A'
alias c='caja . &'
alias caja='caja . &'
alias htop='htop -d 3'
alias code='code . -n'
alias gpustat='gpustat -i 0.5'
alias __ip='curl ifconfig.me'
alias _clear='clear && clear && clear'
alias __starce='strace -e trace=open,stat,read,write '
alias __restart_net_menager='sudo service network-manager restart'
alias __remove_white_space_from_images='find ./ \( -iname "*.png" -o -iname "*.jpg" \) -exec convert {} -trim ./{} \;'
alias diki='$DOT/scripts/diki.sh'

# dotfiles
alias dot='cd $DOT'
alias __bashrc='(vim $DOT/.bashrc) && . ~/.bashrc'
alias __alias='(vim $DOT/.bash_aliases) && . ~/.bashrc'
alias __calias='(vim $DOT/.bash_custom) && . ~/.bashrc'
alias __scrpits='cd $DOT/scripts/'
alias __tmux='(vim $DOT/.tmux.conf && tmux source-file ~/.tmux.conf)'
alias __bind_ports='$DOT/scripts/bind_ports.sh '

#directories
alias ..='cd ..'
alias h='cd ~/'
alias t='cd /tmp/'
alias p='cd ~/projects/'
alias v='cd ~/Videos/'
alias d='cd ~/Downloads'
alias cd='source $DOT/scripts/cd.sh'
alias _mkdir='source $DOT/scripts/_mkdir.sh'

#Python
alias __virtualenv_py3='cd ~/virtualenvs && python3 -m venv '
alias __virtualenv_py2='cd ~/virtualenvs && virtualenv --python=python2.7 '

#Docker
alias __change_file_permissions='find . -type f -print0 | xargs -0 sudo chmod +666 && find . -type d -print0 | xargs -0 sudo chmod +775 && sudo chown -R $USER:$USER .'
alias __docker_var='echo CONTAINER_NAME: $CONTAINER_NAME; echo DOCKER_IMG: $DOCKER_IMG'
alias __docker_check_nvidia='nvidia-docker run --rm -it nvidia/cuda:10.0-cudnn7-runtime nvidia-smi'
alias __docker_run='nvidia-docker run -d -it \
                    --name $CONTAINER_NAME \
                    -p $DOCKER_PORTS:$DOCKER_PORTS \
                    --shm-size 24G \
                    -v /mnt:/mnt \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v $PROJECTS/data:/data \
                    -v $PROJECTS/models:/models \
                    -v $PROJECTS/results:/results \
                    -v $PROJECTS/$PROJECT:/$PROJECT \
                    -v ~/.bash_history:/root/.bash_history \
                    -v /media/albert/MOST:/MOST \
                    -e DISPLAY=unix$DISPLAY \
                    $DOCKER_IMG'
alias __docker_exec='docker exec -it $CONTAINER_NAME /bin/bash'
alias __docker_kill='docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME'
alias __docker_build='docker build -t $DOCKER_IMG -f Dockerfile .'
alias __docker_rebuild='docker image rm $DOCKER_IMG && __docker_build && __docker_run && __docker_exec'
alias __docker_reload_daemon='sudo systemctl daemon-reload & sudo systemctl restart docker'

#docker compose
alias __docker_compose_rm='docker-compose down --rmi all'

#Jupyter
alias __jupyter_start='nohup jupyter lab --ip=0.0.0.0  --port=8200 --no-browser --allow-root &'
alias __jupyter_list='jupyter notebook list'

#Mlflow
alias __mlflow='$DOT/scripts/mlflow.sh'
alias __mlflow_kill='kill -9 `pgrep -f mlflow`'

#Tensorboard
alias __tensorboard_daemon='$DOT/scripts/tensorboard_daemon.sh'
alias __tensorboard_port='$DOT/scripts/tensorboard_daemon.sh --logdir=. --samples_per_plugin images=100 --port '

#clipboard
alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'
