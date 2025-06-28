#!/bin/bash

# Exit immediately if any command fails
set -e

# Set font directory based on OS
case "$(uname -s)" in
    Darwin) FONT_DIR="$HOME/Library/Fonts" ;;
    Linux) FONT_DIR="$HOME/.fonts" ;;
    *) echo "Unsupported operating system"; exit 1 ;;
esac

FONT_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFontMono-Regular.ttf"
FONT_FILE="$FONT_DIR/HackNerdFontMono-Regular.ttf"

echo "Installing Hack Nerd Font to $FONT_DIR"

mkdir -p "$FONT_DIR"

if [ -f "$FONT_FILE" ]; then
    echo "Font already exists: $FONT_FILE"
else
    echo "Downloading font..."
    curl -fL "$FONT_URL" -o "$FONT_FILE"
    echo "Font installed: $FONT_FILE"
fi

# Update font cache on Linux
if [ "$(uname -s)" = "Linux" ] && command -v fc-cache &> /dev/null; then
    echo "Updating font cache..."
    fc-cache -fv
fi

echo "Font installation completed!"
