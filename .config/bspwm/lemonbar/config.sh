#!/bin/bash
#
# Lemonbar configuration

# General settings
PANEL_FIFO="/tmp/lemonbar_fifo_${USER}"
GEOMETRY="14"
TEXTFONT="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
ICONFONT="-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"
WIDTH=$(xrandr | grep "current" | awk '{print $8a}')
MONITORS=$(bspc query -M | wc -l)
SPACER=" "

# Colors
COLOR_BACKGROUND="#FF1D1F21"
COLOR_FOREGROUND="#FFC5C8C6"
COLOR_BLUE="#FF1793d0"
COLOR_BLUE_LIGHTER="#FF1ba3e6"
COLOR_BLUE_DARKER="#FF1483b9"

COLOR_WSP_ACTIVE="#FF93D017"
COLOR_WSP_INACTIVE="#FF73A212"

# Char glyps for powerline fonts
SEP_LEFT=""                        # Powerline separator left
SEP_RIGHT=""                       # Powerline separator right
SEP_L_LEFT=""                      # Powerline light separator left
SEP_L_RIGHT=""                     # Powerline light sepatator right

# Icon glyphs from Terminusicons2
# ICON_CLOCK="%{T2}Õ%{T-}"            # Clock icon
# ICON_CPU="Ï"                        # CPU icon
# ICON_MEM="Þ"                        # MEM icon
# ICON_DL="Ð"                         # Download icon
# ICON_UL="Ñ"                         # Upload icon
# ICON_VOL="Ô"                        # Volume icon
# ICON_HD="À"                         # HD / icon
# ICON_HOME="Æ"                       # HD /home icon
# ICON_MAIL="Ó"                       # Mail icon
# ICON_CHAT="Ò"                       # IRC/Chat icon
# ICON_MUSIC="Î"                      # Music icon
# ICON_PROG="Â"                       # Window icon
# ICON_CONTACT="Á"                    # Contact icon
# ICON_WSP="É"                        # Workspace icon

# Icon glyphs from Siji
ICON_POWER=""
ICON_LOCK=""
ICON_CPU=""
ICON_RAM=""
ICON_ARCH=""
ICON_MUSIC=""

COLOR_BACK="#FF1D1F21"              # Default background
COLOR_FORE="#FFC5C8C6"              # Default foreground
COLOR_HEAD="#FFB5BD68"              # Background for first element
COLOR_SEC_B1="#FF282A2E"            # Background for section 1
COLOR_SEC_B2="#FF454A4F"            # Background for section 2
COLOR_SEC_B3="#FF60676E"            # Background for section 3
COLOR_ICON="#FF979997"              # For icons
COLOR_MAIL="#FFCE935F"              # Background color for mail alert
COLOR_CHAT="#FFCC6666"              # Background color for chat alert
COLOR_CPU="#FF5F819D"               # Background color for cpu alert
COLOR_NET="#FF5E8D87"               # Background color for net alert
COLOR_DISABLE="#FF1D1F21"           # Foreground for disable elements
COLOR_WSP="#FF8C9440"               # Background for selected workspace
