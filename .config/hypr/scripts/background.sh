#!/usr/bin/env bash

if [[ ! $(pgrep -x swww-daemon) ]]; then
  swww-daemon
fi

DIR="$HOME/backgrounds/"
LAST_BG_FILE="/tmp/last_background"

if [ -d "$DIR" ]; then
  while true; do
    random_background=$(fd -tf -a "^*" "$DIR" | shuf -n1)
    [[ ! -f "$LAST_BG_FILE" || "$random_background" != "$(cat "$LAST_BG_FILE")" ]] && break
  done

  swww img --transition-duration 1 --transition-step 20 --transition-type wipe "$random_background"
  echo "$random_background" >"$LAST_BG_FILE"
  notify-send "Background changed"
fi
