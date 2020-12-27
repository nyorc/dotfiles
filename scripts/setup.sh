#!/usr/bin/env bash
#
# setup.sh will install git, pip and ansible

case "$(uname -s)" in
    Linux)
        sudo apt install -y git python3-pip
        sudo pip3 install ansible
        ;;
    *)
        echo Unsupported OS
esac

