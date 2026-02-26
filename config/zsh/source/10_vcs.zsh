# Git shortcuts
alias g='git'
alias gcl='git clone'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
alias glo='git log --decorate --oneline --graph'
function ga() { git add "${@:-.}"; } # Add all files by default
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
function gbd() { git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | tr '\n' ' ' | xargs -n 1 git branch -D; } # Delete all branches except current
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
