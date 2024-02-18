# aliases.zsh
# aliases collections

# myip
alias myip='curl ifconfig.co'

alias c='clear'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias catc='pygmentize -O style=monokai -f console256 -g'

# for git
alias gitmbranch="git checkout master | git branch -r --merged | grep -v master"
alias gitpurge="git checkout master | git branch -r --merged | grep -v master | sed -e 's/origin\//:/' | xargs git push origin"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias zshconfig='vim .zshrc'

alias parrot='curl parrot.live'
