#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

~/.fehbg &
picom --animations --animation-window-mass 0.5 --animation-for-open-window zoom --animation-stiffness 200 -b
nm-applet &
powerkit &
flameshot &
telegram-desktop &
discord &
