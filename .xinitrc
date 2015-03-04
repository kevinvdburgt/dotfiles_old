#!/bin/bash

## Load all fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp $HOME/.fonts
xset fp rehash

## X.org settings
xrdb -merge $HOME/.Xresources &
xsetroot -cursor_name left_ptr &
wmname LG3D &
#unclutter -idle 5 -visible &
numlockonx on &

## Keyboard setup, bind CAPSLOCK to ESC and set the variant to altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
setxkbmap -option caps:escape &

## Startingup some usefull daemons
udiskie &
pulseaudio --start &
#mpd ~/.config/mpd/mpd.conf &
#mpdscribble &
modipy &

## Eyecandy, not realy essential..
feh --bg-scale $HOME/.config/wallpaper.jpg &
compton --config $HOME/.config/compton.conf &

## Launch the windowmanager and keyboard deamon
sxhkd -f 100 &
bspwm
