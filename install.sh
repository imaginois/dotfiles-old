#!/usr/bin/env bash

export DOT_HOME=$PWD

command_exists() {
    type "$1" > /dev/null 2>&1
}

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
  echo -e "\n\n### Running on OSX"
  source scripts/brew.sh
  source scripts/osx.sh
fi

if [ "$(uname)" == "Linux" ]; then
  echo -e "\n\n### Running on Linux"
  source scripts/linux.sh
  source scripts/apt.sh
fi

if [ -f scripts/zsh.sh ]; then
  echo -e "\n\n### Setup Zsh Shell..."
  source scripts/zsh.sh
fi

if [ -f scripts/git.sh ]; then
  echo -e "\n\n### Setup Git Shell..."
  source scripts/git.sh
fi
