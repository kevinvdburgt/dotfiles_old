#!/bin/bash
#
# Lemonbar configuration

# General settings
PANEL_FIFO="/tmp/lemonbar_fifo_${USER}"
GEOMETRY="14"
TEXTFONT="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
ICONFONT="-xos4-terminusicons2mono-medium-r-normal--12-120-72-72-m-60-iso8859-1"
WIDTH=$(xrandr | grep "current" | awk '{print $8a}')
MONITORS=$(bspc query -M | wc -l)
SPACER=" "

# Colors
COLOR_BACKGROUND="#FF1D1F21"
COLOR_FOREGROUND="#FFC5C8C6"
COLOR_BLUE="#FF1793d0"
COLOR_BLUE_LIGHTER="#FF1ba3e6"
COLOR_BLUE_DARKER="#FF1483b9"

# Char glyps for powerline fonts
SEP_LEFT=""                        # Powerline separator left
SEP_RIGHT=""                       # Powerline separator right
SEP_L_LEFT=""                      # Powerline light separator left
SEP_L_RIGHT=""                     # Powerline light sepatator right

# Icon glyphs from Terminusicons2
ICON_CLOCK="%{T2}Õ%{T-}"                      # Clock icon
ICON_CPU="Ï"                        # CPU icon
ICON_MEM="Þ"                        # MEM icon
ICON_DL="Ð"                         # Download icon
ICON_UL="Ñ"                         # Upload icon
ICON_VOL="Ô"                        # Volume icon
ICON_HD="À"                         # HD / icon
ICON_HOME="Æ"                       # HD /home icon
ICON_MAIL="Ó"                       # Mail icon
ICON_CHAT="Ò"                       # IRC/Chat icon
ICON_MUSIC="Î"                      # Music icon
ICON_PROG="Â"                       # Window icon
ICON_CONTACT="Á"                    # Contact icon
ICON_WSP="É"                        # Workspace icon
