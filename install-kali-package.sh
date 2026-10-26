#!/bin/bash

apt update

apt install bash bash-completion sudo screen man-db busybox locales \
    xsel xclip xdotool xserver-xorg-core dbus-x11 wmctrl slop keynav xbindkeys \
    i3-wm libnotify-bin dunst dmenu fonts-noto-core fonts-noto-cjk fonts-noto-extra \
    tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension remmina remmina-plugin-vnc remmina-plugin-rdp xrdp \
    xterm \
    p7zip-full unrar-free unzip \
    openssl openssh-server rsync sshfs wget curl netcat-openbsd proxychains tor w3m \
    maim imagemagick feh ffmpeg \
    libreoffice pandoc mupdf-tools poppler-utils \
    htop vim jq git build-essential python3 -y