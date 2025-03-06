#!/bin/bash

# Download neccessary softwares

INSTALL_DIR=/opt

echo "Downloading Firefox..."
curl -L 'https://download.mozilla.org/?product=firefox-latest-ssl&lang=en-US&os=linux64' | tar xJ

echo "Downloading Node.js..."
curl -L 'https://nodejs.org/dist/v22.14.0/node-v22.14.0-linux-x64.tar.xz' | tar xJ

echo "Downloading Neovim..."
curl -L 'https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz' | tar zxv

# ask user whether to move the downloaded files to $INSTALL_DIR
echo "Do you want to move the downloaded files to $INSTALL_DIR? [y/n]"
read -r response

if [ "$response" = "y" ]; then
    sudo mv firefox $INSTALL_DIR
    sudo mv node-v22.14.0-linux-x64 $INSTALL_DIR/nodejs
    sudo mv nvim-linux-x86_64 $INSTALL_DIR/nvim
    echo "Files moved to $INSTALL_DIR"
fi
