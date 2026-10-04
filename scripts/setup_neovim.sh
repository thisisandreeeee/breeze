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

# Install tree-sitter-cli if not already present (needed by nvim-treesitter for :TSInstallFromGrammar)
if ! command -v tree-sitter > /dev/null 2>&1; then
    echo "tree-sitter-cli not found, installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install tree-sitter-cli
    else
        # On Linux, tree-sitter-cli is not in apt; install via npm (node is already required above)
        npm install -g tree-sitter-cli
    fi
else
    tree-sitter --version
fi
