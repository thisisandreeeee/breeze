#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt-get update
	sudo apt-get install git vim
	sudo apt-get install zsh
	sudo apt-get install tmux
elif [[ "$OSTYPE" == "darwin*" ]]; then
	brew update
	brew install git 
	brew install macvim --with-cscope --with-lua
	brew linkapps macvim
	brew install tmux
	# ...
else
	echo "Invalid OS"
fi

git config --global user.name "andre"
git config --global user.email "tanandre93@gmail.com"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

cp .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins all

chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ~/.zshrc
