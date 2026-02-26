alias vi=nvim
alias cls="clear"
alias reload="exec ${SHELL} -l"
alias path='echo -e ${PATH//:/\\n}'

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

# Git
alias g='git'
alias gcl='git clone'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
alias glo='git log --decorate --oneline --graph'
function ga() { git add "${@:-.}"; }
alias gcm='git commit'
alias gcma='git commit --amend --no-edit'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsf='git push --force'
alias gpsu="git push -u origin HEAD"
alias grb='git rebase'
alias grbi="git rebase -i"
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstc='git stash clear'
alias gb='git branch'
function gbdo() { git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | tr '\n' ' ' | xargs -n 1 git branch -D; } # Delete all branches except current
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gr='git reset'
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gm='git merge'
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gcp='git cherry-pick'
alias grv='git revert'

# Tmux
alias ta="tmux attach -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
if type sesh &>/dev/null; then
  if type tv &>/dev/null; then
    alias tl="tv sesh"
  elif type fzf &>/dev/null; then
    alias tl="sesh connect $(sesh list | fzf)"
  fi
fi

if type eza &>/dev/null; then
  alias ls="eza --icons"
  alias la="eza --all --icons"
  alias ll="eza --long --group --git"
  alias lt="eza --long --group --tree --git-ignore"
fi

# if type rg &>/dev/null; then
#   alias grep="rg --color=auto"
# fi

if type zellij &>/dev/null; then
  alias ze="zellij"
  alias zs="zellij -s"
  alias za="zellij a"
  alias zl="zellij ls"
fi

if type lazygit &>/dev/null; then
  alias lzg="lazygit"
fi

if type lazydocker &>/dev/null; then
  alias lzd="lazydocker"
fi
