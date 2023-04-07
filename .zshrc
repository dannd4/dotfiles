export EDITOR='nvim'
export LC_CTYPE=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.volta/bin:$PATH
export PATH=$HOME/.go/bin:$PATH

VOLTA_FEATURE_PNPM=1

source ~/.aliases
source ~/.functions
source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh

autoload -Uz compinit
compinit
#Completion for kitty
kitty + complete setup zsh | source /dev/stdin

eval $(thefuck --alias f)
eval "$(starship init zsh)"

