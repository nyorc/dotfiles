#!/bin/bash
#
# srouce: https://golang.org/dl/
#
# you may need to set PATH env:
# export PATH=$PATH:/usr/local/go/bin

VERSION="1.13.3"

linux_uninstall() {
    if [ -d /usr/local/go/ ]; then
        sudo rm -r /usr/local/go
    fi
}

linux_install() {
    # remove old version
    linux_uninstall

    curl -O https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
    rm go$VERSION.linux-amd64.tar.gz
}

darwin_install() {
    brew install go
}

case "$(uname -s)" in
    Linux)
        linux_install
        ;;
    Darwin)
        darwin_install
        ;;
    *)
        echo unknow OS
        ;;
esac
