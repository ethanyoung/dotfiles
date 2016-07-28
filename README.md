UNIX dot files
===

How to use
---
Clone the repository to Home folder.

Set up [Vundle]:

   `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Link the files in the repository to corresponding dot files:

```shell
$ ln -s ~/dotfiles/$filename ~/.$filename
```

For a quick setup
---
Executing `setup.sh` for a quick setup.

*Note: only vim and zsh related files are included in the setup.sh. Other
files, such as rvmrc, need to be manually linked.*
