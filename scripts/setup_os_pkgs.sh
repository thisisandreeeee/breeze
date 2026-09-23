#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Installing OS packages for $OSTYPE"
  sudo apt-get update
  install_cmd="sudo apt-get install -y"
  pkgs_file="${ROOT_DIR}/dependencies/apt.txt"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing OS packages for $OSTYPE"
  brew update
  install_cmd="brew install"
  pkgs_file="${ROOT_DIR}/dependencies/brew.txt"
else
  echo "Unsupported OS $OSTYPE"
fi

install_string=""
while read -r line || [[ -n $line ]]; do
  install_string+="$line "
done < "$pkgs_file"

echo "Installing $install_string"
$install_cmd $install_string

# Debian/Ubuntu install these binaries under collision-free names.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  mkdir -p "$HOME/.local/bin"
  [[ -e "$HOME/.local/bin/fd" ]] || ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
  [[ -e "$HOME/.local/bin/bat" ]] || ln -s "$(command -v batcat)" "$HOME/.local/bin/bat"
fi
