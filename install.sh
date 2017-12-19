#!/usr/bin/env bash

export DOT_HOME=$PWD

command_exists() {
    type "$1" > /dev/null 2>&1
}

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
  echo -e "\n\n### Running on OSX"
  source install/brew.sh
  source install/osx.sh
fi

if [ "$(uname)" == "Linux" ]; then
  echo -e "\n\n### Running on Linux"
  source install/linux.sh
  source install/apt.sh
fi

if [ -f install/zsh.sh ]; then
  echo -e "\n\n### Setup Zsh Shell..."
  source install/zsh.sh
fi
