#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

if type node > /dev/null 2>&1 && which node > /dev/null 2>&1; then
    node -v
    npm -v
    echo "node is installed, moving nvim configurations"
    cp -r ${ROOT_DIR}/dotfiles/nvim ~/.config/nvim
else
    echo "need to install node first"
    echo "On Linux: sudo apt-get install nodejs npm"
    echo "On macOS: brew install node"
    exit 1
fi
