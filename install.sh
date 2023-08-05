#!/bin/sh

# Install xcode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Brew Formulae
brew install git
brew install neovim
brew install tmux
brew install jq
brew install ripgrep
brew install fzf
brew install ack
brew install fd
brew install ag
brew install thefuck
brew install exa
brew install tree
brew install gnu-sed
brew install imagemagick
brew install chafa
brew install ifstat
brew install lazygit
brew install starship
brew install sketchybar
brew install sf-symbols
brew install volta
brew install go
brew install python
brew install sqlite
brew install kubectx
brew install kubernetes-cli
brew install terraform

# Brew Casks
brew install --cask dropbox
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
brew install --cask telegram
brew install --cask discord
brew install --cask kitty
brew install --cask visual-studio-code
brew install --cask evkey
brew install --cask notion
brew install --cask obsidian
brew install --cask postman
brew install --cask obs
brew install --cask raycast
brew install --cask spotify
brew install --cask tableplus
brew install --cask vlc
brew install --cask karabiner-elements
brew install --cask docker
brew install --cask raindropio
brew install --cask notunes
brew install --cask figma
brew install --cask fig
brew install --cask hiddenbar
brew install --cask lens

# Install node and yarn using volta
volta install node
volta install yarn
