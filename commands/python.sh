pyenv install 3
pyenv global $(pyenv versions --bare | grep '^3' | tail -n1)

pip install --upgrade pip
pip install setuptools
pip install anthropic
pip install python-dotenv