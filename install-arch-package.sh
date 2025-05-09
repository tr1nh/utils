#!/bin/bash

pacman -Sy

pacman -S bash bash-completion polkit screen upower \
	xorg xsel xclip xdotool slop \
	i3-wm i3lock dmneu libnotify dunst \
	noto-fonts-cjk noto-fonts-emoji noto-fonts-extra noto-fonts \
	tigervnc libvncserver freerdp remmina \
	p7zip unrar udisks2 \
	openssl openssh rsync sshfs wget curl openbsd-netcat nmap \
	rxvt-unicode \
	maim imagemagick feh \
	pulseaudio ffmpeg mpv mediainfo \
	vim jq git python python-pip python-pipx \
	tlp tlp-rdw nethack
