# aliases.zsh
# aliases collections

# myip
# icanhazip.com is run by Cloudflare. Fallback: checkip.amazonaws.com (AWS official).
alias myip='curl -fsS https://icanhazip.com'

alias c='clear'
alias freq='fc -ln 1 | cut -f1 -d" " | sort | uniq -c | sort -nr | head -n 30'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# notify-send only exists on Linux desktops
if type notify-send > /dev/null; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

alias parrot='curl parrot.live'

# eza
if type eza > /dev/null; then
    alias ls='eza --icons=auto'
    alias ll='eza -lh --icons=auto'
    alias la='eza -lah --icons=auto'
    alias lr='eza -lR'
fi

# typo is not bad
alias sl='ls'

# bat (Debian ships the binary as batcat)
if type bat > /dev/null; then
    alias cat='bat'
elif type batcat > /dev/null; then
    alias bat='batcat'
    alias cat='batcat'
fi

# duf (df alternative; it does not accept df's flags, use `command df` for the original)
if type duf > /dev/null; then
    alias df='duf'
fi

# tmux
if type tmux > /dev/null; then
    alias txwork='txsession work'
    alias txcli='txsession cli'
fi
