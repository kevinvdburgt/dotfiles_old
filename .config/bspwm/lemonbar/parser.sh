#!/bin/bash
#
# Lemonbar parser

# Load the lemonbar config
source $(dirname $0)/config.sh

while read -r line; do
  case $line in
    DAT*) # Date and time
      DAT="${line#???}"
      ;;

    XTI*) # xtitle
      XTI="${line#???}"
      ;;

    W*) # Workspaces
      WSP=("" "" "")
      WSPT=("%{F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}} [ ] %{F- B-}%{F- B-}%{F${COLOR_WSP_INACTIVE} B${COLOR_BACKGROUND}}${SEP_RIGHT}%{F- B-}" "%{F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}} [ ] %{F- B-}%{F- B-}%{F${COLOR_WSP_INACTIVE} B${COLOR_BACKGROUND}}${SEP_RIGHT}%{F- B-}" "%{F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}} [ ] %{F- B-}%{F- B-}%{F${COLOR_WSP_INACTIVE} B${COLOR_BACKGROUND}}${SEP_RIGHT}%{F- B-}")
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
            WSP[CM]="%{T2 F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}} ${ICON_WSP} %{T- F- B-}"
            ;;

          O*|F*|U*) # Focussed occupied desktop, Focussed free desktop, Focussed urgent desktop
            WSP[CM]="${WSP[CM]}%{F${COLOR_WSP_INACTIVE} B${COLOR_WSP_ACTIVE}}${SEP_RIGHT}%{F- B-}%{F${COLOR_BACKGROUND} B${COLOR_WSP_ACTIVE}} ${NAME} %{F- B-}%{F${COLOR_WSP_ACTIVE} B${COLOR_WSP_INACTIVE}}${SEP_RIGHT}%{F- B-}"
            ;;

          o*|f*|u*) # Occupied desktop, Free desktop, Urgent desktop
            WSP[CM]="${WSP[CM]}%{F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}}  ${NAME}  %{F- B-}"
            ;;

          T*) # Tiling mode
            WSPT[CM]="%{F${COLOR_BACKGROUND} B${COLOR_WSP_INACTIVE}} [$NAME] %{F- B-}%{F- B-}%{F${COLOR_WSP_INACTIVE} B${COLOR_BACKGROUND}}${SEP_RIGHT}%{F- B-}"
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
    printf "%s" "${WSP[0]}${WSPT[0]}"

    # Screen 1, right
    printf "%s" "%{S0}%{r}"
    printf "%s" ""

    # Screen 2, left
    printf "%s" "%{S1}%{l}"
    printf "%s" "${WSP[1]}${WSPT[1]} ${XTI}"

    # Screen 2, right
    printf "%s" "%{S1}%{r}"
    printf "%s" "[+] "
    printf "%s" "CPU: 34% ${SEP_L_LEFT} RAM: 23% "
    printf "%s" "%{F${COLOR_BLUE}}${SEP_LEFT}%{F${COLOR_BACKGROUND} B${COLOR_BLUE}} ${DAT} %{F- B-}"
    printf "%s" "%{F${COLOR_BLUE_DARKER} B${COLOR_BLUE}}${SEP_LEFT}%{F${COLOR_FOREGROUND} B${COLOR_BLUE_DARKER}} %{A:lock:}${ICON_LOCK}%{A} %{F- B-}"
    # printf "%s" " %{A:lock:}[LOCK]%{A} "

    # Screen 3, left
    printf "%s" "%{S2}%{l}"
    printf "%s" "${WSP[2]}${WSPT[2]}"

    # Screen 3, right
    printf "%s" "%{S2}%{r}"
    printf "%s" ""
  else
    printf "%s" "TODO: No support for ${MONITORS} monitors"
  fi

  printf "%s\n" ""

done
