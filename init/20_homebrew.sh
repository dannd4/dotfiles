return 1

# Install brew
if [[ ! "$(type brew)" ]]; then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Brew Formulae
brew install wget
brew install git
brew install neovim
brew install tmux
brew install lazygit
brew install cmake
brew install ast-grep
brew install gnu-sed
brew install coreutils
brew install atuin
brew install bat
brew install jq
brew install ripgrep
brew install fzf
brew install ack
brew install fd
brew install ag
brew install eza
brew install tree
brew install duti
brew install imagemagick
brew install starship
brew install volta
brew install go
brew install python
brew install sqlite
brew install kubectx
brew install kubernetes-cli
brew install derailed/k9s/k9s
brew install helm
brew install terraform
brew install pyenv
brew install libpq
brew install luarocks
brew install telnet
brew install zoxide

# Brew Casks
brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
brew install --cask telegram
brew install --cask discord
brew install --cask wezterm
brew install --cask zed
brew install --cask visual-studio-code
brew install --cask evkey
brew install --cask notion
brew install --cask obsidian
brew install --cask postman
brew install --cask obs
brew install --cask raycast
brew install --cask spotify
brew install --cask karabiner-elements
brew install --cask notunes
brew install --cask figma
brew install --cask jordanbaird-ice
brew install --cask localsend
brew install --cask maczip
