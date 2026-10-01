#!/bin/bash
# 說明：安裝圖形介面應用程式與 Hack Nerd Font

set -e

PACKAGES=(
    alacritty
    xclip
    feh
    firefox-esr

    # GNOME
    gnome-shell
    gnome-tweaks
    font-manager
    pcmanfm
)

# 一小時內更新過套件清單就跳過，避免 install.sh all 連續執行 cli、gui 時重複 apt update。
# apt update 下載清單時會經過 partial 目錄，用它的修改時間估計上次更新的時間；估錯了只會多更新一次。
if [ -z "$(find /var/lib/apt/lists/partial -maxdepth 0 -mmin -60)" ]; then
    sudo apt update
fi
echo "Installing GUI packages: ${PACKAGES[*]}"
sudo apt install -y "${PACKAGES[@]}"

# font: 從正式發行版下載，原始碼庫的目錄結構會變動，macOS 的 cask 也是用發行版
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz"
FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="HackNerdFontMono-Regular.ttf"

if [ ! -f "$FONT_DIR/$FONT_NAME" ]; then
    mkdir -p "$FONT_DIR"
    curl -fL "$FONT_URL" | tar -xJ -C "$FONT_DIR" "$FONT_NAME"
    fc-cache "$FONT_DIR"
fi
