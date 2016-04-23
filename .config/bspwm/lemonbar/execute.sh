#!/bin/bash
#
# Lemonbar executer

# Load the lemonbar config
source $(dirname $0)/config.sh

while read -r line; do
  case $line in
    lock) i3lock ;;
  esac
done
