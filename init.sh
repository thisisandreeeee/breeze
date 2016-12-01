#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt-get update
	sudo apt-get install git vim zsh tmux
elif [[ "$OSTYPE" == "darwin*" ]]; then
	brew update
	brew install git vim tmux zsh zsh-completions reattach-to-user-namespace 
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

cd ~
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh
	# ..
elif [[ "$OSTYPE" == "darwin*" ]]; then
	wget https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh
	bash Miniconda3-latest-MacOSX-x86_64.sh
else
	echo "Invalid OS"
fi
conda update conda
conda create --name py2 python=2 ipython bs4 pandas numpy scikit-learn matplotlib statsmodels xgboost flask seaborn 
conda create --name py3 python=3 ipython bs4 pandas numpy scikit-learn matplotlib statsmodels xgboost flask seaborn 

# https://github.com/lysyi3m/osx-terminal-themes.git
