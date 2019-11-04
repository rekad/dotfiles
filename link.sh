#!/bin/bash

# run from home directory

echo "linking .bash_profile"
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

echo "linking tmux.conf"
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "linking vimrc"
ln -si ~/dotfiles/.vimrc ~/.config/nvim/.init.vim

# Currently not used

# echo "linking vscode settings"
# ln -si ~/dotfiles/vscode/keybindings.json /Users/patrick/Library/Application\ Support/Code/User/keybindings.json
# ln -si ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# echo "linking .psqlrc"
# ln -s ~/dotfiles/.psqlrc ~/.psqlrc

