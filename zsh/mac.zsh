# mac.zsh
# config and script collection for mac

if [ "$(uname -s)" != "Darwin" ]; then
    return
fi

# gnu coreutils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# gnu sed
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# gnu tar
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# gnu which
PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"

# fix gnu ls no color
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi
ls --color -d . &>/dev/null && alias ls='ls --color=tty'

notify() {
    osascript -e "display notification \"$1\" with title \"Notification!\""
}

