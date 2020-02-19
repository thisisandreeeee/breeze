#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

source ~/.zshrc

export $(cat ${ROOT_DIR}/versions.txt | grep CONDA_VERSION | xargs)
echo "Installing ${CONDA_VERSION} using pyenv"

pyenv install $CONDA_VERSION
pyenv global $CONDA_VERSION

conda env create --name default --file "${ROOT_DIR}/dependencies/environment.yml"
pyenv global ${CONDA_VERSION}/envs/default
