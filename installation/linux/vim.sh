#!/bin/bash
# vim

sudo apt install vim-nox vim-gtk3 vim-doc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# for deoplete
sudo apt install python3-dev python3-pip
pip3 install pynvim neovim
