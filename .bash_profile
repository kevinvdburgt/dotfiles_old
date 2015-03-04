#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export EDITOR=vim
export PATH=$PATH:$HOME/.bin:$HOME/.scripts

## Bash related
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}

## Aliasses
#alias subl="subl3"
#alias mpc="mpc -h /home/kevin/.config/mpd/socket"
#alias ncmp="ncmpcpp -h /home/kevin/.config/mpd/socket"
