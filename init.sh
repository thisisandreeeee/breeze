#!/bin/bash

sudo apt-get update

sudo apt-get install git
git config --global user.name "andre"
git config --global user.email "tanandre93@gmail.com"

# check vim version, and update vimrc, then run :PluginInstall
sudo apt-get install vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

# download tmux and update conf file, then run prefix + I
sudo apt-get install tmux
cp .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins all

# download zsh, and oh my zsh. then, update zshrc.
sudo apt-get install zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ~/.zshrc
