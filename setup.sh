# This script has not been finished. Please do not use it.

#!/bin/bash

# Names of the files to link
filename_list=(vim vimrc zshrc bash_aliases rvmrc)

for filename in "${filename_list[@]}"; do
  origin="~/dotfiles/$filename"
  destination="~/.$filename"

  echo "Linking '$origin' to '$destination'..."

  ln -s $origin $destination

  echo "Done!\n"
done
