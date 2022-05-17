#!/bin/bash
if ! command -v chdman >> /dev/null; then
echo "CHDMAN not found! Downloading and installing!"

echo "Downloading needed packages"
pkg install build-essential git ninja -y
echo "Downloading source"
git clone https://github.com/CharlesThobe/chdman.git
fi
echo "Compiling"
cd ./chdman || exit
mkdir build && cd build || exit
cmake -G Ninja .. && ninja
echo "Moving chdman to $PATH and making it executable"
cp ./chdman "$PATH"/chdman
chmod +x "$PATH"/chdman
cd "$(dirname "$0")" || exit
if ! command -v maxcso >> /dev/null; then
echo "Maxcso not found! Downloading and installing!"

echo "Downloading needed packages"
pkg install binutils build-essential git liblz4 libuv -y
echo "Downloading source"
git clone https://github.com/unknownbrackets/maxcso.git
fi
echo "Compiling"
cd ./maxcso || exit
make
echo "Moving Maxcso to $PATH and making it executable"
cp ./maxcso "$PATH"/maxcso
chmod +x "$PATH"/maxcso
