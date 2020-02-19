#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ${ROOT_DIR}/dotfiles/.vimrc ~/.vimrc
vim +PluginInstall +qall
