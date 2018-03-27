#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Get casks
brew tap caskroom/cask
brew tap caskroom/versions

# Install tmux
brew install tmux
# Required for copy/paste in tmux
brew install reattach-to-user-namespace

# Install Spectacle Window Manager
brew cask install spectacle

# Install iTerm2 Nighly Build
brew cask install iterm2-nightly

# Install Visual Studio Code
brew cask install visual-studio-code

# Install VSCode Extensions
code --install-extension vscodevim.vim
code --install-extension lukehoban.go
code --install-extension alefragnani.project-manager
code --install-extension bungcip.better-toml
code --install-extension JPTarquino.postgresql



# Install Go
brew install go

# Mac Settings
defaults write com.apple.Finder AppleShowAllFiles true
