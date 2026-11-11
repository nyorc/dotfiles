#!/bin/bash
# 說明：安裝圖形介面應用程式（brew cask）、Hack Nerd Font 與 rime 嘸蝦米方案，並縮小視窗圓角

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

# rime 嘸蝦米方案：用東風破（plum）安裝，啟用方案交給 make dotfiles-rime。
# 已安裝就跳過，因為 plum 會覆蓋內容不同的檔案，蓋掉自己加過詞的 liur_customWords.dict.yaml。
if [ ! -f "$HOME/Library/Rime/liur.schema.yaml" ]; then
    PLUM_TMP="$(mktemp -d)"
    curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install \
        | plum_dir="$PLUM_TMP/plum" bash -s -- nyorc/rime-liur
    rm -rf "$PLUM_TMP"
fi

# 視窗圓角半徑縮成 10pt：系統預設的圓角會切掉貼齊視窗邊緣的內容，例如 Alacritty 最下面一行的兩端。
# NSConvolutionOverride1 是 AppKit 沒有公開文件的偏好設定，應用程式重開後才套用。
defaults write -g NSConvolutionOverride1 -float 10
