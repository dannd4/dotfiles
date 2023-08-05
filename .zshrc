export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="$HOME/.go"
export VOLTA_HOME="$HOME/.volta"
export PYENV_ROOT="$HOME/.pyenv"

export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$VOLTA_HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$HOME/.fig/bin:$PATH

export VOLTA_FEATURE_PNPM=1
export FZF_DEFAULT_COMMAND='fd -H -E .git --type f '

autoload -Uz compinit
compinit

source ~/.aliases
source <(kubectl completion zsh)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(pyenv init -)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
