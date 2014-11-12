#!/bin/bash

# Names of the files to link
filename_list=(vim vimrc zshrc bash_aliases)

for filename in "${filename_list[@]}"; do
  origin="$HOME/dotfiles/$filename"
  destination="$HOME/.$filename"

  echo "Linking $origin to $destination..."

  ln -sv "$origin" "$destination"
done
