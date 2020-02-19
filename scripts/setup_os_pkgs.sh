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
while read line || [[ -n $line ]]; do
  install_string+="$line "
done <<< "$(cat $pkgs_file)"

echo "Installing $install_string"
$install_cmd $install_string
