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
alias aliases="vi ~/.aliases"
alias zshrc="vi ~/.zshrc"
alias tmuxconf="vi ~/.config/tmux/tmux.conf"
alias kittyconf="vi ~/.config/kitty/kitty.conf"
alias nvimconf="cd ~/.config/astronvim && vi"

# General
alias vi=nvim
alias path='echo -e ${PATH//:/\\n}'
alias cls="clear"
alias reload="exec ${SHELL} -l"

# SSH
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias addssh='eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_rsa'
