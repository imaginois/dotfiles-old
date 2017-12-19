#!/usr/bin/env bash

# Install Mac Specific apps but not with homebrew
# Install Docker
echo "\n ### Installing Docker"
wget https://download.docker.com/mac/stable/Docker.dmg
mv Docker.dmg /Applications/

#install zsh and zsh-completions
brew install zsh zsh-completions
