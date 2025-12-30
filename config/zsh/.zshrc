# Performance optimizations
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi

export DOTFILES=~/.dotfiles
export ZSH=$DOTFILES/vendor/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/vendor/zsh-custom

export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export GOPATH="$HOME/.go"
export PATH=$GOPATH/bin:$PATH

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$PNPM_HOME:$PATH

plugins=(
  kubectl
  git-open
  zsh-vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

for file in $DOTFILES/config/zsh/source/*; do
  source "$file"
done

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
