#!/bin/sh
extensions_list="vscode.extensions.list"

echo "\033[032mstart backup vscode extensions\033[m"
code --list-extensions | tee $extensions_list

echo "\033[032mDone\033[m"
echo "backup to \033[036m$extensions_list\033[m"
