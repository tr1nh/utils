#!/bin/bash

# a script to create an Alpine container
# with necessary packages and configurations

CONTAINER_NAME=box-dev
CONTAINER_USERNAME=zero
CONTAINER_PASSWORD=changeme
CONTAINER_VOLUME=$HOME/.containers/$CONTAINER_NAME/$CONTAINER_USERNAME
SCRIPT_INIT=.start-alpine.sh
SCRIPT_VNC=.start-vnc.sh


# if container is running, then attach container
if [ $(docker ps | grep -o "$CONTAINER_NAME") ]; then
	echo "container '$CONTAINER_NAME' is running"
	echo "trying to attach container '$CONTAINER_NAME'..."
	docker exec -it "$CONTAINER_NAME" su -c 'cd && tmux' "$CONTAINER_USERNAME"
	exit 0
fi

# if container is not running, then remove container
if [ $(docker ps -a | grep -o "$CONTAINER_NAME") ]; then
	echo "container '$CONTAINER_NAME' is stopped"
	echo "trying to remove container '$CONTAINER_NAME'..."
	docker rm "$CONTAINER_NAME"
fi

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
	echo "apk update &&
	apk add xsel xclip xdotool xrandr tigervnc i3wm xterm firefox font-noto-all bash bash-completion tzdata sudo screen tmux openssl openssh netcat-openbsd curl 7zip git vim neovim jq python3 py3-pip nodejs npm &&
	ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime &&
	(echo '$CONTAINER_PASSWORD';echo '$CONTAINER_PASSWORD') | adduser -s /bin/bash '$CONTAINER_USERNAME' &&
	echo '$CONTAINER_USERNAME ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers &&
	ssh-keygen -A &&
	/usr/sbin/sshd -p 8022 &&	
	su -c \"cd; tmux new -s 0 'sh $SCRIPT_VNC; $0'\" '$CONTAINER_USERNAME'" > "$CONTAINER_VOLUME/$SCRIPT_INIT"
fi

# start container
docker run --rm --name "$CONTAINER_NAME" --network host --volume "$CONTAINER_VOLUME:/home/$CONTAINER_USERNAME" -it -e TERM=xterm-256color alpine sh "/home/$CONTAINER_USERNAME/$SCRIPT_INIT"

