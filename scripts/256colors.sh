#!/bin/bash
# Usage: ./256colors.sh

echo "Terminal 256 Color Table"
echo

# 標準 16 色
echo "標準 16 色 (0-15):"
for i in {0..15}; do
    printf "\e[48;5;${i}m  \e[0m\e[38;5;${i}m%3d\e[0m " $i
    if [ $((($i + 1) % 8)) -eq 0 ]; then
        echo
    fi
done
echo

# 216 色立方體 (16-231)
echo "216 色立方體 (16-231):"
for i in {16..231}; do
    printf "\e[48;5;${i}m  \e[0m\e[38;5;${i}m%3d\e[0m " $i
    if [ $((($i - 15) % 6)) -eq 0 ]; then
        echo
    fi
done
echo

# 灰階 (232-255)
echo "24 級灰階 (232-255):"
for i in {232..255}; do
    printf "\e[48;5;${i}m  \e[0m\e[38;5;${i}m%3d\e[0m " $i
    if [ $((($i - 231) % 8)) -eq 0 ]; then
        echo
    fi
done
echo

echo
echo "使用方式："
echo "- 背景色: \\e[48;5;{color_number}m"
echo "- 前景色: \\e[38;5;{color_number}m"
echo "- 重置: \\e[0m"
echo
echo "範例："
echo "echo -e \"\\e[38;5;196m紅色文字\\e[0m\""
echo "echo -e \"\\e[48;5;21m\\e[38;5;255m藍底白字\\e[0m\""
