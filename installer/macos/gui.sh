#!/bin/bash
# 說明：安裝圖形介面應用程式（brew cask）與 Hack Nerd Font

set -e

PACKAGES=(
    alacritty
    google-chrome
    firefox
    telegram-desktop
    zed
    squirrel-app # rime
    keepingyouawake
    keycastr
    rectangle
    scroll-reverser
    mpv
    font-hack-nerd-font

    # unuse now
    # keepassxc
    # insomnia
    # joplin
)

echo "Installing cask applications: ${PACKAGES[*]}"
brew install --cask "${PACKAGES[@]}"
