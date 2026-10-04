#!/bin/bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v node >/dev/null 2>&1; then
    echo "need to install node first" >&2
    exit 1
fi

node -v
echo "node is installed, moving nvim configurations"
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
cp -R "${ROOT_DIR}/dotfiles/nvim" "$HOME/.config/nvim"
