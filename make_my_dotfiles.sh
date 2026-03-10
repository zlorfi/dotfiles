#!/bin/bash

# some variables
_shell="/opt/homebrew/bin/zsh"
# _shell="/opt/homebrew/bin/fish"
_homebrew=$(which brew)
_to_install="azure-cli btop difftastic gh git git-flow gs imagemagick iperf3 k9s kubectl lazygit mactop nvim nvm oh-my-posh openssl rbenv ripgrep ruby-build stern tectonic thonny tmux tpm tree-sitter typst uv zsh"

# Generate symlinks for files
for i in gitconfig gitignore gitmessage tmux.conf zshrc zsh_secrets; do
  if [ ! -f $HOME/.$i ]; then
    ln -s $HOME/dotfiles/$i $HOME/.$i
  else
    echo "Symlink $HOME/.$i already exists"
  fi
done

if [ ! -d $HOME/.config ]; then
  mkdir -p $HOME/.config
  ln -s $HOME/dotfiles/config $HOME/.config
else
  echo "Symlink $HOME/.config already exists"
fi

# install Homebrew
if [ ! -f $_homebrew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed"
fi

# install some stuff
if [ -f $_homebrew ]; then
  $_homebrew install $_to_install
else
  echo "Homebrew not installed"
fi

# check if $SHELL is already set to zsh
if [ "$(echo $SHELL)" != "$_shell" ]; then
  if [ -f $_shell ]; then
    echo
    echo "Changing shell to zsh, need sudo password"
    echo
    echo $_shell | sudo tee -a /etc/shells
    chsh -s $_shell
  else
    echo
    echo "Install zsh via Homebrew first!"
    echo
  fi
else
  echo "zsh shell already set as default"
fi
