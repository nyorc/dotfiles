#!/bin/bash
#
# bat
# source: https://github.com/sharkdp/bat

mkdir -p ~/bin

VERSION="0.12.1"
DEB_FILE="bat_${VERSION}_amd64.deb"
wget https://github.com/sharkdp/bat/releases/download/v$VERSION/$DEB_FILE
sudo dpkg -i $DEB_FILE
rm $DEB_FILE
