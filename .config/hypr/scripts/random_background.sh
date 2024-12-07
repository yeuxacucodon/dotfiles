#!/usr/bin/env bash

DIR="$HOME/Pictures/backgrounds/"

if [ ! $(pgrep -x hyprpaper) ]; then
	hyprpaper &
	sleep 1
fi

if [ -d "$DIR" ]; then
	notify-send "Background changed"
	random_background=$(find "$DIR" -name "bg*" | shuf -n1)
	hyprctl hyprpaper unload all
	hyprctl hyprpaper preload "$random_background"
	hyprctl hyprpaper wallpaper "eDP-1, $random_background"
fi
