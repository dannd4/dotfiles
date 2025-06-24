echo "Installing dotfiles..."

export DOTFILES=~/.dotfiles

if [[ ! -d $DOTFILES ]]; then
  git clone --recursive "git@github.com:dannd4/dotfiles.git" $DOTFILES
  cd $DOTFILES || exit 1
fi

git submodule init
git submodule update
