#!/bin/bash

for path in files/.*
do
  file=`basename $path`

  if [[ $file = '.' ||  $file = '..' ]];
  then
    continue
  fi

  echo "Symlinking $file to ~/$file"

  `ln -sf ~/.dotfiles/files/$file ~/$file` # symlink files

done
