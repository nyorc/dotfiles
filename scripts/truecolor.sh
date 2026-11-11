#!/bin/bash
# Usage: ./truecolor.sh
# 檢查終端機（含 tmux）有沒有輸出 24-bit 全彩

echo "Terminal True Color Test"
echo

# 色帶平滑代表全彩生效；看得出一格一格的色塊代表被降成 256 色
awk 'BEGIN {
    for (i = 0; i < 77; i++) {
        r = 255 - i * 255 / 76
        g = i * 510 / 76; if (g > 255) g = 510 - g
        b = i * 255 / 76
        printf "\033[48;2;%d;%d;%dm \033[0m", r, g, b
    }
    print ""
}'
echo

print_row() {
    printf "%-12s %s\n" "$1" "$2"
}

print_row TERM "$TERM"
print_row COLORTERM "${COLORTERM:-（未設定）}"

# tmux 依 attach 當下的 client 決定要不要輸出全彩，pane 裡的環境變數不準
if [ -n "$TMUX" ]; then
    case ",$(tmux display-message -p '#{client_termfeatures}')," in
        *,RGB,*) print_row "tmux client" "有 RGB" ;;
        *)       print_row "tmux client" "沒有 RGB" ;;
    esac
fi
