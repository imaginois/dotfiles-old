#!/usr/bin/env bash

# Install Mac Specific apps but not with homebrew
# Install Docker
if [ -f /Applications/Docker.dmg ]; then
	echo "\n ### Docker already install at /Applications/Docker.dmg"
else
	echo "\n ### Installing Docker"
	wget https://download.docker.com/mac/stable/Docker.dmg
	mv Docker.dmg /Applications/
fi

#install zsh and zsh-completions
brew install zsh zsh-completions
