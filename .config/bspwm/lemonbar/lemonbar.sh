#!/bin/bash

LEMONBAR_FIFO=/tmp/lemonbar-fifo
LEMONBAR_HEIGHT=14
LEMONBAR_FOREGROUND="#FFFFFFFF"
LEMONBAR_BACKGROUND="#FF121519"
LEMONBAR_TEXT_FONT="berry:size=8"
LEMONBAR_ICON_FONT="-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"

# Check if the lemonbar is already running
if [ $(pgrep -cx lemonbar.sh) -gt 1 ]; then
  printf "%s\n" "The lemonbar.sh is already running." >&2
  exit 1
fi

# Trap the lemonbar script
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

# Remove the old fifo file if it still exists, then create a new clean one
[ -e "$LEMONBAR_FIFO" ] && rm "$LEMONBAR_FIFO"
mkfifo "$LEMONBAR_FIFO"

# Set a top padding for bspwm
bspc config top_padding $LEMONBAR_HEIGHT

# Subscripe the bspc events to the fifo file
bspc subscribe report > "$LEMONBAR_FIFO" &

# Subscribe the xtitle to the fifo file
xtitle -sf 'XTI%s' > "$LEMONBAR_FIFO" &

echo " [ Power: 045% ]" | lemonbar-xft \
  -g x$LEMONBAR_HEIGHT \
  -F "$LEMONBAR_FOREGROUND" \
  -B "$LEMONBAR_BACKGROUND" \
  -f "$LEMONBAR_TEXT_FONT" \
  -f "$LEMONBAR_ICON_FONT" \
  -p

wait




# LEMONBAR_FIFO=/tmp/lemonbar-fifo
# LEMONBAR_HEIGHT=16
# LEMONBAR_FOREGROUND="#FFFAFAFA"
# LEMONBAR_BACKGROUND="#FF202028"
# LEMONBAR_FONT="-misc-ohsnap-medium-r-normal--11-79-100-100-c-60-iso8859-1"
# LEMONBAR_MONITORCOUNT=$(bspc query -M | wc -l)
#
# # Check if the lemonbar is running already
# if [ $(pgrep -cx lemonbar.sh) -gt 1 ]; then
#   printf "%s\n" "The lemonbar is already running." >&2
#   exit 1
# fi
#
# # Trap the lemonbar
# trap 'trap - TERM; kill 0' INT TERM QUIT EXIT
#
# # Remove the old fifo file if it still exists, then create a new one
# [ -e "$LEMONBAR_FIFO" ] && rm "$LEMONBAR_FIFO"
# mkfifo "$LEMONBAR_FIFO"
#
# # Tell BSPWM what we want to add a padding to our WM and subscribe the events
# bspc config top_padding $LEMONBAR_HEIGHT
# bspc subscribe report > "$LEMONBAR_FIFO" &
#
# # Subscribe the xtitle process to the fifo file
# xtitle -sf 'XTI%s' > "$LEMONBAR_FIFO" &
#
# # Keep the bar updated every second
# while true; do
#   printf "%s%s\n" "DAT" "$(date +'%d-%m-%y %H:%M:%S')" > "$LEMONBAR_FIFO"
#   printf "%s%s\n" "VOL" "$(volumecontrol get)" > "$LEMONBAR_FIFO"
#   sleep 1s
# done &
#
# # Execute the fifo file to the lemonbar
# cat "$LEMONBAR_FIFO" | \
#   `dirname $0`/lemonbar_display.sh $LEMONBAR_MONITORCOUNT | \
#   lemonbar \
#     -g x$LEMONBAR_HEIGHT \
#     -F "$LEMONBAR_FOREGROUND" \
#     -B "$LEMONBAR_BACKGROUND" \
#     -f "$LEMONBAR_FONT" \
#     -p
#
# wait
