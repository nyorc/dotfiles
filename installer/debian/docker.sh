#!/bin/bash
# 說明：加入 Docker 官方套件來源，安裝 Docker Engine 並把目前使用者加進 docker 群組

set -e

# Debian 的 docker.io 版本較舊，也沒有 buildx、compose 外掛，所以用 Docker 官方的套件來源
KEYRING="/etc/apt/keyrings/docker.asc"
CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSLo "$KEYRING" https://download.docker.com/linux/debian/gpg
sudo chmod a+r "$KEYRING"
echo "deb [arch=$(dpkg --print-architecture) signed-by=$KEYRING] https://download.docker.com/linux/debian $CODENAME stable" |
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 加進 docker 群組才能不用 sudo 執行 docker，要重新登入才會生效
if ! id -nG "$USER" | grep -qw docker; then
    sudo usermod -aG docker "$USER"
    echo "Added $USER to the docker group; log out and back in to use docker without sudo."
fi
