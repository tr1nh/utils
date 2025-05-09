#!/bin/bash

# a script to create a container
# with necessary packages and configurations

CONTAINER_NAME=box-dev
CONTAINER_USERNAME=zero
CONTAINER_PASSWORD=changeme
CONTAINER_VOLUME=$PWD/.containers/$CONTAINER_NAME/$CONTAINER_USERNAME
CONTAINER_IMAGE=alpine
SCRIPT_INIT=.init-box.sh
SCRIPT_VNC=.init-vnc.sh

function create_script_alpine() {
	echo "apk update &&
	apk add bash bash-completion sudo tzdata screen \
	xsel xclip xdotool xrandr libxcvt \
	i3wm dmenu libnotify dunst font-noto-all \
	tigervnc remmina \
	xterm ttyd \
	7zip \
	openssl openssh rsync sshfs wget curl netcat-openbsd firefox \
	maim imagemagick feh ffmpeg mpv \
	vim jq git build-base python3 py3-pip pipx nodejs npm &&

	if [ ! \$(id -u '$CONTAINER_USERNAME') ]; then
		(echo '$CONTAINER_PASSWORD';echo '$CONTAINER_PASSWORD') | adduser -s /bin/bash '$CONTAINER_USERNAME' &&
		echo '$CONTAINER_USERNAME ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers;
	fi;

	ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime &&
	su -c \"cd; screen -t novnc sh $SCRIPT_VNC\" '$CONTAINER_USERNAME'" > "$CONTAINER_VOLUME/$SCRIPT_INIT"
}

function create_script_debian() {
	echo "apt update &&
	apt install bash bash-completion sudo screen man-db busybox \
	xsel xclip xdotool xserver-xorg-core \
	i3-wm libnotify-bin dunst dmenu fonts-noto-core fonts-noto-cjk fonts-noto-extra \
	tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension remmina remmina-plugin-vnc remmina-plugin-rdp \
	rxvt-unicode \
	p7zip-full unrar \
	openssl openssh-server rsync sshfs wget curl netcat-openbsd firefox-esr \
	maim imagemagick feh ffmpeg \
	vim jq git build-essential python3 python3-pip pipx -y &&

	if [ ! \$(id -u '$CONTAINER_USERNAME') ]; then
		useradd -m -s /bin/bash '$CONTAINER_USERNAME' &&
		echo '$CONTAINER_USERNAME ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers;
	fi;

	ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime &&
	su -c \"cd; screen -t novnc sh $SCRIPT_VNC\" '$CONTAINER_USERNAME'" > "$CONTAINER_VOLUME/$SCRIPT_INIT"
}

# if container data is not existed, then
if [ ! -d "$CONTAINER_VOLUME" ]; then
	# create directory
	mkdir -p "$CONTAINER_VOLUME"

	# download dotfiles
	cd "$CONTAINER_VOLUME"
	curl -L https://github.com/tr1nh/dotfiles/archive/refs/heads/master.tar.gz | tar zxv --strip-components=1

	# download novnc
	git clone --depth=1 https://github.com/novnc/noVNC
	curl -L https://github.com/tr1nh/utils/raw/refs/heads/master/start-novnc.sh -o "$SCRIPT_VNC"
	curl -L https://github.com/tr1nh/utils/raw/refs/heads/master/vnc_mobile.html -o noVNC/vnc_mobile.html

	# create script for initialization
	[ "$CONTAINER_IMAGE" = "alpine" ] && create_script_alpine
	[ "$CONTAINER_IMAGE" = "kalilinux/kali-rolling" ] && create_script_debian
fi

# if container is running, then attach container
if [ $(sudo docker ps | grep -o "$CONTAINER_NAME") ]; then
	echo "container '$CONTAINER_NAME' is running"
	echo "trying to attach container '$CONTAINER_NAME'..."
	sudo docker attach "$CONTAINER_NAME"
	exit 0
fi

# if container is not running, then start and attach container
if [[ $(sudo docker ps -a | grep -o "$CONTAINER_NAME") ]]; then
	echo "container '$CONTAINER_NAME' is stopped"
	echo "trying to start container '$CONTAINER_NAME'..."
	sudo docker start -ai "$CONTAINER_NAME"
	exit 0
fi

# else start new container
sudo docker run --name "$CONTAINER_NAME" --network host --volume "$CONTAINER_VOLUME:/home/$CONTAINER_USERNAME" -it -e TERM=xterm-256color "$CONTAINER_IMAGE" sh "/home/$CONTAINER_USERNAME/$SCRIPT_INIT"

