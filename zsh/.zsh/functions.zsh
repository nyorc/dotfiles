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

# Split this pane: claude left, vim (netrw) top-right, 20% shell bottom-right
tldev() {
    if [[ -z $TMUX ]]; then
        echo "tldev: must run inside tmux" >&2
        return 1
    fi

    local editor_pane
    editor_pane=$(tmux split-window -h -d -P -F '#{pane_id}' -t "$TMUX_PANE" -c "$PWD")
    tmux split-window -v -d -l 20% -t "$editor_pane" -c "$PWD"
    tmux send-keys -t "$editor_pane" 'vim .' C-m
    tmux select-pane -t "$editor_pane"

    claude
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
