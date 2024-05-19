#!/bin/bash

# create a new VNC session with i3 window manager
# and noVNC web client

_NOVNC_PATH="$HOME/noVNC"
_DISPLAY=:1
_GEOMETRY=800x600
_PORT=8901

if [ -f ~/.vnc/passwd ]; then
    echo "VNC password already set"
else
  echo "Input VNC password:"
  vncpasswd
fi

${_NOVNC_PATH}/utils/novnc_proxy --listen ${_PORT} --vnc localhost:5901 &
Xvnc ${_DISPLAY} -geometry ${_GEOMETRY} -rfbauth ~/.vnc/passwd &

sleep 2
DISPLAY=${_DISPLAY} i3
