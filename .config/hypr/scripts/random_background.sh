#!/usr/bin/env bash

DIR="$HOME/backgrounds/"
LAST_BG_FILE="/tmp/last_background"

if [ ! $(pgrep -x hyprpaper) ]; then
  hyprpaper &
  sleep 1
fi

if [ -d "$DIR" ]; then
  while true; do
    random_background=$(find "$DIR" -name "bg*" | shuf -n1)
    [[ ! -f "$LAST_BG_FILE" || "$random_background" != "$(cat "$LAST_BG_FILE")" ]] && break
  done
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$random_background"
  hyprctl hyprpaper wallpaper "eDP-1, $random_background"
  echo "$random_background" >"$LAST_BG_FILE"
  notify-send "Background changed"
fi
