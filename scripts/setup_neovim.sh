#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

#!/bin/bash
if type node > /dev/null 2>&1 && which node > /dev/null 2>&1 ;then
    node -v
    echo "node is installed, moving nvim configurations"
    cp -r ${ROOT_DIR}/dotfiles/nvim ~/.config/nvim
else
    echo "need to install node first"
    exit 1
fi


