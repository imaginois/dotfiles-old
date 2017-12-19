#!/usr/bin/env bash

echo "## Running git.sh script"

# Setup git config stuff

# set global .gitignore
git config --global core.excludesfile '~/.gitignore'


if [ -f ~/.gitignore ]; then
  rm -f ~/.gitignore
fi

ln -s $DOT_HOME/git/gitignore_global.symlink ~/.gitignore

if [ -f ~/.gitconfig ]; then
  rm -f ~/.gitconfig
fi

ln -s $DOT_HOME/git/gitconfig.symlink ~/.gitconfig
