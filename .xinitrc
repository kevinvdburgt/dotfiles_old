#!/bin/bash

## Load all fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp $HOME/.fonts
xset fp rehash

## X org settings
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr
wmname LG3D
numlockx

## Keyboard setup
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
setxkbmap -option caps:escape

## Starting up some daemons
#usdiskie &
pulseaudio --start &
#mpd &
#mpdscribble &
#modipy &

bspwm
