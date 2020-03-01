#!/bin/bash


version="0.65.3"

wget "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_${version}_Linux-64bit.deb"

sudo apt install ./hugo_${version}_Linux-64bit.deb

rm hugo_${version}_Linux-64bit.deb
