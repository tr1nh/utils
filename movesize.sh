#!/usr/bin/env bash

# resize a floating window in X11

read -r X Y W H < <(slop -f "%x %y %w %h" -t 0 -b 4 -q)

target=$(xdotool getwindowfocus)

xdotool windowsize $target $W $H windowmove $target $X $Y

