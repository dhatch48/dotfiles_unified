#!/bin/bash
# Master install script for symlinking and vim setup.

# Make dir for TPM
mkdir ./tmux

./make_symlinks.sh

# Install TPM and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Install vim plugin manager - Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins using Vundle
vim +PluginInstall +qall
