#!/usr/bin/env bash

hyprpaper &

sleep 1

hyprctl hyprpaper wallpaper "eDP-1,$(hyprctl hyprpaper listloaded | shuf -n1)"
