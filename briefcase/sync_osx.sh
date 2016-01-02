#!/bin/bash

# Symlink the dotfiles
briefcase_symlink $HOME/.dotfiles/.bash_profile             $HOME/.bash_profile

briefcase_symlink $HOME/.dotfiles/.scripts                  $HOME/.scripts

## Wallpaper update
#if [ ! "$(briefcase_get $BRIEFCASE_CONFIG_FILE wallpaper)" = $BRIEFCASE_WALLPAPER ]; then
#  briefcase_set $BRIEFCASE_CONFIG_FILE wallpaper $BRIEFCASE_WALLPAPER
#fi
