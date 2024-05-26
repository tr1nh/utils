#!/bin/bash

# update twince to make sure repositories is updated
apt update && apt upgrade
pkg update
apt update && apt upgrade

# install basic packages
apt install x11-repo termux-api termux-services proot-distro pulseaudio \
tmux screen htop at cronie \
git tree fzf p7zip unrar \
openssl wget curl openssh transmission w3m elinks nmap netcat-openbsd iproute2 httrack \
nano vim neovim emacs figlet poppler mupdf-tools imagemagick gifsicle ffmpeg \
man bat termimage catimg timg mediainfo mpv cmus \
build-essential python nodejs jq tidy ghostscript \
nudoku nethack -y

# configuration and dotfiles
echo "extra-keys = [[ESC, TAB, CTRL, ALT, {key: 'LEFT', popup: 'HOME'}, {key: 'DOWN', popup: 'PGDN'}, {key: 'UP', popup: 'PGUP'}, {key: 'RIGHT', popup: 'END'}]]" >> ~/.termux/termux.properties
sh -c "$(curl -sL https://raw.githubusercontent.com/tr1nh/utils/master/install-dotfiles.sh)"

# shortcuts
mkdir /storage/emulated/0/.tr1nh
ln -s /storage/emulated/0
ln -s /storage/emulated/0/.tr1nh
ln -s $TMPDIR

# install alpine linux
proot-distro install alpine
proot-distro login alpine -- apk update
proot-distro login alpine -- apk add sudo bash tmux screen tigervnc xvfb x11vnc xrandr xdotool xclip xterm openbox i3wm ttf-freefont font-terminus font-noto git 7zip gvim imagemagick ffmpeg mupdf-tools poppler-utils libreoffice gimp inkscape wget curl openssh nmap netcat-openbsd w3m tidyhtml jq firefox mediainfo catimg feh mpv build-base nodejs npm python3 nethack

# install backtrack linux
echo "
DISTRO_NAME=\"Backtrack\"
DISTRO_COMMENT=\"Backtrack Linux\"

TARBALL_URL['aarch64']=\"https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-minimal.tar.xz\"
TARBALL_SHA256['aarch64']=\"$(curl -sL https://kali.download/nethunter-images/current/rootfs/SHA256SUMS | grep -i "arm64-minimal" | cut -d " " -f 1)\"
" >> ~/../usr/etc/proot-distro/backtrack.sh
proot-distro install backtrack

# backup
cd ~/..
tar -zcvf /storage/emulated/0/.backup-termux.tar.gz usr/ home/
tar -zcvf /storage/emulated/0/.backup-termux-home.tar.gz home/
proot-distro backup --output /storage/emulated/0/.backup-alpine.tar.gz alpine
