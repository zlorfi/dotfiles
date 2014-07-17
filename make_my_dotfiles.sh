#!/bin/bash

# some variables
_zsh_file="/usr/local/bin/zsh"
_homebrew=`which brew`

# Generate symlinks for files
for i in gemrc gvimrc irbrc jumprc NERDTreeBookmarks screenrc vimrc zshrc tmux.conf
do
  if [ ! -f $HOME/.$i ]
  then
    ln -s $HOME/dotfiles/$i $HOME/.$i
  else
    echo "Symlink $HOME/.$i already exists"
  fi
done

for j in vim zsh
do
  if [ ! -d $HOME/.$j ]
  then
    ln -s $HOME/dotfiles/$j $HOME/.$j
  else
    echo "Symlink $HOME/.$j already exists"
  fi
done

if [ ! -d $HOME/.vim/tmp ]
then
  mkdir $HOME/.vim/tmp
else
  echo "tmp folder $HOME/.vim/tmp already exists"
fi

# install Homebrew
if [ ! -f $_homebrew ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
  echo "Homebrew already installed"
fi

if [ -f $_homebrew ]
then
  $_homebrew install erlang imagemagick mongodb postgresql rbenv redis ruby-build tmux unrar yasm youtube-dl zsh
else
  echo "Homebrew not installed"
fi

# check if $SHELL is already set to ZSH
if [ "$(echo $SHELL)" != "$_zsh_file" ]
then
  echo
  echo "Changing shell to ZSH, need sudo password"
  echo
  echo $_zsh_file | sudo tee -a /etc/shells;
  chsh -s $_zsh_file;
else
  echo "ZSH already installed"
fi
