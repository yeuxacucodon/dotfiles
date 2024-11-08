#!/usr/bin/env bash

hyprctl hyprpaper wallpaper "eDP-1,$(hyprctl hyprpaper listloaded | shuf -n1)"
