# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_" || return
}

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function swe() {
  export AWS_PROFILE=$1
  aws eks update-kubeconfig --name "$(aws eks list-clusters | jq -r ".clusters[0]")"

  err_code=$?

  if [ $err_code -ne 0 ]; then
    echo "Try login with your profile $1"
    aws sso login --profile "$1"
    err_code=$?
    if [ "$err_code" -eq 0 ]; then
      echo "Login success"
      swe "$1"
      return 1
    else
      echo "Login failed"
      return 1
    fi
  fi
}

# Force Atuin key bindings to take precedence over zsh-vi-mode
# This needs to be after all plugin initializations
function zvm_after_init() {
  # Bind Ctrl+R to Atuin search in all modes
  bindkey -M emacs '^r' atuin-search
  bindkey -M viins '^r' atuin-search-viins
  bindkey -M vicmd '^r' atuin-search
}
