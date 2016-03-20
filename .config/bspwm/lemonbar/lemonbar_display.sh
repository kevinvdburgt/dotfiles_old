#!/bin/bash

SCREEN_COUNT=$1
SCREEN_OFFSET=' '

while read -r line; do
  case $line in

    # Update the date and time
    DAT*)
      VAR_DAT="${line#???}"
      ;;

    # Update the focussed window title
    XTI*)
      VAR_XTI="${line#???}"
      ;;

    # Update the audio volume
    VOL*)
      VAR_VOL="${line#???}"
      ;;

    # BSPWM Related
    W*)
      wminfo=("" "" "")
      currentMonitor=0
      bspwmMessage=${line#?}

      IFS=':'
      set -- ${line#?}
      while [ $# -gt 0 ]; do
        item=$1
        name=${item#?}
        case $item in

          # Current monitor
          [Mm]*)
            currentMonitor="$name"
            ;;

            # Focussed occupied desktop
            O*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]}%{+u} ${name} %{-u}"
              ;;

            # Focussed free desktop
            F*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]}%{+u} ${name} %{-u}"
              ;;

            # Focussed urgent desktop
            U*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]}%{+u} ${name} %{-u}"
              ;;

            # Occupied desktop
            o*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]} ${name} "
              ;;

            # Free desktop
            f*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]} ${name} "
              ;;

            # Urgent desktop
            u*)
              wminfo[currentMonitor]="${wminfo[$currentMonitor]} ${name} "
              ;;

        esac
        shift
      done
      ;;
  esac

  if [ $SCREEN_COUNT -eq 1 ]; then
    printf "%s" "TODO: Fetch info"
  elif [ $SCREEN_COUNT -eq 2 ]; then
    printf "%s" "TODO: Fetch info"
  elif [ $SCREEN_COUNT -eq 3 ]; then
    # Screen 1 (left)
    printf "%s" "%{S0}%{l}${SCREEN_OFFSET}"
    printf "%s" "${wminfo[0]}"

    # Screen 1 (right)
    printf "%s" "%{S0}%{r}"
    printf "%s" ""

    # Screen 2 (left)
    printf "%s" "${SCREEN_OFFSET}%{S1}%{l}${SCREEN_OFFSET}"
    printf "%s" "${wminfo[1]}- $VAR_XTI"

    # Screen 2 (right)
    printf "%s" "%{S1}%{r}"
    printf "%s" "%{F#f87687}[%{F#FAFAFA} Battery: 100% "
    printf "%s" "%{F#f87687}] [%{F#FAFAFA} Volume: $VAR_VOl% "
    printf "%s" "%{F#f87687}] [%{F#FAFAFA} Date: $VAR_DAT %{F#f87687}]%{F#FAFAFA} "

    # Screen 3 (left)
    printf "%s" "${SCREEN_OFFSET}%{S2}%{l}${SCREEN_OFFSET}"
    printf "%s" "${wminfo[2]}"

    # Screen 3 (right)
    printf "%s" "%{S2}%{r}"
    printf "%s" ""
  fi

  printf "%s\n" "${SCREEN_OFFSET}"

done
