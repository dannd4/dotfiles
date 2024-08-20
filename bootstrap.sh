echo 'Dotfiles Initializing...'

export DOTFILES=~/.dotfiles

if [[ ! -d $DOTFILES ]]; then
  git clone --recursive "git@github.com:dannd4/dotfiles.git" $DOTFILES
  cd $DOTFILES || exit 1
fi

function do_stuff() {
  local files=($DOTFILES/$1/*)

  # No files? abort.
  if ((${#files[@]} == 0)); then return; fi

  for file in "${files[@]}"; do
    "$1_do" "$file"
  done
}

function init_do() {
  source "$1"
}

function link_do() {
  ln -sf "${1#"$HOME"/}" ~/
}

# Tweak file globbing.
shopt -s dotglob
shopt -s nullglob

do_stuff "init"
do_stuff "link"

git submodule init
git submodule update

echo "All done"
