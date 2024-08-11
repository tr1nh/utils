#!/bin/bash

CONTAINER_DIR=$HOME/.containers/dev-env/root

# check docker container existed
if [ -d $CONTAINER_DIR ]; then
	echo "$CONTAINER_DIR created"
else
	mkdir -p $CONTAINER_DIR 

	cd $CONTAINER_DIR
	curl -L https://github.com/tr1nh/dotfiles/archive/refs/heads/master.tar.gz | tar zxv --strip-components=1
fi

# create initialize script
cat <<EOF> $CONTAINER_DIR/init-container.sh
apk update && apk add tigervnc i3wm xrandr xclip firefox font-noto bash bash-completion tzdata sudo screen openssl openssh netcat-openbsd curl 7zip git vim neovim jq python3 nodejs npm && ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime; cd && echo root:changeme | chpasswd && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && ssh-keygen -A && /usr/sbin/sshd -p 8024 && screen ssh -N -R 8024:localhost:8024 -N zero@tr1nh.net -p 8022
EOF

# check docker running
if docker ps -a | grep -o dev-env; then
	if docker ps | grep -o dev-env; then
		echo "container running..."
		exit 0
	else
		docker start dev-env
		docker exec -it dev-env sh /root/init-container.sh
	fi
else
	docker run --name dev-env --network host --volume $CONTAINER_DIR:/root -d -it -e TERM=xterm-256color alpine sh
	docker exec -it dev-env sh /root/init-container.sh
fi
