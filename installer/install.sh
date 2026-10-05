#!/bin/bash
# 安裝軟體的入口：判斷目前平台，把安裝目標交給平台目錄裡的同名腳本

set -e

INSTALLER_DIR="$(cd "$(dirname "$0")" && pwd)"

case "$(uname -s)" in
    Linux)
        PLATFORM=debian
        PACKAGE_MANAGER=apt
        MISSING_MESSAGE="This script is designed for Debian/Ubuntu systems with apt package manager."
        ;;
    Darwin)
        PLATFORM=macos
        PACKAGE_MANAGER=brew
        MISSING_MESSAGE="Homebrew is not installed. Please install Homebrew first."
        ;;
    *)
        echo "Unsupported operating system: $(uname -s)"
        exit 1
        ;;
esac

PLATFORM_DIR="$INSTALLER_DIR/$PLATFORM"

# 兩個平台共有的分組；go 這類選用的目標不放進來
ALL_TARGETS=(cli gui)

# 只在終端機上色，輸出導到檔案時保持純文字
if [ -t 1 ]; then
    BLUE=$'\033[1;34m' GREEN=$'\033[1;32m' BOLD=$'\033[1m' RESET=$'\033[0m'
else
    BLUE='' GREEN='' BOLD='' RESET=''
fi

# 仿照 Homebrew 的 "==>" 標題，讓各段輸出容易分辨
print_heading() {
    local color=$1 text=$2
    printf "\n%s==>%s %s%s%s\n" "$color" "$RESET" "$BOLD" "$text" "$RESET"
}

# 說明只寫在各腳本的「# 說明：」那一行，用法和標題都從這裡讀，新增腳本就會自動列出。
# 找不到時印出提示而不是空白，讓漏寫的腳本在用法清單上看得出來。
describe() {
    local text
    text=$(sed -n 's/^# 說明：//p' "$PLATFORM_DIR/$1.sh" | head -n 1)
    echo "${text:-（缺少「# 說明：」）}"
}

show_usage() {
    echo "Usage: $0 <target>...（目前平台：${PLATFORM}）"
    printf "  %-6s %s\n" all "${ALL_TARGETS[*]}"
    for script in "$PLATFORM_DIR"/*.sh; do
        local target
        target=$(basename "$script" .sh)
        printf "  %-6s %s\n" "$target" "$(describe "$target")"
    done
}

if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

if ! command -v "$PACKAGE_MANAGER" &> /dev/null; then
    echo "$MISSING_MESSAGE"
    exit 1
fi

targets=()
for arg in "$@"; do
    if [ "$arg" = all ]; then
        targets+=("${ALL_TARGETS[@]}")
    else
        targets+=("$arg")
    fi
done

# 先檢查全部目標（含 all 展開的），避免打錯字時前面的目標已經裝到一半
for target in "${targets[@]}"; do
    if [ ! -f "$PLATFORM_DIR/$target.sh" ]; then
        echo "Unknown target: $target"
        show_usage
        exit 1
    fi
done

for target in "${targets[@]}"; do
    print_heading "$BLUE" "$PLATFORM/${target}：$(describe "$target")"
    "$PLATFORM_DIR/$target.sh"
done

print_heading "$GREEN" "完成（${PLATFORM}）：${targets[*]}"
