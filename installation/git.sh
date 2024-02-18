#!/bin/bash

linux_install() {
    sudo apt install -y git git-lfs
}

darwin_install() {
    brew install git git-lfs
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
