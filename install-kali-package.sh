#!/bin/bash

apt update

apt install bash bash-completion sudo screen man-db busybox locales \
    xsel xclip xdotool xserver-xorg-core dbus-x11 wmctrl \
    i3-wm libnotify-bin dunst dmenu fonts-noto-core fonts-noto-cjk fonts-noto-extra \
    tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension remmina remmina-plugin-vnc remmina-plugin-rdp \
    rxvt-unicode \
    p7zip-full unrar-free \
    openssl openssh-server rsync sshfs wget curl netcat-openbsd proxychains tor \
    maim imagemagick feh ffmpeg \
    vim jq git build-essential python3 -y
