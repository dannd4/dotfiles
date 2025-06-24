export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/vendor/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/vendor/zsh-custom

export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export GOPATH="$HOME/.go"
export VOLTA_HOME="$HOME/.volta"
export PYENV_ROOT="$HOME/.pyenv"
export BUN_INSTALL="$HOME/.bun"

export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$VOLTA_HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$PYENV_ROOT/bin:$PATH
export PATH="$BUN_INSTALL/bin:$PATH"

plugins=(
  kubectl
  git-open
  zsh-vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(pyenv init -)"
