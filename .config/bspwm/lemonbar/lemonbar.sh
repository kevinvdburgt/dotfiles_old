#!/bin/bash

LEMONBAR_FIFO=/tmp/lemonbar-fifo
LEMONBAR_HEIGHT=16
LEMONBAR_FOREGROUND="#FFFAFAFA"
LEMONBAR_BACKGROUND="#FF202028"
LEMONBAR_FONT="-misc-ohsnap-medium-r-normal--11-79-100-100-c-60-iso8859-1"
LEMONBAR_MONITORCOUNT=$(bspc query -M | wc -l)

# Check if the lemonbar is running already
if [ $(pgrep -cx lemonbar.sh) -gt 1 ]; then
  printf "%s\n" "The lemonbar is already running." >&2
  exit 1
fi

# Trap the lemonbar
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

# Remove the old fifo file if it still exists, then create a new one
[ -e "$LEMONBAR_FIFO" ] && rm "$LEMONBAR_FIFO"
mkfifo "$LEMONBAR_FIFO"

# Tell BSPWM what we want to add a padding to our WM and subscribe the events
bspc config top_padding $LEMONBAR_HEIGHT
bspc subscribe report > "$LEMONBAR_FIFO" &

# Subscribe the xtitle process to the fifo file
xtitle -sf 'XTI%s' > "$LEMONBAR_FIFO" &

# Keep the bar updated every second
while true; do
  printf "%s%s\n" "DAT" "$(date +'%d-%m-%y %H:%M:%S')" > "$LEMONBAR_FIFO"
  printf "%s%s\n" "VOL" "$(volumecontrol get)" > "$LEMONBAR_FIFO"
  sleep 1s
done &

# Execute the fifo file to the lemonbar
cat "$LEMONBAR_FIFO" | \
  `dirname $0`/lemonbar_display.sh $LEMONBAR_MONITORCOUNT | \
  lemonbar \
    -g x$LEMONBAR_HEIGHT \
    -F "$LEMONBAR_FOREGROUND" \
    -B "$LEMONBAR_BACKGROUND" \
    -f "$LEMONBAR_FONT" \
    -p

wait
