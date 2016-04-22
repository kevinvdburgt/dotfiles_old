#!/bin/bash
#
# Lemonbar parser

# Load the lemonbar config
source $(dirname $0)/config.sh

while read -r line; do
  case $line in
    DAT*)
      DAT="${line#???}"
      ;;

    W*)
      WMI=("" "" "")
      CM=0
      MSG=${line#?}

      IFS=':'
      set -- ${line#?}
      while [ $# -gt 0 ]; do
        ITEM=$1
        NAME=${ITEM#?}
        case $ITEM in
          [Mm]*) # Current monitor
            CM="${NAME}"
            ;;

          O*|F*|U*) # Focussed occupied desktop, Focussed free desktop, Focussed urgent desktop
            # WMI[CM]="${WMI[CM]}%{F${COLOR_BLUE} B${COLOR_BLUE_DARKER}}${SEP_RIGHT}%{F${COLOR_BACKGROUND} B${COLOR_BLUE_DARKER}} ${NAME} %{F${COLOR_BLUE_DARKER} B${COLOR_BLUE}}"
            # wsp="${wsp}%{F${color_head} B${color_wsp}}${sep_right}%{F${color_back} B${color_wsp} T1} ${1#???} %{F${color_wsp} B${color_head}}${sep_right}"
            # time="%{F${color_head}}${sep_left}%{F${color_back} B${color_head}} ${sys_arr[3]} %{F- B-}"
            WMI[CM]="${WMI[CM]}%{+u} ${NAME} %{-u}"
            ;;

          o*|f*|u*) # Occupied desktop, Free desktop, Urgent desktop
            # WMI[CM]="${WMI[CM]}%{F${COLOR_BLUE} B${COLOR_BLUE_DARKER}}${SEP_RIGHT}%{F${COLOR_BACKGROUND} B${COLOR_BLUE_LIGHTER}} ${NAME} %{F${COLOR_BLUE_DARKER} B${COLOR_BLUE}}"
            WMI[CM]="${WMI[CM]} ${NAME} "
            ;;
        esac
        shift
      done
  esac

  if [ $MONITORS -eq 1 ]; then
    printf "%s" "TODO: Display for single monitor"
  elif [ $MONITORS -eq 2 ]; then
    printf "%s" "TODO: Display for dual monitors"
  elif [ $MONITORS -eq 3 ]; then
    # Screen 1, left
    printf "%s" "%{S0}%{l}"
    printf "%s" "${WMI[0]}"

    # Screen 1, right
    printf "%s" "%{S0}%{r}"
    printf "%s" ""

    # Screen 2, left
    printf "%s" "%{S1}%{l}"
    printf "%s" "${WMI[1]}"

    # Screen 2, right
    printf "%s" "%{S1}%{r}"
    printf "%s" "%{F${COLOR_BLUE}}${SEP_LEFT}%{F${COLOR_BACKGROUND} B${COLOR_BLUE}} ${DAT} %{F- B-}"

    # Screen 3, left
    printf "%s" "%{S2}%{l}"
    printf "%s" "${WMI[2]}"

    # Screen 3, right
    printf "%s" "%{S2}%{r}"
    printf "%s" ""
  else
    printf "%s" "TODO: No support for ${MONITORS} monitors"
  fi

  printf "%s\n" ""

done
