#!/bin/bash

dir=$PWD
olddir=~/dotfiles_old
files="vimrc zshrc"

mkdir -p $olddir # Make a backup

for file in $files; do
  mv ~/.$file $olddir/
  ln -s $dir/$file ~/.$file
done
