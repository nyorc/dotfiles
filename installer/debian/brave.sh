#!/bin/bash
# 說明：加入 Brave 官方套件來源並安裝 Brave 瀏覽器

set -e

# 套件來源和金鑰照 Brave 官方文件的路徑放，重複執行會覆寫成最新版本
REPO_URL="https://brave-browser-apt-release.s3.brave.com"

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg "$REPO_URL/brave-browser-archive-keyring.gpg"
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources "$REPO_URL/brave-browser.sources"

sudo apt update
sudo apt install -y brave-browser
