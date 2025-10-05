#!/bin/bash

# create a new VNC session with i3 window manager
# and noVNC web client

_NOVNC_PASSWD="$HOME/.passwd"
_NOVNC_PATH="$HOME/noVNC"
_DISPLAY=:1
_GEOMETRY=800x800
_PORT=8080
_VNC_PORT=5901

if [ -f "$_NOVNC_PASSWD" ]; then
  echo "VNC password already set"
else
  echo "Input VNC password:"
  vncpasswd "$_NOVNC_PASSWD"
fi

if [[ ! -d "$HOME/noVNC" ]]; then
  git clone --depth=1 https://github.com/novnc/noVNC "$HOME/noVNC"
  curl -L https://raw.githubusercontent.com/tr1nh/utils/master/vnc_mobile.html -o "$HOME/noVNC/vnc_mobile.html"
fi

${_NOVNC_PATH}/utils/novnc_proxy --listen ${_PORT} --vnc "127.0.0.1:$_VNC_PORT" &
Xvnc ${_DISPLAY} -geometry ${_GEOMETRY} -rfbauth "$_NOVNC_PASSWD" -rfbport ${_VNC_PORT} -AcceptCutText 0 -SendCutText 0 &

sleep 2
DISPLAY=${_DISPLAY} i3
