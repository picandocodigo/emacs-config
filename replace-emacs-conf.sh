#!/bin/sh

# Script to replace emacs file with this one
# I'm too lazy to do this by hand
#This will create a symlink to this folder's emacs file
read -p "Are you sure you want to replace your emacs file with this emacs file? [y/N]?"
if [[ $REPLY == "y" || $REPLY == "Y" ]]; then
    mv ~/.emacs ~/.emacs_old
    ln -s `pwd`/.emacs ~/.emacs
    ln -s `pwd`/.emacs.d ~/.emacs.d
    echo "Done"
else
    echo "Nothing to do here then..."
fi
