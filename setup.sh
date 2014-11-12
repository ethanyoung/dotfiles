#!/bin/bash

# Install necessary software

# vim

# zsh

# oh-my-zsh

# chsh

# tmux

# xclip

# Then link files

# Names of the files to link
filename_list=(vim vimrc zshrc bash_aliases)

for filename in "${filename_list[@]}"; do
  origin="$HOME/dotfiles/$filename"
  destination="$HOME/.$filename"

  echo "Linking $origin to $destination..."

  # Backup the old file
  ln -sv "$origin" "$destination"
done
