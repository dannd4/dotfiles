# Install brew
if [[ ! "$(type brew)" ]]; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

BREW_PACKAGES=(
  # CLI Essentials
  "git"
  "neovim"
  "tmux"

  # CLI Utilities
  "ast-grep"
  "bat"
  "coreutils"
  "eza"
  "git-delta"
  "jq"
  "fd"
  "fzf"
  "ripgrep"
  "sd"
  "television"
  "tldr"
  "zoxide"
  "wget"

  # CLI Development
  "docker"
  "docker-compose"
  "gh"
  "lazygit"
  "lazydocker"
  "libpq"
  "sqlite"

  # Development Langs, Package Managers
  "fnm"
  "go"

  # Other
  "imagemagick"
  "starship"
)

BREW_CASKS=(
  "ghostty"
  "google-chrome"
  "obs"
  "karabiner-elements"
  "notion"
  "notunes"
  "postman"
  "raycast"
  "spotify"
  "slack"
  "visual-studio-code"
)

brew install "${BREW_PACKAGES[@]}"

brew install --cask "${BREW_CASKS[@]}"
