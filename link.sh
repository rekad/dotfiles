#!/bin/bash

echo "linking .zshrc"
ln -s ~/dotfiles/.zshrc ~/.zshrc

echo "linking .psqlrc"
ln -s ~/dotfiles/.psqlrc ~/.psqlrc

echo "linking tmux.conf"
ln -s ~/dotfiles/tmux.conf ~/tmux.conf

echo "linking vimrc"
ln -si ~/dotfiles/.vimrc ~/.vimrc

echo "linking vscode settings"
ln -si ~/dotfiles/vscode/keybindings.json /Users/patrick/Library/Application\ Support/Code/User/keybindings.json
ln -si ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
