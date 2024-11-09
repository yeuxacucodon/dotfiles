#!/usr/bin/env bash

DIR="$HOME/Pictures/backgrounds/"

hyprpaper &

sleep 1

if [ -d "$DIR" ]; then
  random_background=$(find "$DIR" -name "bg*" | shuf -n1)
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$random_background"
  hyprctl hyprpaper wallpaper "eDP-1, $random_background"
fi