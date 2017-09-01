#!/bin/bash
# Master install script for symlinking and vim setup.

# Make dir for TPM
mkdir ~/dotfiles/tmux

./make_symlinks.sh

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim plugin manager - Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins using Vundle
vim +PluginInstall +qall
