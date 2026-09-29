# function.zsh
# function collection

# wttr.in
wttr() {
    curl "wttr.in/$1"
}

open_monitor() {
    tmux new-window -n monitor

    tmux split-window -h -t monitor
    tmux split-window -v -t monitor
    tmux split-window -v -t monitor

    tmux send-keys -t 1 'htop' C-j
    tmux send-keys -t 2 'watch sensors' C-j
    tmux send-keys -t 3 'ctop' C-j
    tmux send-keys -t 4 'watch uptime' C-j
}

timestamp() {
    date +%s
}

to_date() {
    date -Iseconds --date=@$1
}

path() {
    echo -e "${PATH//:/\n}"
}
