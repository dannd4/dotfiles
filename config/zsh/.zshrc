export DOTFILES=~/.dotfiles
export TERM="xterm-256color"
export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH=$HOME/.local/bin:$PATH

for helper in "$DOTFILES"/config/zsh/source/*.zsh; do
  source "$helper"
done

# Machine-specific config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi

PLUGINS_DIR="$DOTFILES/vendor/zsh-custom/plugins"
for plugin in $PLUGINS_DIR/**/*.plugin.zsh; do
  source "$plugin"
done

source <(fzf --zsh)

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# Machine-specific post-compinit config
[[ -f ~/.zshrc.post ]] && source ~/.zshrc.post
