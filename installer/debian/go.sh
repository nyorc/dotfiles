#!/bin/bash
# 說明：安裝 Go 官方版本到 /usr/local/go（apt 的版本較舊）

set -e

# Go version to install (change this to update version)
GO_VERSION="1.25.0"

INSTALL_DIR="/usr/local"
GO_DIR="$INSTALL_DIR/go"

ARCH=$(uname -m)
case $ARCH in
    x86_64) GO_ARCH="amd64" ;;
    aarch64) GO_ARCH="arm64" ;;
    armv7l) GO_ARCH="armv6l" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

GO_URL="https://go.dev/dl/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz"
GO_ARCHIVE="/tmp/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz"

echo "Installing Go $GO_VERSION for $GO_ARCH to $INSTALL_DIR"

if [ -f "$GO_DIR/bin/go" ]; then
    INSTALLED_VERSION=$("$GO_DIR/bin/go" version | awk '{print $3}' | sed 's/go//')
    if [ "$INSTALLED_VERSION" = "$GO_VERSION" ]; then
        echo "Go $GO_VERSION is already installed at $GO_DIR"
        exit 0
    fi
    echo "Different Go version found ($INSTALLED_VERSION). Removing old installation..."
    sudo rm -rf "$GO_DIR"
fi

echo "Downloading Go $GO_VERSION..."
curl -fL "$GO_URL" -o "$GO_ARCHIVE"

echo "Installing Go..."
sudo tar -C "$INSTALL_DIR" -xzf "$GO_ARCHIVE"

rm "$GO_ARCHIVE"

echo "Go $GO_VERSION installed successfully!"
echo "zsh/.zsh/develop.zsh adds $GO_DIR/bin to PATH; restart the shell to use it."
