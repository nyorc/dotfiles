#!/bin/bash

# Exit immediately if any command fails
set -e

# Python packages to install 
PYTHON_PACKAGES=(
    pynvim
    neovim
)

# Check and install uv
install_uv() {
    if command -v uv &> /dev/null; then
        echo "uv is already installed"
        return
    fi
    
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    echo "uv installed successfully"
    echo "Please restart your shell or run: source ~/.bashrc (or ~/.zshrc)"
}

# Install Python packages using uv
# (will be installed in ~/.venv virtual environment)
install_packages() {
    echo "Creating virtual environment in ~/.venv..."
    cd ~
    uv venv .venv
    
    echo "Activating virtual environment..."
    source ~/.venv/bin/activate
    
    echo "Installing Python packages: ${PYTHON_PACKAGES[*]}"
    
    for package in "${PYTHON_PACKAGES[@]}"; do
        echo "Installing $package..."
        uv pip install "$package"
    done
    
    echo "All Python packages installed successfully"
    echo "Virtual environment created at ~/.venv"
    echo "To activate: source ~/.venv/bin/activate"
}

# Show usage information
show_usage() {
    echo "Usage: $0"
    echo "This script will install uv (if not present) and Python packages"
}

# Main execution
echo "=== Python Package Installer ==="

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_usage
    exit 0
fi

install_uv
install_packages

echo "Python package installation completed!"
