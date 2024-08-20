export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/vendor/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/vendor/zsh-custom

export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export FZF_DEFAULT_COMMAND='fd -H -E .git --type f '

export GOPATH="$HOME/.go"
export VOLTA_HOME="$HOME/.volta"
export PYENV_ROOT="$HOME/.pyenv"
export VOLTA_FEATURE_PNPM=1

export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$VOLTA_HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$PYENV_ROOT/bin:$PATH

plugins=(
  kubectl
  git-open
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

eval "$(pyenv init -)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
