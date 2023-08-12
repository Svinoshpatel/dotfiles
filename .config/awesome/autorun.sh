#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

~/.fehbg &
picom &
flameshot &
telegram-desktop &
discord &
