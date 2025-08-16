#!/bin/bash

# Exit immediately if any command fails
set -e

# Go version to install (change this to update version)
GO_VERSION="1.25.0"

# Set installation directory
INSTALL_DIR="/usr/local"
GO_DIR="$INSTALL_DIR/go"

# Check if running on Linux
if [ "$(uname -s)" != "Linux" ]; then
    echo "This script is designed for Linux systems only."
    exit 1
fi

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64) GO_ARCH="amd64" ;;
    aarch64) GO_ARCH="arm64" ;;
    armv7l) GO_ARCH="armv6l" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

GO_URL="https://golang.org/dl/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz"
GO_ARCHIVE="/tmp/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz"

echo "Installing Go $GO_VERSION for $GO_ARCH to $INSTALL_DIR"

# Check if Go is already installed with the same version
if [ -d "$GO_DIR" ] && [ -f "$GO_DIR/bin/go" ]; then
    INSTALLED_VERSION=$("$GO_DIR/bin/go" version | awk '{print $3}' | sed 's/go//')
    if [ "$INSTALLED_VERSION" = "$GO_VERSION" ]; then
        echo "Go $GO_VERSION is already installed at $GO_DIR"
        exit 0
    else
        echo "Different Go version found ($INSTALLED_VERSION). Removing old installation..."
        sudo rm -rf "$GO_DIR"
    fi
fi

echo "Downloading Go $GO_VERSION..."
curl -fL "$GO_URL" -o "$GO_ARCHIVE"

echo "Installing Go..."
sudo tar -C "$INSTALL_DIR" -xzf "$GO_ARCHIVE"

# Clean up
rm "$GO_ARCHIVE"

echo "Go $GO_VERSION installed successfully!"
echo "Add the following to your shell profile if not already present:"
echo "export PATH=\$PATH:$GO_DIR/bin"
