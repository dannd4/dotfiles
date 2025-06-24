# General
alias vi=nvim
alias path='echo -e ${PATH//:/\\n}'
alias cls="clear"
alias reload="exec ${SHELL} -l"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias ws="cd ~/workspace"

# eza is a replacement for ls: https://github.com/eza-community/eza
if type eza &>/dev/null; then
  alias ls="eza"
  alias ll="eza --long --group --git"
  alias lt="eza --long --group --tree"
  alias grep="grep --color=auto"
fi

# Configs
alias dotfiles='cd .dotfiles && vi'
alias nvimconf="cd ~/.config/nvim && vi"
alias weztermconf="cd ~/.config/wezterm && vi"

# Lazy
alias lzg="lazygit"
alias lzd="lazydocker"
