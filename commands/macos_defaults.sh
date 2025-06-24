# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
	sudo xcode-select -switch /usr/bin
fi

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# ============================== General UI/UX ==============================

# Disable Spotlight indexing
sudo mdutil -a -i off

# Disable Spotlight menu item
sudo defaults write com.apple.Spotlight MenuItemHidden -bool true

# Stop the Spotlight service
sudo launchctl bootout system/com.apple.metadata.mds

# ============================== Dock ==============================

# Put the Dock on the left of the screen
defaults write com.apple.dock "orientation" -string "left"

# Set Dock icon size of 16 pixels.
defaults write com.apple.dock "tilesize" -int "16"

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"

# Remove the Dock autohide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"

# Remove the autohide delay, the Dock appears instantly
defaults write com.apple.dock "autohide-delay" -float "0"

# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# ============================== Finder ==============================

# Set ~ as the default location for new Finder windows
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Show all file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Set sidebar icon size to small
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"

# Search the current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Disable display warning when changing file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Disable save into iCloud
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ============================== Desktop ==============================

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Hide hard disks
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"

# ============================== Trackpad ==============================

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Click weight medium
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"

# Enable dragging with three finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

# ============================== Keyboard ==============================

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null

# ============================== Safari ==============================

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable Safari’s debug menu
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
sudo defaults write com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
sudo defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable AutoFill
sudo defaults write com.apple.Safari AutoFillFromAddressBook -bool false
sudo defaults write com.apple.Safari AutoFillPasswords -bool false
sudo defaults write com.apple.Safari AutoFillCreditCardData -bool false
sudo defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" \
	"Finder" \
	"Safari" \
	"SystemUIServer"; do
	killall "${app}" &>/dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
