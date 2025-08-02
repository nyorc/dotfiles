# aliases.zsh
# aliases collections

# myip
alias myip='curl ifconfig.co'

alias c='clear'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias parrot='curl parrot.live'

# eza
if type eza > /dev/null; then
    alias ls='eza --icons'
    alias ll='eza -lh --icons'
    alias la='eza -lah --icons'
    alias lr='eza -lR'
fi

# typo is not bad
alias sl='ls'

# bat
if type bat > /dev/null; then
    alias cat='bat'
fi
