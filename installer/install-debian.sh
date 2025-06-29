#!/bin/bash

# Exit immediately if any command fails
set -e

# Show usage information
show_usage() {
    echo "Usage: $0 [gnome|cli|gui]"
}

requirement_check() {
    if ! command -v apt &> /dev/null; then
        echo "This script is designed for Debian/Ubuntu systems with apt package manager."
        exit 1
    fi
}

install_gnome() {
    requirement_check

    GNOME_APPS=(
        gnome-shell
        gnome-tweaks
    )

    sudo apt update
    echo "Installing GNOME applications: ${GNOME_APPS[*]}"
    sudo apt install -y "${GNOME_APPS[@]}"
}

install_cli() {
    requirement_check

    CLI_APPS=(
        stow
        git
        curl
        tmux
        zsh
        lm-sensors
        jq
        dnsutils
        bat
        fd-find # fd alternative to find
        ncdu # du alternative
        ripgrep # rg alternative to grep

        # TODO eza may not in apt repository
        # eza # ls alternative

        # vim
        vim-nox
        universal-ctags

        # TUI
        htop
        tig
    )

    sudo apt update
    echo "Installing CLI applications: ${CLI_APPS[*]}"
    sudo apt install -y "${CLI_APPS[@]}"

    # vim plugins
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # zsh
    chsh -s $(which zsh)
}

install_gui() {
    requirement_check

    GUI_APPS=(
        alacritty
        xclip
        feh
        firefox-esr
    )

    sudo apt update
    echo "Installing GUI applications: ${GUI_APPS[*]}"
    sudo apt install -y "${GUI_APPS[@]}"
}


# Install based on arguments
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

for arg in "$@"; do
    case $arg in
        gnome) install_gnome ;;
        cli) install_cli ;;
        gui) install_gui ;;
        *)
            echo "Unknown category: $arg"
            show_usage
            exit 1
            ;;
    esac
done

echo "Installation completed!"
