#!/bin/bash

export DOT_HOME=~/.dotfiles

command_exists() {
    type "$1" > /dev/null 2>&1
}

if [ ! -d $DOT_HOME ]; then
  git clone https://github.com/imaginois/dotfiles.git $DOT_HOME
fi

cd $DOT_HOME
chmod +x install.sh
pwd
ls -la


# TODO: Make this into a loop...

if [ -f scripts/backup.sh ]; then
  echo -e "\n\n>>>>>>>>> Running backup.sh"
  source scripts/backup.sh
fi


# only perform macOS-specific install
if [ `uname` == "Darwin" ]; then
  echo -e "\n\n### Running on OSX"
  source scripts/brew.sh
  source scripts/osx.sh
fi

if [ `uname` == "Linux" ]; then
  echo -e "\n\n### Running on Linux"
  source scripts/linux.sh
  source scripts/apt.sh
fi

if [ -f scripts/zsh.sh ]; then
  echo -e "\n\n### Setup Zsh Shell..."
  source scripts/zsh.sh
fi

if [ -f scripts/npm.sh ]; then
  echo -e "\n\n### Setup NPM Global packages"
  source scripts/npm.sh
fi

if [ -f scripts/git.sh ]; then
  echo -e "\n\n### Setup Git Shell..."
  source scripts/git.sh
fi

# docker should be installer before this point
if [ -f scripts/docker.sh ] && command_exists docker; then
  echo -e "\n\n###############################################"
  echo -e "\n\n### Setup Docker Containers and Environments..."
  echo -e "\n\n###############################################\n\n"
  source scripts/docker.sh
fi

# vagrant should be installer before this point
if [ -f scripts/vagrant.sh ] && command_exists vagrant; then
  echo -e "\n\n###############################################"
  echo -e "\n\n### Setup Vagrant VMs and Environments..."
  echo -e "\n\n###############################################\n\n"
  source scripts/vagrant.sh
fi
