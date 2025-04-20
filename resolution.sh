#!/bin/bash

# create custom resolution and change to it

if [[ -z $(which cvt) ]]; then
  echo "missing cvt, you should install package xserver-xorg-core or similar"
  exit 1
fi

if [[ -z $(which xrandr) ]]; then
  echo "missing xrandr, you should install package x11-xserver-utils or similar"
  exit 1
fi

if [[ -z $2 ]]; then
  echo "missing resolution, example: resolution 800 800"
  exit 1
fi

width=$1
height=$2

monitor_name=$(xrandr | grep " connected" | cut -f1 -d' ')
new_mode=$(cvt $width $height | sed -n '2s/Modeline //p' | sed 's/"//g')
new_mode_name=$(echo $new_mode | cut -f1 -d' ')

xrandr --newmode $new_mode
xrandr --addmode $monitor_name $new_mode_name
xrandr --output $monitor_name --mode $new_mode_name