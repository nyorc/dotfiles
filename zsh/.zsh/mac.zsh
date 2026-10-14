# mac.zsh
# config and script collection for mac

if [[ $OSTYPE != darwin* ]]; then
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

# gnu make
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# let self-updating casks update themselves
export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1

# fix gnu ls no color
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi
