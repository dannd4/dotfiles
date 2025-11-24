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

function uv_poetry_install() {
  if ! poetry help export >/dev/null 2>&1; then
    poetry self add poetry-plugin-export >/dev/null
  fi
  uv pip install --no-deps -r <(POETRY_WARNINGS_EXPORT=false poetry export --without-hashes --with dev -f requirements.txt)
  poetry install --only-root
}

# Force Atuin key bindings to take precedence over zsh-vi-mode
# This needs to be after all plugin initializations
function zvm_after_init() {
  # Bind Ctrl+R to Atuin search in all modes
  bindkey -M emacs '^r' atuin-search
  bindkey -M viins '^r' atuin-search-viins
  bindkey -M vicmd '^r' atuin-search
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
