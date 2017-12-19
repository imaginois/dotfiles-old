#!/usr/bin/env bash

if ! command_exists zsh; then
  echo "### zsh not found. Please install and then re-run installation scripts"
  exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
  echo "### Configuring zsh as default shell"
  chsh -s $(which zsh)
fi

if [ -d ~/.oh-my-zsh ]; then
  echo "### Oh-My-Zsh seems to be already isntalled. Skipping..."
else
  echo "### Installing Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &
fi

if [ -L ~/.zshrc ] || [ -f ~/.zshrc ]; then
  echo "### ~/.zshrc already exists. Making backup to ~/.zshrc.backup ..."
  mv ~/.zshrc ~/.zshrc.backup
fi

if [ -L ~/.alias ] || [ -f ~/.zshrc ]; then
  echo "### ~/.alias already exists. Removing..."
  echo "#### Local aliases should be in ~/.zsh_alias and ~/.bash_alias respectively"
  rm -f ~/.alias
fi

echo "### Symlink .zshrc file from repo"
ln -s $DOT_HOME/shell/zshrc.symlink ~/.zshrc

# Use the .alias file to set all the needed aliases.
# if .zsh_alias or .bash_alias exists they wiil be sourced
# after the .alias file to override possible conflicts
echo "### Symlink .alias file from repo"
ln -s $DOT_HOME/shell/alias.symlink ~/.alias


# if ! command_exists zplug; then
#   echo "### installing zplug, a plugin manager for zsh - http://zplug.sh"
#   git clone https://github.com/zplug/zplug ~/.zplug
# fi
