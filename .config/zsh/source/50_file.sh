# eza is a replacement for ls: https://github.com/eza-community/eza
if type eza &>/dev/null; then
  alias ls="eza"
  alias ll="eza --long --group --git"
  alias lt="eza --long --group --tree"
  alias grep="grep --color=auto"
fi

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_" || return
}
