#!/bin/bash

ROOT_DIR="$(realpath $(dirname pwd))"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Check if all three lines are present in .zshrc
if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc || \
   ! grep -q 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.zshrc || \
   ! grep -q 'if command -v pyenv 1>/dev/null 2>&1; then' ~/.zshrc; then

  # Append all three lines as a block if any line is missing
  {
    echo 'export PYENV_ROOT="$HOME/.pyenv"'
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"'
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi'
  } >> ~/.zshrc
else
  exit 1
fi

source ~/.zshrc

export $(cat ${ROOT_DIR}/versions.txt | grep CONDA_VERSION | xargs)
echo "Installing ${CONDA_VERSION} using pyenv"

pyenv install $CONDA_VERSION
pyenv global $CONDA_VERSION

conda create --name default python -y
pyenv global ${CONDA_VERSION}/envs/default
