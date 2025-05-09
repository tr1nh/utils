#!/bin/bash

apk update

apk add bash bash-completion sudo tzdata screen \
	xsel xclip xdotool xrandr libxcvt \
	i3wm dmenu libnotify dunst font-noto-all \
	tigervnc remmina \
	xterm ttyd \
	7zip \
	openssl openssh rsync sshfs wget curl netcat-openbsd firefox \
	maim imagemagick feh ffmpeg mpv \
	vim jq git build-base python3 py3-pip pipx nodejs npm 
