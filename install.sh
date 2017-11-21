#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Get casks
brew tap caskroom/cask

# Install tmux
brew install tmux

# Install Spectacle Window Manager
brew cask install spectacle
