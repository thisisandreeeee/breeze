# Install pyenv. https://github.com/pyenv/pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Install pyenv-virtualenv. https://github.com/pyenv/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# Install miniconda. https://docs.conda.io/en/latest/miniconda.html
echo 'export GLOBAL_MINICONDA_VERSION=miniconda3-4.3.30' >> ~/.zshrc
exec "$SHELL"
pyenv install $GLOBAL_MINICONDA_VERSION
pyenv global $GLOBAL_MINICONDA_VERSION

# Create global conda env.
conda create -n data-science pandas numpy scipy scikit-learn jupyter matplotlib seaborn

# Usage instructions.
# Activate environments: `pyenv activate data-science`
# List environments: `conda info --envs`
