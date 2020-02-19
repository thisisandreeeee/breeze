#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ${ROOT_DIR}/dotfiles/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins all
