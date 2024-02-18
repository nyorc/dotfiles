#!/bin/bash
#

linux_install() {
    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh -s /bin/zsh
}

darwin_install() {
    brew install zsh zsh-completions
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh -s /bin/zsh
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
