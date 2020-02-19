#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

sudo chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
