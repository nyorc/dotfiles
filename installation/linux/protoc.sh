#!/bin/bash
#
# install protoc
# from https://github.com/google/protobuf/releases/latest
#

VERSION="3.6.1"
PLATFORM="linux-x86_64"
FILENAME="protoc-$VERSION-$PLATFORM.zip"

curl -LO "https://github.com/google/protobuf/releases/download/v$VERSION/$FILENAME"

sudo unzip -u $FILENAME -d /usr/local bin/protoc include/*

rm $FILENAME
