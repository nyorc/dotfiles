# function.zsh
# function collection

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

# Accessing Homestead Globally
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

ansi_table() {
    T='gYw'   # The test text
    echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
        do FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
            do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
        done
        echo;
    done
    echo
}

ctop() {
    docker run --rm -ti \
      --name=ctop \
      -v /var/run/docker.sock:/var/run/docker.sock \
      quay.io/vektorlab/ctop:latest
}

product_name() {
    sudo dmidecode | grep "Product Name"
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

now() {
    date +%s
}

to_date() {
    date -Iseconds --date=@$1
}


path_list() {
    echo -e "${PATH//:/\n}"
}
