#!/bin/bash

# some variables
_fish_shell="/usr/local/bin/fish"
_homebrew=`which brew`
_to_install="the_silver_searcher imagemagick postgresql@9.5 pgcli rbenv redis ruby-build \
             tmux unrar yasm youtube-dl elixir git git-flow vim fish emacs node yarn \
             azure-cli octant openssl fzf go"

# Generate symlinks for files
for i in gemrc gitconfig gitignore gvimrc irbrc mongorc.js NERDTreeBookmarks rspec screenrc tmux.conf vimrc rubocop.yml spacemacs
do
  if [ ! -f $HOME/.$i ]
  then
    ln -s $HOME/dotfiles/$i $HOME/.$i
  else
    echo "Symlink $HOME/.$i already exists"
  fi
done

if [ ! -d $HOME/.vim ]
then
  ln -s $HOME/dotfiles/vim $HOME/.vim
else
  echo "Symlink $HOME/.vim already exists"
fi

if [ ! -d $HOME/.vim/tmp ]
then
  mkdir $HOME/.vim/tmp
else
  echo "tmp folder $HOME/.vim/tmp already exists"
fi

if [ ! -d $HOME/.config]
then
    mkdir -p $HOME/.config
else
    echo "fish folder $HOME/.config already exists"
fi

if [ ! -d $HOME/.config ]
then
    ln -s $HOME/dotfiles/config $HOME/.config
else
    echo "Symlink $HOME/.config already exists"
fi

# install Homebrew
if [ ! -f $_homebrew ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed"
fi

# install some stuff
if [ -f $_homebrew ]
then
  $_homebrew install $_to_install
else
  echo "Homebrew not installed"
fi

# check if $SHELL is already set to fish shell
if [ "$(echo $SHELL)" != "$_fish_shell" ]
then
  if [ -f $_fish_shell ]
  then
    echo
    echo "Changing shell to fish, need sudo password"
    echo
    echo $_fish_shell | sudo tee -a /etc/shells;
    chsh -s $_fish_shell;
  else
    echo
    echo "Install fish via Homebrew first!"
    echo
  fi
else
  echo "fish shell already installed"
fi
