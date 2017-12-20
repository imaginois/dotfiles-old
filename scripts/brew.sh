#!/usr/bin/env bash

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# teap Homebrew-Cask
brew tap caskroom/cask

if [ ! -e /Applications/iTerm.app ]; then
    brew cask install iterm2
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    # flags should pass through the the `brew list check`
    'macvim --with-override-system-vim'
    ack
    dnsmasq
    fzf
    git
    'grep --with-default-names'
    highlight
    hub
    markdown
    neovim/neovim/neovim
    node
    nginx
    reattach-to-user-namespace
    the_silver_searcher
    tmux
    tree
    wget
    z
    zsh
    zsh-completions
    ripgrep
    git-standup
    entr
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done


# Install Mac Specific apps but not with homebrew
# Install Docker
if [ -f /Applications/Docker.dmg ]; then
    echo -e "\n\n### Docker already install at /Applications/Docker.dmg"
else
    echo -e "\n\n### Installing Docker"
    wget https://download.docker.com/mac/stable/Docker.dmg
    mv Docker.dmg /Applications/
fi