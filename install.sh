#!/bin/bash
############################
# .install.sh
# This installs config of shell and tools
############################

# Create link in home
./make_symlinks.sh

# Install vim plugin manager - Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins then quit vim
vim +PluginInstall +qall
