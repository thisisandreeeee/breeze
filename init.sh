#!/bin/bash

sudo apt-get update

sudo apt-get install git
git config --global user.name "andre"
git config --global user.email "tanandre93@gmail.com"

# check vim version, and update vimrc, then run :PluginInstall
sudo apt-get install vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp .vimrc ~/.vimrc
source ~/.vimrc
vim +PluginInstall +qall

# download tmux and update conf file, then run prefix + I
git clone https://github.com/tmux/tmux.git ~/tmux
cd tmux
sh autogen.sh
./configure && make
cd ..
sudo rm -rf tmux
cp .tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/update_plugins all

# download zsh, and oh my zsh. then, update zshrc.
sudo apt-get install zsh
chsh -s $(which zsh)
cp .zshrc ~/.zshrc
