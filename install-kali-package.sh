#!/bin/bash

apt update

apt install bash bash-completion sudo screen man-db busybox \
    xsel xclip xdotool xserver-xorg-core \
    i3-wm libnotify-bin dunst dmenu fonts-noto-core fonts-noto-cjk fonts-noto-extra \
    tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension remmina remmina-plugin-vnc remmina-plugin-rdp \
    rxvt-unicode \
    p7zip-full unrar \
    openssl openssh-server rsync sshfs wget curl netcat-openbsd firefox-esr \
    maim imagemagick feh ffmpeg \
    vim jq git build-essential python3 python3-pip pipx -y
    