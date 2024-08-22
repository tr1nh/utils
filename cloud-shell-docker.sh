#!/bin/bash

CONTAINER_DIR=$HOME/.containers/dev-env/zero

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
apk update && apk add tigervnc i3wm xrandr rxvt-unicode xclip firefox font-noto bash bash-completion tzdata sudo screen openssl openssh netcat-openbsd curl 7zip git vim neovim jq python3 nodejs npm && ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime; (echo changeme;echo changeme) | adduser -s /bin/bash zero && echo 'zero ALL=(ALL:ALL) ALL' >> /etc/sudoers && ssh-keygen -A && /usr/sbin/sshd -p 8024 && su -c 'screen ssh -N -R 8024:localhost:8024 -N root@tr1nh.net -p 8022' zero
EOF

# check docker running
if docker ps -a | grep -o dev-env; then
        if docker ps | grep -o dev-env; then
                echo "container running..."
                exit 0
        else
                docker start dev-env
                docker exec -it dev-env sh /home/zero/init-container.sh
        fi
else
        docker run --name dev-env --network host --volume $CONTAINER_DIR:/home/zero -d -it -e TERM=xterm-256color alpine sh
        docker exec -it dev-env sh /home/zero/init-container.sh
fi
