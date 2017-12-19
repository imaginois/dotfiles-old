#!/usr/bin/env bash

if ! command_exists zsh; then
  echo "\n### zsh not found. Please install and then re-run installation scripts"
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

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ ]; then
  echo "### Insalling zsh-syntax-highlighting plugin"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
  echo "### zsh-syntax-highlighting already installed. Skipping..."
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions/ ]; then
  echo "### Insalling zsh-completions plugin"
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
else
  echo "### zsh-completions already installed. Skipping..."
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/ ]; then
  echo "### Insalling zsh-autosuggestions plugin"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
  echo "### zsh-zsh-autosuggestions already installed. Skipping..."
fi

if [ -L ~/.zshrc ] || [ -f ~/.zshrc ]; then
  echo "### ~/.zshrc already exists. Making backup to ~/.zshrc.backup ..."
  mv ~/.zshrc ~/.zshrc.backup
fi

if [ -L ~/.alias ] || [ -f ~/.alias ]; then
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
