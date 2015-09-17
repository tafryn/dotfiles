#!/bin/bash

##############################################################################
# .makesymlinks.sh                                                           #
#                                                                            #
# This script creates symlinks from the home directory to any desired        #
# dot files in ~/dotfiles                                                    #
##############################################################################

#|    Variables                                                            {{{
#|============================================================================

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
change_counter=0                  # count of changes made
# list of files/folders to symlink in homedir
files="gdbinit irssi mailcap pentadactylrc screenrc tmux.conf tmux\
       vimpagerrc vimrc vim Xdefaults xinitrc xmobarrc xmonad zshenv zshrc zsh"

# }}} #

if [ ! -e $olddir ]; then
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    echo " done"
fi

cd $dir

# Move any existing dot files in user's home directory to $olddir, then create
# symlinks from the user's home directory to the files in the ~/dotfiles
# directory specified in $files
for file in $files; do
    if ! diff -rq ~/.$file $dir/.$file; then
        if [ -e ~/.$file ]; then
            echo "Moving existing .$file from ~ to $olddir"
            mv ~/.$file $olddir
        fi
        echo "Creating symlink to .$file in home directory."
        ln -s $dir/.$file ~/.$file
        change_counter=$((change_counter+1))
    fi
done

echo "Changed $change_counter files."
