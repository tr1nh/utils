#!/bin/sh

# install package
curl -sL https://github.com/tr1nh/utils/raw/refs/heads/master/install-kali-package.sh | sh

# gen locale
sed "$(grep -n en_US.UTF /etc/locale.gen | cut -d: -f 1)s/# //" -i /etc/locale.gen && locale-gen
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# download firefox
curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&lang=en-US&os=linux64" | tar xJ && mv firefox /opt/

# add default user
grep friend /etc/passwd || (useradd -m -s /bin/bash friend; echo "friend ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers; echo "friend:changeme" | chpasswd)

# download dotfiles
curl -L https://github.com/tr1nh/dotfiles/archive/refs/heads/master.tar.gz | tar zxv -C /home/friend/ --strip-components=1
curl -L https://github.com/tr1nh/utils/raw/refs/heads/master/start-novnc.sh -o /home/friend/.local/bin/start-novnc
chmod +x /home/friend/.local/bin/start-novnc

# generate default vnc password
(echo "changeme"; echo "changeme"; echo "n") | vncpasswd /home/friend/.passwd

# chown user home dir
chown -R friend /home/friend
