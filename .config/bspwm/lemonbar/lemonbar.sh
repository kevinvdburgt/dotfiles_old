#!/bin/bash
#
# Lemonbar

# Load the lemonbar config
source $(dirname $0)/config.sh

# Check if this script is already running, if so exit it with status code 1
if [ $(pgrep -cx $(basename $0)) -gt 1 ]; then
  printf "%s\n" "The lemonbar is already running." >&2
  exit 1
fi

# Trap the this script
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

# Remove the old panel fifo and create a new fifo file
[ -e "${PANEL_FIFO}" ] && rm "${PANEL_FIFO}"
mkfifo "${PANEL_FIFO}"

# Setup bspwm padding
bspc config top_padding "${GEOMETRY}"

# Event registration and binding
while true; do
  printf "%s%s\n" "DAT" "$(date +'%d-%m-%y %H:%M:%S')" > "${PANEL_FIFO}"
  sleep 1s
done &

bspc subscribe report > "${PANEL_FIFO}" &
xtitle -sf 'XTI%s' > "${PANEL_FIFO}" &

# Run the bar, pipe the fifo through the lemonbar parser and then pipe it into
# the lemonbar.
cat "${PANEL_FIFO}" | $(dirname $0)/parser.sh | lemonbar \
  -p \
  -f "${TEXTFONT}" \
  -f "${ICONFONT}" \
  -g "x${GEOMETRY}" \
  -B "${COLOR_BACKGROUND}" \
  -F "${COLOR_FOREGROUND}" \
  | $(dirname $0)/execute.sh &

wait
