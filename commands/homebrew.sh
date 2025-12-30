# Install brew
if [[ ! "$(type brew)" ]]; then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/$(whoami)/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Brew Formulae
brew install mackup
brew install dotbot
brew install wget
brew install git
brew install gh
brew install git-delta
brew install neovim
brew install tmux
brew install lazygit
brew install cmake
brew install ast-grep
brew install gnu-sed
brew install coreutils
brew install atuin
brew install bat
brew install fx
brew install ripgrep
brew install fzf
brew install ack
brew install fd
brew install ag
brew install eza
brew install tree
brew install starship
brew install go
brew install sqlite
brew install kubectx
brew install kubernetes-cli
brew install derailed/k9s/k9s
brew install helm
brew install libpq
brew install luarocks
brew install telnet
brew install zoxide
brew install imagemagick
brew install node
brew install fnm
brew install yarn
brew install pnpm

# Brew Casks
brew install --cask google-chrome
brew install --cask slack
brew install --cask telegram
brew install --cask discord
brew install --cask wezterm
brew install --cask visual-studio-code
brew install --cask notion
brew install --cask postman
brew install --cask obs
brew install --cask raycast
brew install --cask spotify
brew install --cask karabiner-elements
brew install --cask notunes
brew install --cask jordanbaird-ice
brew install --cask orbstack
