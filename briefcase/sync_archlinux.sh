#!/bin/bash

# Install new packages from pacman
sudo pacman -Syu

# Install new packages from yaourt
yaourt -Syua

# Symlink the dotfiles
briefcase_symlink $HOME/.dotfiles/.Xresources               $HOME/.Xresources
briefcase_symlink $HOME/.dotfiles/.bash_profile             $HOME/.bash_profile
briefcase_symlink $HOME/.dotfiles/.gtkrc-2.0                $HOME/.gtkrc-2.0
briefcase_symlink $HOME/.dotfiles/.xinitrc                  $HOME/.xinitrc

briefcase_symlink $HOME/.dotfiles/.config/bspwm             $HOME/.config/bspwm
briefcase_symlink $HOME/.dotfiles/.config/sxhkd             $HOME/.config/sxhkd
briefcase_symlink $HOME/.dotfiles/.config/gtk-3.0           $HOME/.config/gtk-3.0
briefcase_symlink $HOME/.dotfiles/.config/compton.conf      $HOME/.config/compton.conf

briefcase_symlink $HOME/.dotfiles/.scripts                  $HOME/.scripts
briefcase_symlink $HOME/.dotfiles/.fonts                    $HOME/.fonts

# Check git source projects and execute commands when there is a update available
briefcase_git https://github.com/baskerville/bspwm.git bspwm 'make && cp -u bspwm bspc $HOME/.bin'
briefcase_git https://github.com/baskerville/sxhkd.git sxhkd 'make && cp -u sxhkd $HOME/.bin'
briefcase_git https://github.com/LemonBoy/bar.git bar 'make && cp -u lemonbar $HOME/.bin'
briefcase_git https://github.com/baskerville/xtitle.git xtitle 'make && cp -u xtitle $HOME/.bin'

## Wallpaper update
#if [ ! "$(briefcase_get $BRIEFCASE_CONFIG_FILE wallpaper)" = $BRIEFCASE_WALLPAPER ]; then
#  briefcase_set $BRIEFCASE_CONFIG_FILE wallpaper $BRIEFCASE_WALLPAPER
#fi
