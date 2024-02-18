#!/bin/bash
#
# source: https://desktop.telegram.org/

wget https://telegram.org/dl/desktop/linux -O tsetup.tar.xz
tar -xJvf tsetup.tar.xz

sudo mv Telegram /opt/telegram
sudo ln -s /opt/telegram/Telegram /usr/local/bin/telegram

rm tsetup.tar.xz
