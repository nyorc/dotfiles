#!/bin/bash

# Exit immediately if any command fails
set -e

# Show usage information
show_usage() {
    echo "Usage: $0 [cli|cask]"
}

requirement_check() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
}

install_cli() {
    requirement_check

    CLI_APPS=(
        "stow"
        "git"
        "bash"
        "coreutils"
        "findutils" # find, xargs, etc.
        "gnu-tar"
        "gnu-sed"
        "less"
        "make"
        "watch"
        "gawk"
        "grep"
        "gzip"
        "wget"
        "jq"
        "bat"
        "eza"
        "youtube-dl"
        "ripgrep" # rg

        # TUI
        "htop"
        "tig"

        # tmux
        "tmux"
        # reattach-to-user-namespace
        # tmux exits with [exited] on mac os x
        # https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x
        "reattach-to-user-namespace"
        "tmux-mem-cpu-load"
    )

    echo "Installing CLI applications: ${CLI_APPS[*]}"
    brew install "${CLI_APPS[@]}"
}

install_cask() {
    requirement_check

    CASK_APPS=(
        "alacritty"
    )

    echo "Installing CASK applications: ${CASK_APPS[*]}"
    brew install --cask "${CASK_APPS[@]}"
}

# Install based on arguments
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

for arg in "$@"; do
    case $arg in
        cli) install_cli ;;
        cask) install_cask ;;
        *)
            echo "Unknown category: $arg"
            show_usage
            exit 1
            ;;
    esac
done

echo "Installation completed!"
