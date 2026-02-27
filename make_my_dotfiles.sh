#!/bin/bash

# some variables
_shell="/opt/homebrew/bin/zsh"
# _shell="/opt/homebrew/bin/fish"
_homebrew=`which brew`
_to_install="the_silver_searcher btop gh imagemagick rbenv redis ruby-build tmux yasm elixir iperf3 zsh oh-my-posh\
             git git-flow certbot nvim yarn azure-cli openssl kubectl typst thonny k9s uv stern nvm"

# Generate symlinks for files
for i in gemrc gitconfig gitmessage gitignore gvimrc irbrc rspec screenrc tmux.conf rubocop.yml prettierrc
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

if [ ! -d $HOME/.config ]
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
if [ "$(echo $SHELL)" != "$_shell" ]
then
  if [ -f $_shell ]
  then
    echo
    echo "Changing shell to fish, need sudo password"
    echo
    echo $_shell | sudo tee -a /etc/shells;
    chsh -s $_shell;
  else
    echo
    echo "Install fish via Homebrew first!"
    echo
  fi
else
  echo "fish shell already installed"
fi
