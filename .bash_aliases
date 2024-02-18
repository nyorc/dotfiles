# myip
alias myip='wget -qO- ifconfig.co'

# go back x directories
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# wttr.in
wttr() {
    curl "wttr.in/$1"
}

alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias c='clear'

alias catc='pygmentize -O style=monokai -f console256 -g'

# for git
alias gitmbranch="git checkout master | git branch -r --merged | grep -v master"
alias gitpurge="git checkout master | git branch -r --merged | grep -v master | sed -e 's/origin\//:/' | xargs git push origin"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Accessing Homestead Globally
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
