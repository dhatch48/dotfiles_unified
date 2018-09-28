#!/bin/bash
# Master install script for symlinking and vim setup.

# Make dir for TPM
mkdir ./tmux

./make_symlinks.sh

# Install TPM and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Install vim-plug
mkdir ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins with vim-plug
vim +PlugInstall +qall
