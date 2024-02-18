#!/bin/bash

# deamon
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# client
wget https://www.dropbox.com/download\?dl\=packages/dropbox.py -O dropbox.py
chmod +x dropbox
mkdir -p ~/bin
mv dropbox ~/bin

dropbox autostart y
