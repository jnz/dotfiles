#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
set -e

########## Variables

# dotfiles directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "dotfiles directory: $dir"

# old dotfiles backup directory
olddir="$dir/backup"
echo "saving existing config files to backup directory: $olddir"

# list of files/folders to symlink in homedir
files="gitconfig config/terminator/config"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Special handling
echo "source $dir/bashrc" >> ~/.bashrc
echo "source $dir/profile" >> ~/.profile
echo "\$include $dir/inputrc" >> ~/.inputrc
