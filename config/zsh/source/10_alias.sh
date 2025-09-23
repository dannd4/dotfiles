# General
alias vi=nvim
alias cls="clear"
alias path='echo -e ${PATH//:/\\n}'
alias reload="exec ${SHELL} -l"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias ws="cd ~/workspace"
alias dotfiles='cd ~/.dotfiles'
alias nvimconf="cd ~/.config/nvim"
alias weztermconf="cd ~/.config/wezterm"

# eza is a replacement for ls: https://github.com/eza-community/eza
if type eza &>/dev/null; then
  alias ls="eza"
  alias ll="eza --long --group --git"
  alias lt="eza --long --group --tree"
  alias grep="grep --color=auto"
fi

# Tmux
alias ta="tmux attach -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"

# Others
alias lzg="lazygit"
alias lzd="lazydocker"
alias cc="claude --dangerously-skip-permissions"
