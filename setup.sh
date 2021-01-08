#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Setup Finder Commands
# Show Library Folder in Finder
chflags nohidden ~/Library

# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Check for Homebrew, and then install it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew already installed!"
fi

# Install XCode Command Line Tools
echo 'Checking to see if XCode Command Line Tools are installed...'
brew config

# Updating Homebrew.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading Homebrew..."
brew upgrade

# Install iTerm2
echo "Installing iTerm2..."
brew install --cask iterm2

# Update the Terminal
# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Need to logout now to start the new SHELL..."
logout

# Install Git
echo "Installing Git..."
brew install git

# Install Powerline fonts
echo "Installing Powerline fonts..."
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh

# Install ruby
if test ! $(which ruby); then
    echo "Installing Ruby..."
    brew install ruby
    echo "Adding the brew ruby path to shell config..."
    echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >>~/.bash_profile
else
    echo "Ruby already installed!"
fi

# Install phyton
brew install pyenv
pyenv install 3.7.3
pyenv global 3.7.3

brew install poetry

# Install go
if test ! $(which phyton); then
    echo "Installing Go..."
    brew install go
else
    echo "Go already installed!"
fi

# Install node
if test ! $(which node); then
    echo "Installing Node..."
    brew install node
else
    echo "Node already installed!"
fi

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install speedtest_cli

# Core casks
brew install azure-cli
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" 1clipboard

# Development tool casks
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" postman
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" docker-toolbox
brew install --cask lens

brew install --cask gpg-suite
brew install thefuck

# Misc casks
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" zoom
brew install --cask --appdir="/Applications" 1password
brew install --cask 1password-cli
brew install --cask --appdir="/Applications" caffeine
brew install --cask --appdir="/Applications" spotify
#brew install --cask --appdir="/Applications" microsoft-office
#brew install --cask --appdir="/Applications" microsoft-teams
brew install --cask --appdir="/Applications" telegram
brew install --cask --appdir="/Applications" the-unarchiver
brew install --cask --appdir="/Applications" snagit
brew install --cask --appdir="/Applications" macdown

# Setup Code repo
mkdir ~/Documents/WORK
mkdir ~/Documents/WORK/CODE

# Work specific
brew install terraform@0.12
brew install prometheus
brew install helm@3
brew install helm@2
helm plugin install https://github.com/helm/helm-2to3.git
brew install kubectx

# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew cleanup
echo "You're done!"
