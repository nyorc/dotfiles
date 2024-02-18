#!/bin/sh
extensions_list="vscode.extensions.list"
echo "\033[032mstart install vscode extensions\033[m"

if [ ! -f $extensions_list ]; then
    echo "$extensions_list not found"
    exit 1
fi

for ext in `cat $extensions_list`
do
    code --install-extension "$ext"
done

echo "\033[032mDone\033[m"
