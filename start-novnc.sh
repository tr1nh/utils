#!/bin/bash

# create a new VNC session with i3 window manager
# and noVNC web client

_NOVNC_PASSWD="$HOME/.passwd"
_NOVNC_PATH="$HOME/noVNC"
_DISPLAY=:1
_GEOMETRY=800x600
_PORT=8901
_VNC_PORT=5901

if [ -f "$_NOVNC_PASSWD" ]; then
    echo "VNC password already set"
else
  echo "Input VNC password:"
  vncpasswd "$_NOVNC_PASSWD"
fi

${_NOVNC_PATH}/utils/novnc_proxy --listen ${_PORT} --vnc "127.0.0.1:$_VNC_PORT" &
Xvnc ${_DISPLAY} -geometry ${_GEOMETRY} -rfbauth "$_NOVNC_PASSWD" -rfbport ${_VNC_PORT} &

sleep 2
DISPLAY=${_DISPLAY} i3
