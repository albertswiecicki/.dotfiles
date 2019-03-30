FROM ubuntu:18.04

FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    git \
    tmux \
    vim \
    vim-gtk \
    python3 \
    python3-pip \
    python3.6 \
    python3.6-dev \
    exuberant-ctags \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install pip pep8 flake8 pyflakes isort

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8
# https://github.com/docker-library/python/issues/147
ENV PYTHONIOENCODING UTF-8

RUN cd ~/ && git clone https://github.com/Monotoniczny/.dotfiles.git \
        && echo y | ~/.dotfiles/bind.sh \
        && vim -E -u $HOME/.vimrc +qall

WORKDIR ~/
