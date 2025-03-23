echo 'Dotfiles Initializing...'

export DOTFILES=~/.dotfiles

if [[ ! -d $DOTFILES ]]; then
  git clone --recursive "git@github.com:dannd4/dotfiles.git" $DOTFILES
  cd $DOTFILES || exit 1
fi

git submodule init
git submodule update

# Tweak file globbing.
shopt -s dotglob
shopt -s nullglob

local files=($DOTFILES/init/*)

# No files? abort.
if ((${#files[@]} == 0)); then return; fi

for file in "${files[@]}"; do
  sh "$file"
done

dotbot -c "$DOTFILES/dotbot.conf.yaml"
