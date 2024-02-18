#!/bin/bash

git clone --depth 10 git@github.com:universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install

cd ..
rm -rf ctags
