#!/bin/bash
#
# https://github.com/tmux/tmux/wiki

linux_install() {
    VERSION="2.9a"

    sudo apt -y remove tmux
    sudo apt -y install automake build-essential libevent-dev libncurses-dev

    wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
    tar xf tmux-${VERSION}.tar.gz
    rm -f tmux-${VERSION}.tar.gz
    cd tmux-${VERSION}
    ./configure
    make
    sudo make install
    cd -
    sudo rm -rf /usr/local/src/tmux-*
    sudo mv tmux-${VERSION} /usr/local/src
}

darwin_install() {
    brew install tmux

    # tmux exits with [exited] on mac os x
    # https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x
    brew install reattach-to-user-namespace

    # CPU, RAM, and load monitor for use with tmux
    brew install tmux-mem-cpu-load
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
