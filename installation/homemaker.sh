#!/bin/bash

# install homemaker
# support linux and mac

download_homemaker() {
    DOWNLOAD_URL="https://foosoft.net/projects/homemaker/dl"
    if [[ 'Linux' == $(uname -s) ]]; then
        FOLDER_NAME="homemaker_linux_amd64"
    elif [[ 'Darwin' == $(uname -s) ]]; then
        FOLDER_NAME="homemaker_darwin_amd64"
    fi

    echo "Downloading $FOLDER_NAME.tar.gz ..."
    curl -sLo /tmp/homemaker.tar.gz "$DOWNLOAD_URL/$FOLDER_NAME.tar.gz"
    tar zxvf /tmp/homemaker.tar.gz -C /tmp

    echo "Install homemaker to /usr/local/bin"
    sudo mv -f /tmp/$FOLDER_NAME/homemaker /usr/local/bin
    rm -r /tmp/homemaker.tar.gz /tmp/$FOLDER_NAME
}

test_homemaker() {
    command -v homemaker >/dev/null 2>&1 \
        || echo "homemaker is not installed. Something wrong." \
        && echo "homemaker is already at $(which homemaker)."
}

download_homemaker
test_homemaker
