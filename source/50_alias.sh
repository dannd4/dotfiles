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

# Tmux
alias ta="tmux attach -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"

# Configs
alias dotfiles='cd .dotfiles && vi'
alias tmuxconf="cd ~/.config/tmux/ && vi"
alias nvimconf="cd ~/.config/nvim && vi"

# SSH
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias addssh='eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_rsa'

# Lazy
alias lzg="lazygit"
alias lzd="lazydocker"
