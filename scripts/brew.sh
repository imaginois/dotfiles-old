#!/usr/bin/env bash

#install zsh and zsh-completions
brew install zsh zsh-completions

# Install Mac Specific apps but not with homebrew
# Install Docker
if [ -f /Applications/Docker.dmg ]; then
    echo -e "\n\n### Docker already install at /Applications/Docker.dmg"
else
    echo -e "\n\n### Installing Docker"
    wget https://download.docker.com/mac/stable/Docker.dmg
    mv Docker.dmg /Applications/
fi