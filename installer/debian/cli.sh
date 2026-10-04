#!/bin/bash
# 說明：安裝命令列工具，並下載 vim-plug、fzf，把預設 shell 改成 zsh

set -e

PACKAGES=(
    stow
    git
    curl
    tmux
    zsh
    lm-sensors
    jq
    dnsutils
    ufw
    bat
    fd-find # fd alternative to find
    ncdu # du alternative
    ripgrep # rg alternative to grep
    git-delta # A syntax-highlighting pager for git, diff, grep, and blame output
    git-lfs # Git Large File Storage, used by the lfs filter in .gitconfig
    eza # ls alternative

    # vim
    vim-gtk3 # +clipboard
    universal-ctags

    # TUI
    htop
    btop
    tig
)

# 一小時內更新過套件清單就跳過，避免 install.sh all 連續執行 cli、gui 時重複 apt update。
# apt update 下載清單時會經過 partial 目錄，用它的修改時間估計上次更新的時間；估錯了只會多更新一次。
if [ -z "$(find /var/lib/apt/lists/partial -maxdepth 0 -mmin -60)" ]; then
    sudo apt update
fi
echo "Installing CLI packages: ${PACKAGES[*]}"
sudo apt install -y "${PACKAGES[@]}"

# vim plugins
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# fzf：.zshrc、vim、tmux 都從 ~/.fzf 找 fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
if [ ! -x ~/.fzf/bin/fzf ]; then
    ~/.fzf/install --bin
fi

# zsh
current_shell=$(getent passwd "$USER" | cut -d: -f7)
zsh_path=$(command -v zsh)
if [ "$current_shell" != "$zsh_path" ]; then
    chsh -s "$zsh_path"
fi
