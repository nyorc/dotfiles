#!/bin/bash

# install dotfiles

homemaker -verbose -task $(uname -s) $HOME/.dotfiles/dotfiles.yaml $HOME/.dotfiles
