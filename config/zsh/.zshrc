export DOTFILES=~/.dotfiles
export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"

export PATH=$HOME/.local/bin:$PATH
export PATH="$PNPM_HOME:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

# Machine-specific config
[[ -f "$XDG_CONFIG_HOME/zsh/local.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/local.zsh"

fpath=($DOTFILES/config/zsh/completions $fpath)

# cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi

PLUGINS_DIR="$DOTFILES/vendor/zsh-plugins"
for plugin in $PLUGINS_DIR/**/*.plugin.zsh; do
  source "$plugin"
done

for config in "$DOTFILES"/config/zsh/source/*.zsh; do
  source "$config"
done

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

[[ -f "/Users/dan/.local/google-cloud-sdk/completion.zsh.inc" ]] && source "/Users/dan/.local/google-cloud-sdk/completion.zsh.inc"

