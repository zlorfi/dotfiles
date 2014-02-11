#!/bin/bash

# Generate symlinks for files
for i in gemrc gvimrc irbrc jumprc NERDTreeBookmarks screenrc vimrc zshrc tmux.conf
do
  if [ ! -f $HOME/.$i ]
  then
    ln -s $HOME/dotfiles/$i $HOME/.$i
  else
    echo Symlink $HOME/.$i already exists
  fi
done

for j in vim zsh
do
  if [ ! -d $HOME/.$j ]
  then
    ln -s $HOME/dotfiles/$j $HOME/.$j
  else
    echo Symlink $HOME/.$j already exists
  fi
done

if [ ! -d $HOME/.vim/tmp ]
then
  mkdir $HOME/.vim/tmp
else
  echo tmp folder $HOME/.vim/tmp already exists
fi
