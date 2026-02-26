# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_" || return
}

function wtf() {
  tldr "$@" || run-help "$@" || man "$@" || "$@" --help || curl "cheat.sh/$@"
}

function uv_poetry_install() {
  if ! poetry help export >/dev/null 2>&1; then
    poetry self add poetry-plugin-export >/dev/null
  fi
  uv pip install --no-deps -r <(POETRY_WARNINGS_EXPORT=false poetry export --without-hashes --with dev -f requirements.txt)
  poetry install --only-root
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
function zvm_after_init() {
  # Bind Ctrl+R to Atuin search in all modes
  bindkey -M emacs '^r' atuin-search
  bindkey -M viins '^r' atuin-search-viins
  bindkey -M vicmd '^r' atuin-search
}


