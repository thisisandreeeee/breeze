#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt-get update
	sudo apt-get install git vim zsh tmux
elif [[ "$OSTYPE" == "darwin*" ]]; then
	brew update
	brew install git vim tmux zsh zsh-completions reattach-to-user-namespace rmtrash
else
  echo "Unsupported OS ${OSTYPE}"
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

cp .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins all

chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# not ideal to share zshrc, so we don't copy it
# cp .zshrc ~/.zshrc

cd ~
if [[ "$OSTYPE" == "darwin*" ]]; then
  bash ./python-setup.sh
else
	echo "Unsupported OS ${OSTYPE}"
fi
