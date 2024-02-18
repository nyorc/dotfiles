#!/bin/bash

# Hack Font with Nerd Fonts patch
FILE_NAME='Hack Regular Nerd Font Complete Mono.ttf'
curl -fLo "$FILE_NAME" \
    https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

mv "$FILE_NAME" ~/Library/Fonts/
