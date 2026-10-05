#!/bin/bash
# 說明：安裝命令列工具（含 Go），並下載 vim-plug、fzf，把預設 shell 改成 zsh

set -e

PACKAGES=(
    stow
    git
    git-delta
    git-lfs
    bash
    zsh
    zsh-completions
    coreutils
    findutils # find, xargs, etc.
    gnu-tar
    gnu-sed
    less
    make
    watch
    gawk
    grep
    gzip
    wget
    jq
    bat
    eza
    ripgrep # rg
    go
    uv
    hugo
    yt-dlp
    tailscale

    # vim
    vim
    universal-ctags

    # TUI
    htop
    btop
    tig

    # tmux
    tmux
    # tmux exits with [exited] on mac os x
    # https://superuser.com/questions/397076/tmux-exits-with-exited-on-mac-os-x
    reattach-to-user-namespace
    tmux-mem-cpu-load
)

echo "Installing CLI packages: ${PACKAGES[*]}"
brew install "${PACKAGES[@]}"

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

# zsh: macOS has no getent, read the login shell from Directory Service.
# Use the system zsh because Homebrew's zsh is not listed in /etc/shells.
current_shell=$(dscl . -read "/Users/$USER" UserShell | awk '{print $2}')
if [ "$(basename "$current_shell")" != "zsh" ]; then
    chsh -s /bin/zsh
fi
