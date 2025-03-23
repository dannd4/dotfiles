export DOTFILES=~/.dotfiles

for file in $DOTFILES/.config/zsh/source/*; do
  source "$file"
done
