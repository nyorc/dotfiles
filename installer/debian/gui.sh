#!/bin/bash
# 說明：安裝圖形介面應用程式、Noto 字型、Hack Nerd Font 與 rime 嘸蝦米方案

set -e

PACKAGES=(
    alacritty
    xclip
    feh
    imv
    mpv
    firefox-esr
    ibus-rime

    # GNOME
    gnome-shell
    gnome-tweaks
    network-manager
    font-manager
    pcmanfm

    # fonts
    fonts-noto-core
    fonts-noto-cjk
    fonts-noto-color-emoji
)

# 一小時內更新過套件清單就跳過，避免 install.sh all 連續執行 cli、gui 時重複 apt update。
# apt update 下載清單時會經過 partial 目錄，用它的修改時間估計上次更新的時間；估錯了只會多更新一次。
if [ -z "$(find /var/lib/apt/lists/partial -maxdepth 0 -mmin -60)" ]; then
    sudo apt update
fi
echo "Installing GUI packages: ${PACKAGES[*]}"
sudo apt install -y "${PACKAGES[@]}"

# rime 嘸蝦米方案：用東風破（plum）安裝，啟用方案交給 make dotfiles-rime。
# 已安裝就跳過，因為 plum 會覆蓋內容不同的檔案，蓋掉自己加過詞的 liur_customWords.dict.yaml。
if [ ! -f "$HOME/.config/ibus/rime/liur.schema.yaml" ]; then
    PLUM_TMP="$(mktemp -d)"
    curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install \
        | plum_dir="$PLUM_TMP/plum" bash -s -- nyorc/rime-liur
    rm -rf "$PLUM_TMP"
fi

# font: 從正式發行版下載，原始碼庫的目錄結構會變動，macOS 的 cask 也是用發行版
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz"
FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="HackNerdFontMono-Regular.ttf"

if [ ! -f "$FONT_DIR/$FONT_NAME" ]; then
    mkdir -p "$FONT_DIR"
    curl -fL "$FONT_URL" | tar -xJ -C "$FONT_DIR" "$FONT_NAME"
    fc-cache "$FONT_DIR"
fi
